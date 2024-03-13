-- SCOTT
-- ������ ��¿�(ȭ��)

------------------------------- ȸ�� ��ȸ ---------------------------------------
-- ȸ�� ���������� ��ȸ
CREATE OR REPLACE PROCEDURE up_select_mpage
(
    pmember_num member.member_num%TYPE
)
IS
    vcount_memb_tboard NUMBER;
    vmem_nickname member.member_nickname%TYPE;
    vmem_profile member.member_profile%TYPE;
    vmem_mpoints member.member_manner_points%TYPE;
    vmem_addr   member.member_address%TYPE;
    vbalance danggeun_pay.balance%TYPE;
    v_mem_count NUMBER;
BEGIN
    SELECT COUNT(*)
        INTO v_mem_count
    FROM member
    WHERE member_num = pmember_num;
    
    SELECT m.member_profile, m.member_nickname, m.member_manner_points, t.count_mem_tboard, m.member_address
        INTO  vmem_profile , vmem_nickname, vmem_mpoints, vcount_memb_tboard, vmem_addr
    FROM member m ,(
        SELECT COUNT(t.member_num) count_mem_tboard
        FROM member m JOIN trade_board t ON m.member_num = t.member_num 
        WHERE m.member_num = pmember_num
            ) t
    WHERE m.member_num = pmember_num;
    
    SELECT balance
        INTO vbalance
    FROM danggeun_pay
    WHERE member_num = pmember_num;
    
    DBMS_OUTPUT.PUT( vmem_profile );
    DBMS_OUTPUT.PUT_LINE( vmem_nickname );
    DBMS_OUTPUT.PUT_LINE( '������� �ݾ� : ' || vbalance ||'��');
    DBMS_OUTPUT.PUT_LINE( '�ųʿµ� : ' || vmem_mpoints || '��' );
    DBMS_OUTPUT.PUT_LINE( '�ǸŹ�ǰ : ' ||vcount_memb_tboard || '��' );
    DBMS_OUTPUT.PUT_LINE( '�ּ� : ' || vmem_addr );

--EXCEPTION
END;

EXEC up_select_mpage(1);

--------------------------------------------------------------------------------



------------------------------ ������ ��ȸ --------------------------------------
-- ������ ��ü ��ȸ
CREATE OR REPLACE PROCEDURE up_selAdminAll
IS
    vadmin_nickname admin.admin_nickname%TYPE;
    vadmin_ID admin.admin_ID%TYPE;
    vadmin_password admin.admin_password%TYPE;
BEGIN
    FOR vrow IN (SELECT admin_nickname
                        , admin_id
                        , admin_password
                 FROM admin)
    LOOP
    DBMS_OUTPUT.PUT_LINE('NAME : ' || vrow.admin_nickname);
    DBMS_OUTPUT.PUT_LINE('ID : ' || vrow.admin_id);
    DBMS_OUTPUT.PUT_LINE('admin_password : ' || vrow.admin_password);
    DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�����ڰ� �����ϴ�.');
END;

EXEC up_selAdminAll;

--------------------------------------------------------------------------------



--------------------------------- ���� ��ȸ -------------------------------------
CREATE OR REPLACE PROCEDURE up_selBLOCK
(
    pmember_num NUMBER
)
IS
    vtmember_block NUMBER;
    vfmember_block NUMBER;
    vtnickname member.member_nickname%TYPE;
    vfnickname member.member_nickname%TYPE;
    vmember_num NUMBER;
    
BEGIN
    
    SELECT member_num INTO vmember_num
    FROM member
    WHERE member_num = pmember_num;
    
    SELECT member_nickname INTO vfnickname
    FROM member
    WHERE member_num = pmember_num;
    FOR rec IN(
        SELECT DISTINCT member_nickname INTO vtnickname
        FROM member m JOIN BLOCK b ON m.member_num = t_block_mem_num
    )
    LOOP
        vtnickname := rec.member_nickname;
        DBMS_OUTPUT.PUT_LINE( vfnickname || '�� ' || vtnickname || '�� �����߽��ϴ�');
    END LOOP;
    
END;

EXEC up_selBLOCK(2);

--------------------------------------------------------------------------------



--------------------------- ���� ���� ��ȸ --------------------------------------
-- �������� �Խ��� ��ü ��ȸ
CREATE OR REPLACE PROCEDURE up_selNoticeBoardAll

IS
    vnotice_title notice_board.notice_title%TYPE;
    vnotice_date notice_board.notice_date%TYPE;
    vadmin_nickname admin.admin_nickname%TYPE;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('��������');
    DBMS_OUTPUT.PUT_LINE(' ');
    FOR vrow IN (SELECT notice_title
                , notice_date
                , admin_nickname
                FROM notice_board nb JOIN admin a USING(admin_num)
                ORDER BY vnotice_date
                )
    LOOP
    DBMS_OUTPUT.PUT_LINE('[����] ' || ' ' || vrow.notice_title);
    DBMS_OUTPUT.PUT_LINE('Date : ' || vrow.notice_date || '              ' || 'Writer : '|| vrow.admin_nickname);
    DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('���������� �����ϴ�.');
END;

EXEC up_selNoticeBoardAll;

-- �������� �Խ��� �� ��ȸ
CREATE OR REPLACE PROCEDURE up_selNoticeBoardInfo
(
    pnotice_num notice_board.notice_num%TYPE
)
IS
    vnotice_title notice_board.notice_title%TYPE;
    vnotice_content notice_board.notice_content%TYPE;
    vnotice_date notice_board.notice_date%TYPE;
    vadmin_nickname admin.admin_nickname%TYPE;
    
BEGIN
    SELECT notice_title
    , notice_content
    , notice_date
    , admin_nickname
        INTO vnotice_title, vnotice_content, vnotice_date, vadmin_nickname
    FROM notice_board nb JOIN admin a USING(admin_num)
    WHERE notice_num = pnotice_num;
    DBMS_OUTPUT.PUT_LINE('����');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('Title : ' || vnotice_title);
    DBMS_OUTPUT.PUT_LINE('Date : ' || vnotice_date);
    DBMS_OUTPUT.PUT_LINE('-------------------------');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(vnotice_content);
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('-------------------------');
    DBMS_OUTPUT.PUT_LINE('Writer : ' || vadmin_nickname);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('���������� �����ϴ�.');
END;

EXEC up_selNoticeBoardInfo(1);

--------------------------------------------------------------------------------



-------------------------- �߰�ŷ� �Խ��� ��ȸ ---------------------------------
-- �߰�ŷ� �Խ��� ��ü ��ȸ
DECLARE
  CURSOR trade_board_cursor IS
    SELECT tb.TRADE_NUM,
           m.MEMBER_NICKNAME,
             c.item_ctgr_name,
           tb.TRADE_TITLE,
           tb.TRADE_CONTENT,
           TO_CHAR(tb.UPLOAD_DATE, 'YY-MM-DD') AS UPLOAD_DATE,
           tb.TRADE_PRICE,
           tb.TRADE_LOCATION,
          
           LISTAGG(i.ITEM_IMAGE_URL, ', ') WITHIN GROUP (ORDER BY i.ITEM_IMAGE_NUM) AS IMAGE_URLS
    FROM TRADE_BOARD tb
         JOIN MEMBER m ON tb.MEMBER_NUM = m.MEMBER_NUM
         JOIN ITEM_IMAGE i ON tb.TRADE_NUM = i.TRADE_NUM
         JOIN item_ctgr c ON tb.selitem_ctgr_num = c.item_ctgr_num
    GROUP BY tb.TRADE_NUM, m.MEMBER_NICKNAME,   c.item_ctgr_name, tb.TRADE_TITLE, tb.TRADE_CONTENT, tb.UPLOAD_DATE, tb.TRADE_PRICE, tb.TRADE_LOCATION;

  trade_board_rec trade_board_cursor%ROWTYPE;
BEGIN
  OPEN trade_board_cursor;
  LOOP
    FETCH trade_board_cursor INTO trade_board_rec;
    EXIT WHEN trade_board_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('�ŷ� ��ȣ: ' || trade_board_rec.TRADE_NUM);
    DBMS_OUTPUT.PUT_LINE('ȸ�� �г���: ' || trade_board_rec.MEMBER_NICKNAME);
    DBMS_OUTPUT.PUT_LINE('ī�װ� : ' || trade_board_rec.item_ctgr_name);
    DBMS_OUTPUT.PUT_LINE('����: ' || trade_board_rec.TRADE_TITLE);
    DBMS_OUTPUT.PUT_LINE('����: ' || trade_board_rec.TRADE_CONTENT);
    DBMS_OUTPUT.PUT_LINE('���ε� ����: ' || trade_board_rec.UPLOAD_DATE);
    DBMS_OUTPUT.PUT_LINE('�ŷ� ����: ' || trade_board_rec.TRADE_PRICE);
    DBMS_OUTPUT.PUT_LINE('�ŷ� ��ġ: ' || trade_board_rec.TRADE_LOCATION);
    DBMS_OUTPUT.PUT_LINE('�̹��� URL: ' || trade_board_rec.IMAGE_URLS);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
  END LOOP;
  CLOSE trade_board_cursor;
END;

-- �߰�ŷ� �Խ��� �� ��ȸ
CREATE OR REPLACE PROCEDURE up_selTradeBoard
(
    ptrade_num NUMBER
)
IS
    vtrade_num NUMBER;
BEGIN
    SELECT trade_num INTO vtrade_num
    FROM trade_board
    WHERE trade_num = ptrade_num;
    
    IF vtrade_num = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Trade number ' || ptrade_num || ' does not exist.');
    ELSE
        FOR rec IN (
            SELECT  
                tb.trade_num
                ,(SELECT LISTAGG(ii.item_image_url || CHR(10), ', ') WITHIN GROUP (ORDER BY ii.item_image_url)
                  FROM item_image ii 
                  WHERE ii.trade_num = tb.trade_num
                  GROUP BY ii.trade_num) item_images
                ,m.member_profile member_profile_image
                ,m.member_nickname nickname
                ,SUBSTR(m.member_address, INSTR(m.member_address, '�� ') + 1) address
                ,m.member_manner_points manner_point
                ,tb.trade_title title
                ,ic.item_ctgr_name category_name
                ,CASE 
                    WHEN SYSDATE - TO_DATE(tb.upload_date) < 1 THEN 
                        CASE 
                            WHEN TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24 * 60) >= 60 THEN
                                TRUNC(TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24)) || '�ð� ��'
                            ELSE 
                                TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24 * 60) || '�� ��'
                        END
                    ELSE 
                        TRUNC(SYSDATE - TO_DATE(tb.upload_date)) || '�� ��'
                END time
                ,tb.trade_content content
                ,TO_CHAR(tb.trade_price, '999,999,999') price
                ,COUNT(DISTINCT tbl.member_num) like_count
            FROM 
                item_image ii 
                JOIN trade_board tb ON ii.trade_num = tb.trade_num
                JOIN member m ON m.member_num = tb.member_num
                JOIN item_ctgr ic ON ic.item_ctgr_num = tb.selitem_ctgr_num
                LEFT JOIN trade_board_like tbl ON tbl.trade_num = tb.trade_num
            WHERE 
                tb.trade_num = ptrade_num
            GROUP BY 
                tb.trade_num, m.member_profile, m.member_nickname, tb.trade_price
                ,SUBSTR(m.member_address, INSTR(m.member_address, '�� ') + 1) 
                ,m.member_manner_points, tb.trade_title, ic.item_ctgr_name
                , CASE 
                    WHEN SYSDATE - TO_DATE(tb.upload_date) < 1 THEN 
                        CASE 
                            WHEN TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24 * 60) >= 60 THEN
                                TRUNC(TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24 * 60) / 60) || '�ð� ��'
                            ELSE 
                                TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24 * 60) || '�� ��'
                        END
                    ELSE 
                        TRUNC(SYSDATE - TO_DATE(tb.upload_date)) || '�� ��'
                END
                , tb.trade_content
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Item Image:');
            DBMS_OUTPUT.PUT(rec.item_images);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('Member Profile Image: ' || rec.member_profile_image);
            DBMS_OUTPUT.PUT_LINE('Nickname: ' || rec.nickname);
            DBMS_OUTPUT.PUT_LINE('Address: ' || rec.address);
            DBMS_OUTPUT.PUT_LINE('Manner Point: ' || rec.manner_point);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('Title: ' || rec.title);
            DBMS_OUTPUT.PUT_LINE('Content: ' || rec.content);
            DBMS_OUTPUT.PUT_LINE('PRICE: ' || rec.price || '��');
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('Category Name: ' || rec.category_name);
            DBMS_OUTPUT.PUT_LINE('Time: ' || rec.time);
            DBMS_OUTPUT.PUT_LINE('Like Count: ' || rec.like_count);
        END LOOP;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Trade number ' || ptrade_num || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;

EXEC up_selTradeBoard(1);

-- �߰�ŷ� �Խ��� �˻�
CREATE OR REPLACE PROCEDURE up_searchTradeBoard
(
     psearchCondition VARCHAR2, -- ���ϴ� �˻���
     porder NUMBER DEFAULT 1 --  2�ϰ�� �ֽż����� ����
)
IS
    vitem_image_url VARCHAR2(4000);
    vtrade_title        VARCHAR2(4000);
    vtrade_location          VARCHAR2(4000);
    vtime_since_upload VARCHAR2(4000);
    vprice NUMBER;
    vlike_count NUMBER;
    CURSOR t_trade_board_cur IS
    SELECT item_image_url
    , e.trade_title, e.trade_price, e.trade_location, COUNT(tbl.trade_like_num) like_count,
    CASE
        WHEN (SYSDATE - upload_date) * 24 * 60 >= 1440 THEN -- 1�� �̻�
             TO_CHAR(FLOOR((SYSDATE - upload_date)), 'FM9999') || '�� ��'
        WHEN (SYSDATE - upload_date) * 24 >= 60 THEN -- 1�� �̸�
             TO_CHAR(FLOOR((SYSDATE - upload_date) * 24), 'FM9999') || '�ð� ��'
        ELSE -- 1�ð� �̸�
             TO_CHAR(FLOOR((SYSDATE - upload_date) * 24 * 60), 'FM9999') || '�� ��'
    END vtime_since_upload
    FROM trade_board e LEFT JOIN trade_board_like tbl ON tbl.trade_num = e.trade_num
                        JOIN item_image ii ON e.trade_num = ii.trade_num
    WHERE trade_title LIKE '%' || psearchCondition || '%' 
    GROUP BY item_image_url, e.trade_title, e.trade_price, e.trade_location, upload_date
    ORDER BY CASE WHEN porder = 2 THEN upload_date END DESC;
BEGIN
    OPEN t_trade_board_cur;
    LOOP
        FETCH t_trade_board_cur INTO vitem_image_url, vtrade_title, vprice, vtrade_location, vlike_count, vtime_since_upload;
        EXIT WHEN t_trade_board_cur%NOTFOUND; -- �� �̻� ������ ���� ������ ���� ����
    
    -- ������ �����͸� ���
    DBMS_OUTPUT.PUT_LINE('��ǰ �̹��� : ' || vitem_image_url );
    DBMS_OUTPUT.PUT_LINE('�� ���� : ' || vtrade_title );
    DBMS_OUTPUT.PUT_LINE('���� : ' || vprice );
    DBMS_OUTPUT.PUT_LINE('���ε� ��¥ : ' || vtime_since_upload );   
    DBMS_OUTPUT.PUT_LINE('���ƿ� �� : ' || vlike_count);
    DBMS_OUTPUT.PUT_LINE(' ');
  END LOOP;
  CLOSE t_trade_board_cur;
--EXCEPTION
END;

SELECT * FROM trade_board;

EXEC up_searchTradeBoard('�ƽ�');

--------------------------------------------------------------------------------



-------------------------- ���׻�Ȱ �Խ��� ��ȸ ---------------------------------
-- ���׻�Ȱ �Խ��� ��ü ��ȸ
DECLARE
  CURSOR comm_board_cursor IS
    SELECT cb.COMM_BOARD_NUM,
           cb.COMM_TITLE,
           cb.COMM_CONTENT,
           TO_CHAR(cb.COMM_UPLOAD_DATE, 'YY-MM-DD') AS UPLOAD_DATE
          -- m.MEMBER_NICKNAME
    FROM comm_board cb
    JOIN member m ON cb.MEMBER_NUM = m.MEMBER_NUM;
  comm_board_rec comm_board_cursor%ROWTYPE;
  board_number NUMBER := 0;
BEGIN
  OPEN comm_board_cursor;
  LOOP
    FETCH comm_board_cursor INTO comm_board_rec;
    EXIT WHEN comm_board_cursor%NOTFOUND;
    board_number := board_number + 1;
    DBMS_OUTPUT.PUT_LINE('�Խù� ��ȣ: ' || board_number);
    DBMS_OUTPUT.PUT_LINE('�Խù� ����: ' || comm_board_rec.COMM_TITLE);
    DBMS_OUTPUT.PUT_LINE('�Խù� ����: ' || comm_board_rec.COMM_CONTENT);
    DBMS_OUTPUT.PUT_LINE('�Խù� �ۼ���: ' || comm_board_rec.UPLOAD_DATE);
    --DBMS_OUTPUT.PUT_LINE('�Խù� �ۼ���: ' || comm_board_rec.MEMBER_NICKNAME);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
  END LOOP;
  CLOSE comm_board_cursor;
END;

-- ���׻�Ȱ �Խ��� �� ��ȸ
CREATE OR REPLACE PROCEDURE up_selcommboard
(
    pcomm_board_num NUMBER
)
IS 
    vcomm_board_num NUMBER;
BEGIN
    SELECT comm_board_num INTO vcomm_board_num
    FROM comm_board
    WHERE comm_board_num = pcomm_board_num;
    
    FOR com IN ( SELECT  distinct cb.comm_board_num           board_num  --���׻�Ȱ�Խ��ǳѹ�
                    , cc.comm_ctgr_num              ctgr_num  --ī�װ���ȣ
                    , cc.comm_ctgr_name             ctgr_name  --ī�װ��̸�
                    , member_profile                profile  --ȸ���������̹���
                    , member_nickname               nickname  --ȸ���г���
                    , SUBSTR(m.member_address,7)    member_address   --�Խñ�ȸ���ּ�
                    , CASE 
                        WHEN SYSDATE - TO_DATE(cb.comm_upload_date) < 1 and ROUND((SYSDATE - TO_DATE(comm_upload_date)) * 24 ) > 24 THEN TRUNC((SYSDATE - TO_DATE(comm_upload_date)) * 24 * 60) || '�� ��'
                        WHEN SYSDATE - TO_DATE(cb.comm_upload_date) < 1 and ROUND((SYSDATE - TO_DATE(comm_upload_date)) * 24 ) < 24 THEN ROUND((SYSDATE - TO_DATE(comm_upload_date)) * 24 ) || '�ð� ��'
                        WHEN TRUNC(SYSDATE - TO_DATE(comm_upload_date)) < 30 THEN TRUNC(SYSDATE - TO_DATE(comm_upload_date)) || '�� ��'
                        WHEN TRUNC((SYSDATE - TO_DATE(comm_upload_date)) / 30 ) < 12 THEN TRUNC((SYSDATE - TO_DATE(comm_upload_date)) / 30 ) || '���� ��'
                        ELSE TRUNC((SYSDATE - TO_DATE(comm_upload_date)) / 30/12 ) || '�� ��'
                      END upload_date    --���ε�����
                    , cb.comm_title                 title       --�Խñ�����
                    , cb.comm_content               comm_content     --�Խñ۳���
                    , (SELECT distinct COUNT(comm_board_num) FROM comm_board_like cbl where cbl.comm_board_num = cb.comm_board_num  GROUP BY COMM_BOARD_NUM ) board_like_cnt --�Խ������ƿ䰹�� 
                    FROM comm_board cb JOIN comm_ctgr cc ON cb.comm_ctgr_num = cc.comm_ctgr_num 
                               JOIN member m ON cb.member_num = m.member_num 
                               LEFT JOIN comm_board_like bl ON cb.member_num = bl.member_num
                    where cb.comm_board_num = pcomm_board_num             
                   )
    LOOP
     DBMS_OUTPUT.PUT_LINE('ctgr_name : ' || com.ctgr_name); 
     DBMS_OUTPUT.PUT_LINE('profile : ' || com.profile);      
     DBMS_OUTPUT.PUT_LINE( 'nickname : ' ||  com.nickname );   
     DBMS_OUTPUT.PUT_LINE('address : ' || com.member_address);  
     DBMS_OUTPUT.PUT_LINE( 'upload_date : ' ||  com.upload_date );  
     DBMS_OUTPUT.PUT_LINE( 'title : ' ||  com.title );              
     DBMS_OUTPUT.PUT_LINE( 'content : ' ||  com.comm_content ); 
     DBMS_OUTPUT.PUT_LINE(' '); 
    END LOOP;
--EXCEPTION
END;

EXEC up_selcommboard(19);

-- ���׻�Ȱ �Խ��� �˻�
CREATE OR REPLACE PROCEDURE up_searchCommBoard
(
     psearchCondition VARCHAR2, -- ���ϴ� �˻���
     porder NUMBER --  2�ϰ�� �ֽż����� ����
)
IS
    vcomm_title        VARCHAR2(4000);
    vcontent           VARCHAR2(4000);
    vmem_addr          VARCHAR2(4000);
    vtime_since_upload VARCHAR2(4000);
    vlike_count NUMBER;
    vcmt_count NUMBER;
    CURSOR c_comm_board_cur IS
    SELECT e.comm_title, m.member_address, e.comm_content, COUNT(cbl.comm_like_num) like_count
    , COUNT(cc.comm_num) cmt_count,
    CASE
        WHEN (SYSDATE - comm_upload_date) * 24 * 60 >= 1440 THEN -- 1�� �̻�
             TO_CHAR(FLOOR((SYSDATE - comm_upload_date)), 'FM9999') || '�� ��'
        WHEN (SYSDATE - comm_upload_date) * 24 >= 60 THEN -- 1�� �̸�
             TO_CHAR(FLOOR((SYSDATE - comm_upload_date) * 24), 'FM9999') || '�ð� ��'
        ELSE -- 1�ð� �̸�
             TO_CHAR(FLOOR((SYSDATE - comm_upload_date) * 24 * 60), 'FM9999') || '�� ��'
    END vtime_since_upload
    FROM comm_board e JOIN member m ON e.member_num = m.member_num 
                      LEFT JOIN comm_board_like cbl ON cbl.comm_board_num = e.comm_board_num
                      LEFT JOIN comm_cmt cc ON cc.comm_board_num = e.comm_board_num
    WHERE comm_title LIKE '%' || psearchCondition || '%'
    GROUP BY e.comm_title, m.member_address, e.comm_content, e.comm_upload_date
    ORDER BY CASE WHEN porder = 2 THEN comm_upload_date END DESC;
BEGIN
    OPEN c_comm_board_cur;
    LOOP
        FETCH c_comm_board_cur INTO vcomm_title, vmem_addr, vcontent, vlike_count, vcmt_count, vtime_since_upload;
        EXIT WHEN c_comm_board_cur%NOTFOUND; -- �� �̻� ������ ���� ������ ���� ����
    
    -- ������ �����͸� ���
    DBMS_OUTPUT.PUT_LINE('�� ���� : ' || vcomm_title );
    DBMS_OUTPUT.PUT_LINE('�� ���� : ' || vcontent );
    DBMS_OUTPUT.PUT_LINE('�ۼ��� �ּ� : ' || vmem_addr );
    DBMS_OUTPUT.PUT_LINE('���ε� ��¥ : ' || vtime_since_upload );   
    DBMS_OUTPUT.PUT_LINE('���ƿ� �� : ' || vlike_count);
    DBMS_OUTPUT.PUT_LINE('��� �� : ' || vcmt_count);
    DBMS_OUTPUT.PUT_LINE(' ');
  END LOOP;
  CLOSE c_comm_board_cur;
--EXCEPTION
END;
EXEC up_searchCommBoard('����', 2);

SELECT * FROM comm_board;
SELECT * FROM comm_board_like;
SELECT * FROM comm_cmt;

--------------------------------------------------------------------------------



------------------------- ���׻�Ȱ �Խ��� ��� ��ȸ -----------------------------
CREATE OR REPLACE PROCEDURE up_checkcmt
IS
  vcomm_num comm_cmt.comm_num%TYPE;
  vmember_nickname MEMBER.MEMBER_NICKNAME%TYPE;
  vcomm_date comm_cmt.comm_date%TYPE;
  vcomm_content comm_cmt.comm_content%TYPE;
BEGIN
  FOR vrow IN 
  (SELECT 
    c.comm_num, 
    m.MEMBER_NICKNAME,
    c.comm_date, 
    c.comm_content
   FROM comm_cmt c
   JOIN MEMBER m ON c.member_num = m.MEMBER_NUM)
  LOOP
    vcomm_num := vrow.comm_num;
    vmember_nickname := vrow.MEMBER_NICKNAME;
    vcomm_date := vrow.comm_date;
    vcomm_content := vrow.comm_content;

    -- ��� ���� ��� (�ۼ��� ��ȣ ��� �г��� ���)
    DBMS_OUTPUT.put_line('**��� ��ȣ: ' || vcomm_num);
    DBMS_OUTPUT.put_line('**�ۼ��� �г���: ' || vmember_nickname);
    DBMS_OUTPUT.put_line('**�ۼ� ��¥: ' || TO_CHAR(vcomm_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.put_line('**��� ����: ' || vcomm_content);
    DBMS_OUTPUT.put_line('-----------------------------');
  END LOOP;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('**����� �������� �ʽ��ϴ�.');
END;
EXEC up_checkcmt;

--------------------------------------------------------------------------------



----------------------- ���׻�Ȱ �Խ��� ���� ��ȸ -----------------------------
-- ���׻�Ȱ ���� ��ȸ
CREATE OR REPLACE PROCEDURE up_checkReply
IS
  vrcmt_num cmt_reply.rcmt_num%TYPE;
  vmember_nickname MEMBER.MEMBER_NICKNAME%TYPE;
  vrcmt_date cmt_reply.rcmt_date%TYPE;
  vrcmt_content cmt_reply.rcmt_content%TYPE;
BEGIN
  FOR vrow IN 
  (SELECT 
    cr.rcmt_num, 
    m.MEMBER_NICKNAME, 
    cr.rcmt_date, 
    cr.rcmt_content
   FROM cmt_reply cr
   JOIN MEMBER m ON cr.member_num = m.MEMBER_NUM)
  LOOP
    vrcmt_num := vrow.rcmt_num;
    vmember_nickname := vrow.MEMBER_NICKNAME;
    vrcmt_date := vrow.rcmt_date;
    vrcmt_content := vrow.rcmt_content;

    -- ���� ���� ���
    DBMS_OUTPUT.put_line('**���� ��ȣ: ' || vrcmt_num);
    DBMS_OUTPUT.put_line('**�ۼ��� �г���: ' || vmember_nickname);
    DBMS_OUTPUT.put_line('**�ۼ� ��¥: ' || TO_CHAR(vrcmt_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.put_line('**���� ����: ' || vrcmt_content);
    DBMS_OUTPUT.put_line('-----------------------------');
  END LOOP;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('**������ �������� �ʽ��ϴ�.');
END;
EXEC up_checkreply;

--------------------------------------------------------------------------------



------------------------------ ä�� ��ȸ ----------------------------------------

-- ä�ù� ��� ��ȸ
CREATE OR REPLACE PROCEDURE seek_list
(
    ptrade_num chat.trade_num%type
)
IS
    vtrade_num chat.trade_num%type;
    vbuyer_num chat.buyer_num%type;
    vmember_nickname member.member_nickname%type;
    vtrade_title trade_board.trade_title%type;
    vmember_adress member.member_address%type;
    vmember_manner_points member.member_manner_points%type;
BEGIN 
FOR slc IN(
    SELECT c.trade_num, buyer_num, member_nickname, trade_title , member_address, member_manner_points
    FROM chat c JOIN member m on c.buyer_num = m.member_num
                JOIN trade_board t on c.trade_num = t.trade_num
    WHERE c.trade_num= ptrade_num)
    
    LOOP
        DBMS_OUTPUT.PUT_LINE('�Խ��� ���� : ' || slc.trade_title ||'   '||   'ä�� ���� : ' ||  slc.member_nickname || ' ���� �ּ� : ' || slc.member_address ||'   '|| '�ų� �µ� : ' || slc.member_manner_points);    
    END LOOP;
END;

EXEC seek_list(2); 

-- ä�� ���� ��ȸ
CREATE OR REPLACE PROCEDURE seek_chat_content
(
    ptrade_num chat_board.trade_num%type
)
IS
    vmember_nickname member.member_nickname%type;
    vtrade_title trade_board.trade_title%type;
    vmember_manner_points member.member_manner_points%type;
BEGIN 
    SELECT trade_title, member_manner_points, member_nickname INTO vtrade_title, vmember_manner_points, vmember_nickname
    FROM trade_board t JOIN member m on t.member_num = m.member_num
    WHERE trade_num = ptrade_num;
    
 DBMS_OUTPUT.PUT_LINE('�Ǹ����� ��ǰ : ' || vtrade_title  ||'   '||   'ä�� ���� : ' ||  vmember_nickname  ||'  '|| ' ���� �ųʿµ� : ' || vmember_manner_points);

FOR vcc IN(
    SELECT chat_content , buyer_num, b.chat_time
    FROM chat c JOIN member m on c.buyer_num = m.member_num
                JOIN chat_board  b on c.trade_num = b.trade_num            
    WHERE b.trade_num=ptrade_num

)
    LOOP  
        DBMS_OUTPUT.PUT_LINE('ä�ó��� : ' || vcc.chat_content || '   ' || 'ä�� �ð� : ' || vcc.chat_time);    
    END LOOP;
END;

EXEC seek_chat_content(2);

--------------------------------------------------------------------------------

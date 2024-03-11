-------------------------------------------------------------------------����ȭ
-- [[���׻�Ȱ �Խ��� �� ��ȸ]] 
-- up_seltblcommboard ���װԽ�����ȸ
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
                        WHEN SYSDATE - TO_DATE(cb.comm_upload_date) < 1 THEN TRUNC((SYSDATE - TO_DATE(cb.comm_upload_date)) * 24 * 60) || '�� ��'
                        ELSE TRUNC(SYSDATE - TO_DATE(cb.comm_upload_date)) || '�� ��'
                      END upload_date    --���ε�����
                    , cb.comm_title                 title       --�Խñ�����
                    , cb.comm_content               comm_content     --�Խñ۳���
                    , (SELECT distinct COUNT(comm_board_num) FROM comm_board_like cbl where cbl.comm_board_num = cb.comm_board_num  GROUP BY COMM_BOARD_NUM ) board_like_cnt --�Խ������ƿ䰹�� 
                    FROM comm_board cb JOIN comm_ctgr cc ON cb.comm_ctgr_num = cc.comm_ctgr_num 
                               JOIN member m ON cb.member_num = m.member_num 
                               JOIN comm_board_like bl ON cb.member_num = bl.member_num
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
  -- ROLLBACK;
END;
EXEC up_selcommboard(4); 

--------------------------------------------------------------------------------
-- [[���׻�Ȱ �Խ��� ���ƿ�]]
-- �߰�/����
SELECT * FROM comm_board_like;
desc comm_board_like ;
--���ν���
-- up_udtcmtreplylike �Խ������ƿ� �߰�
CREATE OR REPLACE PROCEDURE up_insboardlike
(
    pcomm_like_num  comm_board_like.comm_like_num%TYPE
    , pmember_num   comm_board_like.member_num%TYPE
    , pcomm_board_num     comm_board_like.comm_board_num%TYPE
)
IS
BEGIN
    INSERT INTO comm_board_like ( comm_like_num, member_num, comm_board_num )
    values (pcomm_like_num, pmember_num, pcomm_board_num );
    commit;
    
    DBMS_OUTPUT.PUT_LINE('���׻�Ȱ �Խ��� ���ƿ� �ѹ�: ' || pcomm_like_num || ', ' || 'ȸ�� �ѹ� : ' || pmember_num
                        || ', ' || '���׻�Ȱ �Խ��� �ѹ�: ' || ', ' || pcomm_board_num );
--EXCEPTION
END;
EXEC up_insboardlike(SEQ_COMM_LIKE.NEXTVAL, 10, 2);

--up_delcmtreplylike �Խ������ƿ� ����
CREATE OR REPLACE PROCEDURE up_delboardlike
(
    pcomm_like_num  comm_board_like.comm_like_num%TYPE
    , pmember_num   comm_board_like.member_num%TYPE
    , pcomm_board_num     comm_board_like.comm_board_num%TYPE
)
IS
BEGIN
    DELETE FROM comm_board_like
    where member_num = pmember_num ;
    commit ;
    
--EXCEPTION
END;
EXEC up_delboardlike(25,10,2);

--�Խ������ƿ� �߰�/���� Ʈ����
CREATE OR REPLACE TRIGGER ut_insboardlike
AFTER
INSERT OR DELETE ON comm_board_like   
FOR EACH ROW
BEGIN 
   IF INSERTING THEN
      INSERT INTO comm_board_like (MEMBER_NUM) VALUES ( :NEW.MEMBER_NUM );
   ELSIF DELETING THEN
      INSERT INTO comm_board_like (MEMBER_NUM) VALUES ( :OLD.MEMBER_NUM ); 
   END IF;
-- EXCEPTION  
END;

DESC comm_board_like;
SELECT * FROM comm_board_like WHERE COMM_BOARD_NUM = 1;
INSERT INTO comm_board_like VALUES (SEQ_COMM_LIKE.NEXTVAL,2,1 );
---------------------------------------------------------------------------------
-- ���׻�Ȱ ī�װ�
-- �߰�/����/����
SELECT * FROM comm_ctgr ;
-- UP_INSCOMMCTAR ����ī�װ� �߰����ν���
CREATE OR REPLACE PROCEDURE UP_INSCOMMCTAR
(
    pcomm_ctgr_num   comm_ctgr.comm_ctgr_num%TYPE 
    , pcomm_ctgr_name  comm_ctgr.comm_ctgr_name%TYPE 
)
IS
BEGIN
    INSERT INTO comm_ctgr ( comm_ctgr_num, comm_ctgr_name )
    values (pcomm_ctgr_num, pcomm_ctgr_name );
    commit;
    
    DBMS_OUTPUT.PUT_LINE('ī�װ���ȣ: ' || pcomm_ctgr_num || ', ' || 'ī�װ��̸� : ' || pcomm_ctgr_name );
-- EXCEPTION ī�װ� �ѹ����������� �Էµ����ʵ���
END ;
-- ORA-06502: PL/SQL: numeric or value error: character to number conversion error
EXEC UP_INSCOMMCTAR ( 7, '�߰��ϱ�' );

--up_updcommctgr ����ī�װ� �������ν���
CREATE OR REPLACE PROCEDURE up_updcommctgr
(
    pcomm_ctgr_num   comm_ctgr.comm_ctgr_num%TYPE 
    , pcomm_ctgr_name  comm_ctgr.comm_ctgr_name%TYPE := NULL
)
IS
BEGIN    
       UPDATE comm_ctgr
       SET comm_ctgr_name  = NVL(pcomm_ctgr_name, comm_ctgr_name)
       WHERE comm_ctgr_num = pcomm_ctgr_num; 
       COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('ī�װ���ȣ: ' || pcomm_ctgr_num || ', ' || 'ī�װ��̸� : ' || pcomm_ctgr_name );
-- EXCEPTION
END;
EXEC up_updcommctgr( 7, '�������');

-- ����
CREATE OR REPLACE PROCEDURE up_delcommctgr
(
    pcomm_ctgr_num NUMBER
)
IS
BEGIN
    DELETE FROM comm_ctgr
    where comm_ctgr_num = pcomm_ctgr_num ;
    commit ;
--EXCEPTION
END;
EXEC up_delcommctgr(7);
--
-----------------------------------------------------------------------------------
-- [[���׻�Ȱ ���� ���ƿ�]]
-- �߰�/����
SELECT * FROM cmt_reply_like ;
DESC cmt_reply_like;
-- ���ν���
-- up_inscmtreplylike �������ƿ� �߰�
CREATE OR REPLACE PROCEDURE up_inscmtreplylike
(
    prcmt_like_num  cmt_reply_like.rcmt_like_num%TYPE
    , pmember_num   cmt_reply_like.member_num%TYPE
    , prcmt_num     cmt_reply_like.rcmt_num%TYPE
)
IS
BEGIN
    INSERT INTO cmt_reply_like ( rcmt_like_num, member_num, rcmt_num )
    values (prcmt_like_num, pmember_num, prcmt_num );
    commit;
    
    DBMS_OUTPUT.PUT_LINE('���׻�Ȱ ���� ���ƿ� �ѹ�: ' || prcmt_like_num || ', ' || 'ȸ�� �ѹ� : ' || pmember_num
                        || ', ' || '���׻�Ȱ ���� �ѹ�: ' || ', ' || prcmt_num );
--EXCEPTION
END;
EXEC up_inscmtreplylike(SEQ_RCMT_LIKE.NEXTVAL, 2, 1);

--up_delcmtreplylike �������ƿ� ����
CREATE OR REPLACE PROCEDURE up_delcmtreplylike
(
    prcmt_like_num  cmt_reply_like.rcmt_like_num%TYPE
    , pmember_num   cmt_reply_like.member_num%TYPE
    , prcmt_num     cmt_reply_like.rcmt_num%TYPE
)
IS
BEGIN
    DELETE FROM cmt_reply_like
    where member_num = pmember_num ;
    commit ;
    
--EXCEPTION
END;
EXEC up_delcmtreplylike(23, 2, 1);

-- Ʈ����










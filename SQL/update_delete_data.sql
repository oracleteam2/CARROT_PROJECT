-- SCOTT
-- ������ �߰�/����/����

----------------------------------- ȸ�� ---------------------------------------
-- ȸ�� �߰�
CREATE OR REPLACE PROCEDURE up_insert_member
(   
    pmem_birth member.member_birth%TYPE,
    pmem_nickname member.member_nickname%TYPE,
    pmem_addr member.member_address%TYPE,
    pmem_tel member.member_tel%TYPE,
    pmem_profile member.member_profile%TYPE
)
IS
BEGIN

    INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
    VALUES (seq_member_id.NEXTVAL, pmem_birth, pmem_nickname, pmem_addr, pmem_tel, pmem_profile);

--EXCEPTION
END;

EXECUTE up_insert_member( '000608', '����', '�����', '010-3111-2222', 'https://image.newsis.com/2012/05/25/NISI20120525_0006401508_web.jpg');

-- ȸ�� ����
CREATE OR REPLACE PROCEDURE up_update_member
(
    pmem_num member.member_num%TYPE,
    pmem_nickname member.member_nickname%TYPE := NULL,
    pmem_addr member.member_address%TYPE := NULL,
    pmem_tel member.member_tel%TYPE := NULL,
    pmem_profile member.member_profile%TYPE := NULL
)
IS
    v_is_member NUMBER;
    vmem_nickname member.member_nickname%TYPE;
    vmem_addr member.member_address%TYPE;
    vmem_tel member.member_tel%TYPE;
    vmem_profile member.member_profile%TYPE;
BEGIN
    SELECT member_nickname, member_address, member_tel, member_profile
        INTO vmem_nickname, vmem_addr, vmem_tel, vmem_profile
    FROM member
    WHERE member_num = pmem_num;


    UPDATE member
    SET  member_nickname = NVL(pmem_nickname, vmem_nickname)
        ,member_address  = NVL(pmem_addr, vmem_addr)
        ,member_tel      = NVL(pmem_tel, vmem_tel)
        ,member_profile  = NVL(pmem_profile, vmem_profile)
    WHERE member_num = pmem_num;
    DBMS_OUTPUT.PUT_LINE( 'ȸ�� ���� �Ϸ�');
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20002, '������Ʈ�� ȸ���� �������� �ʴ´�.');
END;

EXEC up_update_member (21, pmem_nickname => '����');
EXEC up_update_member (21, pmem_addr => '���� is good');
EXEC up_update_member (21, pmem_tel => '010-4151-2151');
EXEC up_update_member (21, pmem_profile => 'http://image.fgblkgfblkmgfbkl');

SELECT * FROM member;


-- ȸ�� ����
ALTER TABLE member
DROP CONSTRAINT PK_member CASCADE;

EXECUTE up_delmember(1);

CREATE OR REPLACE PROCEDURE up_delmember
(
    pmem_num NUMBER
)
IS
BEGIN
    
    -- danggeun_pay ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM danggeun_pay
    WHERE member_num = pmem_num;
    
    -- block ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM block
    WHERE t_block_mem_num = pmem_num OR f_block_mem_num = pmem_num;  
    
    -- trade_board_like ���̺� �ش� member �����ϴ� ������ ����
    DELETE FROM trade_board_like
    WHERE member_num = pmem_num;   

    -- pay ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM pay
    WHERE seller_num = pmem_num AND buyer_num = pmem_num;        
    
    -- manner_points ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM manner_points
    WHERE press_mem_num = pmem_num OR compress_mem_num = pmem_num;   
    
    -- comm_reply_like ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM cmt_reply_like
    WHERE member_num = pmem_num;
    
    -- comm_reply ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM cmt_reply 
    WHERE member_num = pmem_num;
      
    -- comm_cmt ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM comm_cmt
    WHERE member_num = pmem_num;
    
    -- comm_cmt_like ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM comm_cmt_like
    WHERE member_num = pmem_num;

    -- comm_board_lik ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM comm_board_like
    WHERE member_num = pmem_num;
    
    -- comm_board ���̺��� �ش� member �����ϴ� ������ ����
    DELETE FROM comm_board
    WHERE member_num = pmem_num;    
    
    -- report ���̺� �ش� member �����ϴ� ������ ����
    DELETE FROM report
    WHERE t_report_mem_num = pmem_num OR f_report_mem_num = pmem_num;    

    -- chat ���̺� �ش� member �����ϴ� ������ ����
    DELETE FROM chat
    WHERE buyer_num = pmem_num;       
    
    -- trade_board ���̺� �ش� member �����ϴ� ������ ����
    DELETE FROM trade_board
    WHERE member_num = pmem_num;  
    
    -- trade_board ���̺� �ش� member �����ϴ� ������ ����
    DELETE FROM member
    WHERE member_num = pmem_num;      
END;

EXEC up_delmember(1);

SELECT * FROM member;
SELECT * FROM trade_board;
SELECT * FROM chat;

--------------------------------------------------------------------------------



--------------------------------- �ųʿµ� --------------------------------------
CREATE SEQUENCE seq_manner_points
INCREMENT BY 1
START WITH 1
NOCYCLE NOCACHE;

-- �ųʿµ� �߰�(��)
CREATE OR REPLACE PROCEDURE up_insert_manner_points
(
    ppay_num NUMBER,
    p_chat_room_num pay.chat_room_num%TYPE,
    p_press_mem_num  NUMBER,        --�ųʿµ� �������
    p_compress_mem_num NUMBER,       --�ųʿµ� ������ ���
    p_�� VARCHAR2
)
IS
    v_p_count NUMBER;
    v_m_count NUMBER;
    vmem_manner_points member.member_manner_points%TYPE;
BEGIN
    
   SELECT member_manner_points
        INTO vmem_manner_points
    FROM member
    WHERE member_num = p_compress_mem_num;
    
    SELECT COUNT(*)
        INTO v_m_count
    FROM manner_points
    WHERE chat_room_num = p_chat_room_num AND press_mem_num = p_press_mem_num;
    
    SELECT COUNT(*)
        INTO v_p_count
    FROM pay
    WHERE (buyer_num = p_press_mem_num AND seller_num = p_compress_mem_num AND pay_num = ppay_num ) OR
          (buyer_num = p_compress_mem_num AND seller_num = p_press_mem_num AND pay_num = ppay_num);
          
    IF v_m_count = 0 AND v_p_count = 1 AND p_�� LIKE '����' THEN
    INSERT INTO manner_points ( manner_points_num, chat_room_num, press_mem_num, compress_mem_num, manner_points, update_date )
    VALUES ( seq_manner_points.NEXTVAL, p_chat_room_num, p_press_mem_num, p_compress_mem_num, vmem_manner_points+(vmem_manner_points*0.025)  ,SYSDATE );
    ELSIF v_m_count = 0 AND v_p_count = 1 AND p_�� LIKE '����' THEN
    INSERT INTO manner_points ( manner_points_num, chat_room_num, press_mem_num, compress_mem_num, manner_points, update_date )
    VALUES ( seq_manner_points.NEXTVAL, p_chat_room_num, p_press_mem_num, p_compress_mem_num, vmem_manner_points-(vmem_manner_points*0.025)  ,SYSDATE );
    ELSIF v_p_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, '�ŷ��� �������� ���� ������ �ųʿµ� ���� �� �����ϴ�.');
    ELSE
    RAISE_APPLICATION_ERROR(-20001, '�̹� �ųʿµ��� ���� ȸ���Դϴ�.');
    END IF;
--EXCEPTION
END;


-- �ųʿµ� �� �� �۵��Ǵ� Ʈ����
CREATE OR REPLACE TRIGGER ut_update_mem_manner
AFTER
INSERT ON manner_points
FOR EACH ROW
BEGIN
    UPDATE member
    SET member_manner_points = :NEW.manner_points
    WHERE member_num = :NEW.compress_mem_num;
END;

SELECT * FROM member;
SELECT * FROM manner_points;
SELECT * FROM chat;
SELECT * FROM trade_board;
SELECT * FROM pay;

EXEC up_insert_manner_points(3, 3, 1, 2, '����');


EXEC up_insert_manner_points( 1, 2, 1);
EXECUTE up_insert_pay(6);
EXECUTE up_select_mpage(1);

--------------------------------------------------------------------------------



-------------------------------- ������� ---------------------------------------
-- ȸ�� ������� �߰�
CREATE OR REPLACE PROCEDURE up_insert_danggeun_pay
(
    pmem_num danggeun_pay.member_num%TYPE,
    paccount danggeun_pay.account%TYPE,
    pbank_name danggeun_pay.bank_name%TYPE,
    pbalance danggeun_pay.balance%TYPE
)
IS
    v_count NUMBER;
    v_mem_count NUMBER;
BEGIN
    SELECT COUNT(*)
        INTO v_count
    FROM danggeun_pay
    WHERE member_num = pmem_num;

    SELECT COUNT(*)
        INTO v_mem_count
    FROM member
    WHERE member_num = pmem_num;

    IF v_count = 0 AND v_mem_count = 1
    THEN
    INSERT INTO danggeun_pay
    VALUES ( pmem_num, paccount, pbank_name, pbalance );
    ELSIF v_count = 1 AND v_mem_count = 1
    THEN
    RAISE_APPLICATION_ERROR(-20001, '������̿� �̹� �����ϴ� ȸ����_NUM�Դϴ�.');
    ELSIF v_mem_count = 0 
    THEN
    RAISE_APPLICATION_ERROR(-20002, '�Էµ� ȸ���� ���� ȸ���Դϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS 
    THEN RAISE;
END;

EXEC up_insert_danggeun_pay (12, '1002151532', '��������', 5000000);

-- ������� �ݾ� ����
CREATE OR REPLACE PROCEDURE up_charge_danggeun_pay
(
    pmem_num danggeun_pay.member_num%TYPE,
    pmem_charge_amount danggeun_pay.balance%TYPE
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
        INTO v_count
    FROM danggeun_pay
    WHERE member_num = pmem_num;

    IF v_count = 1 THEN
        UPDATE danggeun_pay
        SET balance = balance + pmem_charge_amount
        WHERE member_num = pmem_num;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, '������ ������̰� �����ϴ�.');
    END IF;
--EXCEPTION 
END;
EXECUTE up_charge_danggeun_pay( 12, -1020000);

--------------------------------------------------------------------------------



-------------------------------- ���� ------------------------------------------
-- ���� ���̺� INSERT
CREATE OR REPLACE PROCEDURE up_insert_pay
(
    p_chat_num chat.chat_room_num%TYPE
)
IS
    vmem_nickname member.member_nickname%TYPE;
    vseller_num NUMBER; -- �Ǹ���
    vbuyer_num chat.buyer_num%TYPE; -- ������
    vtrade_num chat.trade_num%TYPE; -- chat���� trade��ȣ�� ������
    vbalance danggeun_pay.balance%TYPE;
    vprice NUMBER;
    c_count NUMBER;
BEGIN
    -- ������
    SELECT trade_num, buyer_num
        INTO vtrade_num, vbuyer_num
    FROM chat
    WHERE chat_room_num = p_chat_num;
    
    SELECT balance
        INTO vbalance
    FROM danggeun_pay
    WHERE member_num = vbuyer_num;
    
    SELECT trade_price, member_num 
        INTO vprice, vseller_num
    FROM trade_board
    WHERE trade_num = vtrade_num;
    
    SELECT member_nickname
        INTO vmem_nickname
    FROM member
    WHERE member_num = vbuyer_num;
    
    SELECT COUNT( * )
        INTO c_count
    FROM pay
    WHERE chat_room_num = p_chat_num;
    
    IF c_count >= 1 THEN
    RAISE_APPLICATION_ERROR(-20001, '�̹� �Ϸ�� �ŷ��Դϴ�.');
    ELSIF vbalance >= vprice THEN
    INSERT INTO pay ( pay_num, chat_room_num, seller_num, buyer_num, pay_date, remittance_amount )
    VALUES (seq_pay.NEXTVAL, p_chat_num, vseller_num, vbuyer_num, SYSDATE, vprice);
    ELSE
    RAISE_APPLICATION_ERROR(-20002, '���� �ܾ��� �����մϴ�.');
    END IF;
        
    DBMS_OUTPUT.PUT_LINE ( '�г��� : ' || vmem_nickname );
    DBMS_OUTPUT.PUT_LINE ( '�ݾ� : ' || vprice || '��');
    DBMS_OUTPUT.PUT_LINE ( '�ܾ�' || vbalance || '��' );
    DBMS_OUTPUT.PUT_LINE ( '  1  ' || '  2  ' || '  3  ' );
    DBMS_OUTPUT.PUT_LINE ( '  4  ' || '  5  ' || '  6  ' );
    DBMS_OUTPUT.PUT_LINE ( '  1  ' || '  2  ' || '  3  ' );
    DBMS_OUTPUT.PUT_LINE ( ' ����  ' || ' 0  ' || '  <-  ' );
    
--EXCEPTION
END;


EXECUTE up_insert_pay(4);
SELECT * FROM chat;  
SELECT * FROM trade_board; 
SELECT * FROM pay;
SELECT * FROM danggeun_pay; 
EXECUTE up_insert_pay(1);

-- ������� ����
CREATE OR REPLACE TRIGGER ut_update_danggeun
AFTER 
INSERT ON pay
FOR EACH ROW
BEGIN
    UPDATE danggeun_pay 
    SET balance = balance + :NEW.remittance_amount
    WHERE member_num = :NEW.seller_num;
    
    UPDATE danggeun_pay
    SET balance = balance - :NEW.remittance_amount
    WHERE member_num = :NEW.buyer_num;
END;

--------------------------------------------------------------------------------



--------------------------------- ������ ---------------------------------------
-- ������ �߰� 
CREATE OR REPLACE PROCEDURE up_insAdmin
(
    padmin_nickname admin.admin_nickname%TYPE := NULL
    , padmin_ID admin.admin_ID%TYPE := NULL 
    , padmin_password admin.admin_password%TYPE := NULL
)
IS
BEGIN
    INSERT INTO admin VALUES (seq_admin_id.NEXTVAL ,padmin_nickname, padmin_id, padmin_password);
--EXCEPTION
END;

EXEC up_insAdmin('������5', 'admin9899', '12342385');

-- ������ ����
CREATE OR REPLACE PROCEDURE up_updAdmin
(
    padmin_num admin.admin_num%TYPE 
    , padmin_nickname admin.admin_nickname%TYPE := NULL
    , padmin_ID admin.admin_ID%TYPE := NULL 
    , padmin_password admin.admin_password%TYPE := NULL
)
IS
    vadmin_num admin.admin_num%TYPE;
BEGIN
    SELECT admin_num INTO vadmin_num
    FROM admin
    WHERE admin_num = padmin_num;

    UPDATE admin
    SET admin_nickname = NVL(padmin_nickname, admin_nickname)
        , admin_id = NVL(padmin_id, admin_id)
        , admin_password = NVL(padmin_password, admin_password)
    WHERE admin_num = padmin_num;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20014, '�������� �ʴ� ������ ��ȣ�Դϴ�.');
END;

EXEC up_updAdmin(2, padmin_nickname => '����2');
EXEC up_updAdmin(2, padmin_id => 'yuejin');
EXEC up_updAdmin(2, padmin_password => 01040457834);

-- ������ �α�, �������� ���� ���̺�
CREATE TABLE admin_log_info
(
    memo VARCHAR(1000)
    , log_date DATE DEFAULT SYSDATE
);

-- �������� ��������(����, ����)��ȸ�� ���� Ʈ����
CREATE OR REPLACE TRIGGER ut_AdminLogInfo
AFTER
INSERT OR UPDATE OR DELETE ON admin
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        INSERT INTO admin_log_info (memo) VALUES ('[' || :NEW.admin_id || '] -> ������ ����');
    ELSIF UPDATING THEN 
        IF :OLD.admin_nickname != :NEW.admin_nickname THEN
            INSERT INTO admin_log_info (memo) VALUES ('�������� �г������� [' || :OLD.admin_nickname || '->' || :NEW.admin_nickname || '] ����');
        ELSIF :OLD.admin_id != :NEW.admin_id THEN
            INSERT INTO admin_log_info (memo) VALUES ('[' || :OLD.admin_nickname || '] �� ������ ID�� [' || :OLD.admin_id || '->' || :NEW.admin_id || '] ����');
        ELSIF :OLD.admin_password != :NEW.admin_password THEN
            INSERT INTO admin_log_info (memo) VALUES ('[' || :OLD.admin_nickname || '] �� ������ ��й�ȣ�� [' || :OLD.admin_password || '->' || :NEW.admin_password || '] ����');
        END IF;
    END IF;
--EXCEPTION
END;

-- �������� ��� �������� ��ȸ�� ���� ���ν���
CREATE OR REPLACE PROCEDURE up_AdminLogInfo
IS
    vmemo admin_log_info.memo%TYPE;  
BEGIN
    SELECT memo INTO vmemo 
    FROM admin_log_info 
    WHERE ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE('--> Admin Log File <--');
    FOR vrow IN (SELECT memo, TO_CHAR(log_date, 'YYYY-MM-DD HH24:MI:SS') log_date FROM admin_log_info)
        LOOP
            DBMS_OUTPUT.PUT_LINE('About Admin Log : ' || vrow.memo);
            DBMS_OUTPUT.PUT_LINE('TIME : ' || vrow.log_date);
            DBMS_OUTPUT.PUT_LINE(' ');
        END LOOP;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20015, '������ ����� �����ϴ�.');
END;

EXEC up_AdminLogInfo;

-- ȸ�� �α�, �������� ���� ���̺�
CREATE TABLE member_log_info
(
    memo VARCHAR2(1000)
    , log_date DATE DEFAULT SYSDATE
);

-- [������ ����] ȸ���� ��� ��������(����, ����, ����)��ȸ�� ���� Ʈ���� 
CREATE OR REPLACE TRIGGER ut_MemberLogInfo
AFTER
INSERT OR UPDATE OR DELETE ON member
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        INSERT INTO member_log_info (memo) VALUES ( '[' || :NEW.member_nickname || ']' || ' -> ����');
    ELSIF UPDATING THEN 
        IF :OLD.member_nickname != :NEW.member_nickname THEN
            INSERT INTO member_log_info (memo) VALUES ( '[' || :OLD.member_nickname || ']' || '���� �̸������� ' || '[' || :OLD.member_nickname || ' -> ' || :NEW.member_nickname || ']' || '  ����');
        ELSIF :OLD.member_tel != :NEW.member_tel THEN
            INSERT INTO member_log_info (memo) VALUES ( '[' || :OLD.member_nickname || ']' || '���� ��ȭ��ȣ�� ' || '[' || :OLD.member_tel || ' -> ' || :NEW.member_tel || ']' || ' ����');
        ELSIF :OLD.member_address != :NEW.member_address THEN
            INSERT INTO member_log_info (memo) VALUES (  '[' || :OLD.member_nickname || ']' || '���� �ּҰ� ' || '[' || :OLD.member_address || ' -> ' || :NEW.member_address || ']' || ' ����');
        ELSIF :OLD.member_profile != :NEW.member_profile THEN
            INSERT INTO member_log_info (memo) VALUES ( '[' || :OLD.member_nickname || ']' || '���� ������ �̹����� ' || '[' || :OLD.member_profile || ' -> ' || :NEW.member_profile || ']' || ' ����');
        END IF;
    ELSIF DELETING THEN 
        INSERT INTO member_log_info (memo) VALUES ( :OLD.member_nickname || ' -> ����');
    END IF;
--EXCEPTION
END;

-- [������ ����] ȸ���� ��� �������� ��ȸ�� ���� ���ν���
CREATE OR REPLACE PROCEDURE up_MemberLogInfo
IS
    vmemo member_log_info.memo%TYPE DEFAULT NULL;
BEGIN
    SELECT memo INTO vmemo 
    FROM member_log_info 
    WHERE ROWNUM = 1;
    DBMS_OUTPUT.PUT_LINE('--> MEMBER LOG FILE <--');
    FOR vrow IN (SELECT memo, TO_CHAR(log_date, 'YYYY-MM-DD HH24:MI:SS') log_date FROM member_log_info)
        LOOP
            DBMS_OUTPUT.PUT_LINE('About Member Log : ' || vrow.memo);
            DBMS_OUTPUT.PUT_LINE('TIME : ' || vrow.log_date);
            DBMS_OUTPUT.PUT_LINE(' ');
        END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20014, '������ ������ �����ϴ�.');
END;

EXEC up_MemberLogInfo;

-- �������� �Խ��� �������� �������̺�
CREATE TABLE NoticeBoard_log_info
(
    memo VARCHAR2(1000)
    , log_date DATE DEFAULT SYSDATE
);

-- [������ ����] �������� �Խ����� ��� �������� ��ȸ�� ���� Ʈ����
CREATE OR REPLACE TRIGGER ut_NoticeBoardLogInfo
AFTER
INSERT OR UPDATE OR DELETE ON notice_board
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        INSERT INTO NoticeBoard_log_info (memo) VALUES ( '[' ||  :NEW.notice_title || ']' || ' -> �Խ��� ����');
    ELSIF UPDATING THEN 
        IF :OLD.notice_title != :NEW.notice_title THEN
            INSERT INTO NoticeBoard_log_info (memo) VALUES ( '[' || :OLD.notice_title || ' -> ' || :NEW.notice_title || ']' || ' �Խ��� �̸� ����');
        ELSIF :OLD.notice_content != :NEW.notice_content THEN
            INSERT INTO NoticeBoard_log_info (memo) VALUES ( '[' || :OLD.notice_content || ' -> ' || :NEW.notice_content || ']' || ' �Խ��� ���� ����');
        END IF;
    ELSIF DELETING THEN 
        INSERT INTO NoticeBoard_log_info (memo) VALUES ( '[' || :OLD.notice_title || ']' || ' -> �Խ��� ����');
    END IF;
--EXCEPTION
END;

-- [������ ����] �������� �Խ����� ��� �������� ��ȸ ���ν���
CREATE OR REPLACE PROCEDURE up_NoticeBoardLogInfo
IS
    vmemo NoticeBoard_log_info.memo%TYPE;
BEGIN
    SELECT memo INTO vmemo 
    FROM noticeboard_log_info 
    WHERE ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE('--> Notice Board Log File <--');
    FOR vrow IN (SELECT memo, TO_CHAR(log_date, 'YYYY-MM-DD HH24:MI:SS') log_date FROM NoticeBoard_log_info)
    LOOP
        DBMS_OUTPUT.PUT_LINE('ABout NoticeBoard Log : ' || vrow.memo);
        DBMS_OUTPUT.PUT_LINE('TIME : ' || vrow.log_date);
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20014, '������ �Խ����� �����ϴ�.');
END;
    
EXEC up_NoticeBoardLogInfo;

--------------------------------------------------------------------------------



-------------------------------- �Ű� ------------------------------------------
-- �Ű� �߰�
CREATE OR REPLACE PROCEDURE up_insReport
(
    pf_report_mem_num report.f_report_mem_num%TYPE
    , pt_report_mem_num report.t_report_mem_num%TYPE
    , preport_content report.report_content%TYPE
)
IS
    vreport_num report.report_num%TYPE;
    vf_report_mem_num report.f_report_mem_num%TYPE;
    vt_report_mem_num report.t_report_mem_num%TYPE;
    vadmin_num report.admin_num%TYPE;
    vreport_content report.report_content%TYPE;
BEGIN
    SELECT seq_report_id.NEXTVAL INTO vreport_num FROM DUAL;
    SELECT CEIL(DBMS_RANDOM.VALUE*3) INTO vadmin_num FROM dual;
    INSERT INTO report VALUES(vreport_num, pf_report_mem_num, pt_report_mem_num, vadmin_num, preport_content);
END;

EXEC up_insReport(1, 3 ,'����ҷ�');

--------------------------------------------------------------------------------



--------------------------------- ���� -----------------------------------------
-- ���� �߰�
CREATE OR REPLACE PROCEDURE up_insBlock
(
    pf_block_mem_num block.f_block_mem_num%TYPE := NULL
    , pt_block_mem_num block.t_block_mem_num%TYPE := NULL
)
IS
    vblock_date block.block_date%TYPE := SYSDATE;
BEGIN
    INSERT INTO block VALUES (pf_block_mem_num, pt_block_mem_num, vblock_date);
END;

EXEC up_insBlock(2, 1);

--------------------------------------------------------------------------------



---------------------------------- ä�� ----------------------------------------
-- ä�� ����
CREATE OR REPLACE PROCEDURE delchat
( 
    pchat_room_num chat.chat_room_num%type
)
IS
BEGIN
    DELETE chat 
    WHERE chat_room_num = pchat_room_num;
    
    dbms_output.put_line(pchat_room_num || '�� ä�ù��� ���� �ƽ��ϴ�.');
END;

EXEC delchat(1);


-- ä�� ���� ����
CREATE OR REPLACE PROCEDURE delcontent
(
    pchat_num chat_board.chat_num%type
)
IS
    vchat_num chat_board.chat_num%type; 
BEGIN
    SELECT MAX(chat_num)
    INTO vchat_num
    FROM chat_board
    WHERE chat_num = pchat_num;

    DELETE 
    FROM CHAT_BOARD
    WHERE chat_num=vchat_num;

--EXCEPTION

    dbms_output.put_line('������ ä���� �����ƽ��ϴ�.');
END;

EXEC delcontent(2);

--------------------------------------------------------------------------------



----------------------------- �������� �Խ��� -----------------------------------
-- �������� �Խ��� �߰�
CREATE OR REPLACE PROCEDURE up_insNoticeBoard
(
    padmin_num admin.admin_num%TYPE := NULL
    , pnotice_title notice_board.notice_title%TYPE := NULL
    , pnotice_content notice_board.notice_content%TYPE := NULL
    , pnotice_date notice_board.notice_date%TYPE := SYSDATE
)
IS
BEGIN
    INSERT INTO notice_board VALUES (seq_notice_board_id.NEXTVAL, padmin_num, pnotice_title, pnotice_content, pnotice_date);
END;

EXEC up_insNoticeBoard(3, '�Խ��ǿ� ���� �������� ���� �ȳ�', '��� �����ڴ� �� �ð��η� ���������� ������ ��� �Խ��ǿ� ���� ������ �Ұ��� �մϴ�. ������ �緮�� �Ұ��� �Խ����� ������Ź�帳�ϴ�.');

SELECT * FROM notice_board;

-- �������� �Խ��� ����
CREATE OR REPLACE PROCEDURE up_updNoticeBoard
(
    pnotice_num  notice_board.notice_num%TYPE
    , pnotice_title  notice_board.notice_title%TYPE
    , pnotice_content notice_board.notice_content%TYPE
)
IS
BEGIN
    UPDATE notice_board
    SET notice_title = NVL(pnotice_title, notice_title)
        , notice_content = NVL(pnotice_content, notice_content)
    WHERE notice_num = pnotice_num;
END;
--EXCEPTION

EXEC up_updNoticeBoard(3, '������ SQLD �ڰ��� �հ�', '�������� ��� �����ڸ� �糢�� 1���ϼ̽��ϴ�!! �������ּ���!!');


-- �������� �Խ��� ����
CREATE OR REPLACE PROCEDURE up_delNoticeBoard
(
    pnotice_num notice_board.notice_num%TYPE
)
IS
BEGIN
    DELETE FROM notice_board WHERE notice_num = pnotice_num;
END;

EXEC up_delNoticeBoard (3);

--------------------------------------------------------------------------------



------------------------- �ǸŹ�ǰ ī�װ� ���� --------------------------------
UPDATE item_ctgr
SET item_ctgr_name = '������'
WHERE item_ctgr_num = 1;

--------------------------------------------------------------------------------



------------------------------- ��ǰ �̹��� -------------------------------------
-- �̹��� ����
CREATE OR REPLACE PROCEDURE up_updItemImage
(
    ptrade_num IN NUMBER
    ,pitem_image_num IN NUMBER
    ,pmember_num IN NUMBER
    ,pitem_image_url item_image.item_image_url%TYPE := NULL
)
IS
    vmember_num item_image.member_num%TYPE;
    MEMBER_NOT_MATCHED EXCEPTION;
BEGIN
    SELECT member_num INTO vmember_num
    FROM trade_board
    WHERE trade_num = ptrade_num;
    
    IF vmember_num != pmember_num THEN
        RAISE MEMBER_NOT_MATCHED;
    END IF;
    
    UPDATE item_image
    SET item_image_url = NVL(pitem_image_url, item_image_url)
    WHERE item_image_num = pitem_image_num;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
EXCEPTION
    WHEN MEMBER_NOT_MATCHED THEN
        DBMS_OUTPUT.PUT_LINE('Member number ' || pmember_num || ' does not match');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

BEGIN
    up_upditemimage(ptrade_num => 1, pitem_image_num => 1, pmember_num => 1, pitem_image_url => '�ű��̹���url');
END;

SELECT * FROM item_image;

-- �̹��� ����
CREATE OR REPLACE PROCEDURE up_delItemImage
(
    ptrade_num IN NUMBER
    ,pitem_image_num IN NUMBER
    ,pmember_num IN NUMBER
)
IS
    vmember_num item_image.member_num%TYPE;
    MEMBER_NOT_MATCHED EXCEPTION;
BEGIN
    SELECT member_num INTO vmember_num
    FROM trade_board
    WHERE trade_num = ptrade_num;
    
    IF vmember_num != pmember_num THEN
        RAISE MEMBER_NOT_MATCHED;
    END IF;
    
    DELETE item_image
    WHERE item_image_num = pitem_image_num;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
EXCEPTION
    WHEN MEMBER_NOT_MATCHED THEN
        DBMS_OUTPUT.PUT_LINE('Member number ' || pmember_num || ' does not match');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

BEGIN
    up_delItemImage(ptrade_num => 1, pitem_image_num => 1, pmember_num => 1);
END;

--------------------------------------------------------------------------------



---------------------------- �߰�ŷ� �Խ��� ------------------------------------
-- �߰�ŷ� �Խ��� ����
CREATE OR REPLACE PROCEDURE up_updTradeBoard(
    ptrade_num IN NUMBER
    ,pmember_num IN NUMBER
    ,pselitem_ctgr_num IN NUMBER DEFAULT NULL
    ,ptrade_title IN trade_board.trade_title%TYPE := NULL
    ,ptrade_content trade_board.trade_content%TYPE := NULL
    ,ptrade_price IN NUMBER DEFAULT NULL
    ,ptrade_location trade_board.trade_location%TYPE := NULL
    ,pupload_date IN DATE DEFAULT TO_DATE(SYSDATE, 'YY-MM-DD')
)
IS
    vmember_num trade_board.member_num%TYPE;
    MEMBER_NOT_MATCHED EXCEPTION;
BEGIN
    -- �ش� trade_num�� ���� member_num ���� �����ɴϴ�.
    SELECT member_num INTO vmember_num
    FROM trade_board
    WHERE trade_num = ptrade_num;

    IF vmember_num != pmember_num THEN
        RAISE MEMBER_NOT_MATCHED;
    END IF;

    UPDATE trade_board
    SET trade_title = NVL(ptrade_title, trade_title)
        ,trade_content = NVL(ptrade_content, trade_content)
        ,trade_price = NVL(ptrade_price, trade_price)
        ,trade_location = NVL(ptrade_location, trade_location)
        ,upload_date = NVL(pupload_date, upload_date)
    WHERE trade_num = ptrade_num;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Trade number ' || ptrade_num || ' does not exist.');
    WHEN MEMBER_NOT_MATCHED THEN
        DBMS_OUTPUT.PUT_LINE('Member number ' || pmember_num || ' does not match.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

-- ������
BEGIN
    up_updtradeboard(1, pmember_num => 2
    ,ptrade_title => '������', pupload_date => '24/03/08', ptrade_price => 200000);
END;

-- �߰�ŷ� �Խ��� ����
CREATE OR REPLACE PROCEDURE up_delTradeBoard(
    ptrade_num IN NUMBER
    ,pmember_num IN NUMBER
)
IS
    vmember_num trade_board.member_num%TYPE;
    MEMBER_NOT_MATCHED EXCEPTION;
BEGIN
    -- �ش� trade_num�� ���� member_num ���� �����ɴϴ�.
    SELECT member_num INTO vmember_num
    FROM trade_board
    WHERE trade_num = ptrade_num;

    IF vmember_num != pmember_num THEN
        RAISE MEMBER_NOT_MATCHED;
    END IF;

    DELETE trade_board
    WHERE trade_num = ptrade_num;   

    DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Trade number ' || ptrade_num || ' does not exist.');
    WHEN MEMBER_NOT_MATCHED THEN
        DBMS_OUTPUT.PUT_LINE('Member number ' || pmember_num || ' does not match.'); 
END;


BEGIN
    up_delTradeBoard(ptrade_num => 1, pmember_num => 1);
END;

-- �߰�ŷ� �Խ��� ���� Ʈ����
CREATE OR REPLACE TRIGGER ut_del_related_trade_board
BEFORE DELETE ON trade_board
FOR EACH ROW
BEGIN
    -- trade_board_like ���̺��� �ش� trade_num�� �����ϴ� ������ ����
    DELETE FROM trade_board_like
    WHERE trade_num = :OLD.trade_num;

    -- item_image ���̺��� �ش� trade_num�� �����ϴ� ������ ����
    DELETE FROM item_image
    WHERE trade_num = :OLD.trade_num;
END;

--------------------------------------------------------------------------------



--------------------------- �߰�ŷ� �Խ��� ���ƿ� ------------------------------
-- �߰�/����
CREATE OR REPLACE PROCEDURE up_insert_t_board_like
(

    pt_num NUMBER,
    pmember_num NUMBER
)
IS
    v_count NUMBER;
BEGIN
        SELECT COUNT(*)
            INTO v_count
        FROM trade_board_like
        WHERE trade_num = pt_num AND member_num = pmember_num;
        
        IF v_count = 0 THEN
            INSERT INTO trade_board_like(trade_like_num, trade_num, member_num)
            VALUES(seq_tboard_like.NEXTVAL, 1, 1);
        ELSIF v_count > 0 THEN
            DELETE FROM trade_board_like
            WHERE trade_num = pt_num AND member_num = pmember_num;
--        ELSE
        END IF;
--EXCEPTION
END;
EXECUTE up_insert_t_board_like(1, 1);

--------------------------------------------------------------------------------



--------------------------- ���׻�Ȱ ī�װ� -----------------------------------
-- ���׻�Ȱ ī�װ� �߰�
CREATE OR REPLACE PROCEDURE UP_INSCOMMCTGR
(
    pcomm_ctgr_num   comm_ctgr.comm_ctgr_num%TYPE 
    , pcomm_ctgr_name  comm_ctgr.comm_ctgr_name%TYPE 
)
IS
BEGIN
    INSERT INTO comm_ctgr ( comm_ctgr_num, comm_ctgr_name )
    VALUES (pcomm_ctgr_num, pcomm_ctgr_name );
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('ī�װ���ȣ: ' || pcomm_ctgr_num || ', ' || 'ī�װ��̸� : ' || pcomm_ctgr_name );
-- 
END ;

EXEC UP_INSCOMMCTGR(10, '������ǰ');

-- ���׻�Ȱ ī�װ� ����
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

EXEC up_updcommctgr(1, '�α�');

-- ���׻�Ȱ ī�װ� ����
CREATE OR REPLACE PROCEDURE up_delcommctgr
(
    pcomm_ctgr_num NUMBER
)
IS
BEGIN
    DELETE FROM comm_ctgr
    WHERE comm_ctgr_num = pcomm_ctgr_num ;
    COMMIT ;
--EXCEPTION
END;

EXEC up_delcommctgr(1);

--------------------------------------------------------------------------------



------------------------------- ���׻�Ȱ �Խ��� ---------------------------------
-- ���׻�Ȱ �Խ��� ����
CREATE OR REPLACE PROCEDURE up_updCommBoard(
    pcomm_board_num IN NUMBER
    ,pmember_num IN NUMBER
    ,pcomm_ctgr_num IN NUMBER DEFAULT NULL
    ,pcomm_title IN comm_board.comm_title%TYPE := NULL
    ,pcomm_content comm_board.comm_content%TYPE := NULL
    ,pcomm_upload_date IN DATE DEFAULT TO_DATE(SYSDATE, 'YY-MM-DD')
)
IS
    vmember_num comm_board.member_num%TYPE;
    MEMBER_NOT_MATCHED EXCEPTION;
BEGIN
    -- �ش� trade_num�� ���� member_num ���� �����ɴϴ�.
    SELECT member_num INTO vmember_num
    FROM comm_board
    WHERE comm_board_num = pcomm_board_num;

    IF vmember_num != pmember_num THEN
        RAISE MEMBER_NOT_MATCHED;
    END IF;

    UPDATE comm_board
    SET comm_title = NVL(pcomm_title, comm_title)
        ,comm_ctgr_num = NVL(pcomm_ctgr_num, comm_ctgr_num)
        ,comm_content = NVL(pcomm_content, comm_content)
        ,comm_upload_date = pcomm_upload_date
    WHERE comm_board_num = pcomm_board_num;
    
    
    DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Comm board number ' || pcomm_board_num || ' does not exist.');
    WHEN MEMBER_NOT_MATCHED THEN
        DBMS_OUTPUT.PUT_LINE('Member number ' || pmember_num || ' does not match.'); 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

BEGIN
    up_updCommBoard(pcomm_board_num => 1, pmember_num => 9, pcomm_title => '���� ����');
END;


-- ���׻�Ȱ �Խ��� ����
SELECT * FROM comm_board;
CREATE OR REPLACE PROCEDURE up_delCommBoard(
    pcomm_board_num IN NUMBER
    ,pmember_num IN NUMBER
)
IS
    vmember_num comm_board.member_num%TYPE;
    MEMBER_NOT_MATCHED EXCEPTION;
BEGIN
    -- �ش� trade_num�� ���� member_num ���� �����ɴϴ�.
    SELECT member_num INTO vmember_num
    FROM comm_board
    WHERE comm_board_num = pcomm_board_num;

    IF vmember_num != pmember_num THEN
        RAISE MEMBER_NOT_MATCHED;
    END IF;

    DELETE comm_board
    WHERE comm_board_num = pcomm_board_num;
        

    DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Comm board number ' || pcomm_board_num || ' does not exist.');
    WHEN MEMBER_NOT_MATCHED THEN
        DBMS_OUTPUT.PUT_LINE('Member number ' || pmember_num || ' does not match.'); 
END;

-- ���׻�Ȱ �Խ��� ���� Ʈ���� (1�� �Խ��� ������ ��۱��� ���� DELETE)
CREATE OR REPLACE TRIGGER ut_del_related_comm_board
BEFORE DELETE ON comm_board
FOR EACH ROW
BEGIN
    DELETE FROM cmt_reply_like
    WHERE rcmt_num = (SELECT rcmt_num FROM cmt_reply WHERE cmt_board_num = :OLD.comm_board_num);

    DELETE FROM cmt_reply
    WHERE cmt_board_num = :OLD.comm_board_num;
    
    DELETE FROM comm_cmt_like
    WHERE comm_board_num = :OLD.comm_board_num;
    
    DELETE FROM comm_cmt
    WHERE comm_board_num = :OLD.comm_board_num;
    
    DELETE FROM comm_board_like
    WHERE comm_board_num = :OLD.comm_board_num;
    
END;

BEGIN
    up_delCommBoard(pcomm_board_num => 1, pmember_num => 1);
END;

--------------------------------------------------------------------------------



------------------------ ���׻�Ȱ �Խ��� ���ƿ� ---------------------------------
-- ���׻�Ȱ �Խ��� ���ƿ� �߰�/����

CREATE OR REPLACE PROCEDURE up_insdelboardlike
(
    pcomm_like_num  comm_board_like.comm_like_num%TYPE
    , pmember_num   comm_board_like.member_num%TYPE
    , pcomm_board_num     comm_board_like.comm_board_num%TYPE
)
IS
    cnt_boardlike NUMBER;
BEGIN
    SELECT COUNT(comm_like_num) INTO cnt_boardlike
    FROM comm_board_like 
    WHERE member_num = pmember_num AND comm_board_num = pcomm_board_num ;
    
    IF cnt_boardlike < 1 THEN 
        INSERT INTO comm_board_like VALUES (pcomm_like_num, pmember_num, pcomm_board_num) ;
    ELSIF cnt_boardlike = 1 THEN
        DELETE FROM comm_board_like WHERE member_num = pmember_num;
    END IF; 
    
    COMMIT;
    
--EXCEPTION
END;

EXEC up_insboardlike ( 14, 8, 11 );

--------------------------------------------------------------------------------



------------------------------- ���׻�Ȱ ��� -----------------------------------
-- ���׻�Ȱ ��� ����
CREATE OR REPLACE PROCEDURE up_updcmt
(
    p_comm_board_num comm_cmt.comm_board_num%TYPE := NULL,
    p_comm_num comm_cmt.comm_num%TYPE := NULL,
    p_member_num comm_cmt.member_num%TYPE := NULL,
    p_comm_date comm_cmt.comm_date%TYPE := NULL,
    p_comm_content comm_cmt.comm_content%TYPE := NULL
)
IS
  v_rows_updated INTEGER;
BEGIN
    UPDATE comm_cmt
    SET comm_board_num = NVL(p_comm_board_num, comm_board_num),
        comm_num = NVL(p_comm_num, comm_num),
        member_num = NVL(p_member_num, member_num),
        comm_date = NVL(p_comm_date, comm_date),
        comm_content = NVL(p_comm_content, comm_content)
    WHERE comm_num = p_comm_num AND comm_board_num = p_comm_board_num;

    v_rows_updated := SQL%ROWCOUNT;

    IF v_rows_updated > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_rows_updated || '���� ����� �����Ǿ����ϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('������ ����� �����ϴ�.');
    END IF;
END;
EXEC up_updcmt(21, 23, 30, SYSDATE, '������ ��� �����Դϴ�.');

-- ���׻�Ȱ ��� ����
CREATE OR REPLACE PROCEDURE up_delcmt
(
    p_comm_board_num comm_cmt.comm_board_num%TYPE := NULL
)
IS
  v_rows_deleted INTEGER;
BEGIN
    -- �ڽ� ���ڵ�(����) ����
    DELETE FROM cmt_reply WHERE comm_board_num = p_comm_board_num;

    -- �θ� ���ڵ�(���) ����
    DELETE FROM comm_cmt WHERE comm_board_num = p_comm_board_num;

    v_rows_deleted := SQL%ROWCOUNT;

    IF v_rows_deleted > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_rows_deleted || '���� ����� �����Ǿ����ϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('������ ����� �����ϴ�.');
    END IF;
END;

EXEC up_delcmt(1);

--------------------------------------------------------------------------------



-------------------------- ���׻�Ȱ ��� ���ƿ� ---------------------------------
-- ���׻�Ȱ ��� ���ƿ� �߰�
CREATE OR REPLACE PROCEDURE up_inslike(
    p_board_num IN NUMBER,
    p_cmt_num IN NUMBER,
    p_member_num IN NUMBER)
AS
BEGIN
    -- ���ο� ���ƿ� ���� �߰�
    INSERT INTO comm_cmt_like (
        comm_cmt_like,  -- ���� �ĺ��� �÷��� ������ ���� �Ҵ�
        comm_board_num,
        cmt_num,
        member_num)
    VALUES (
        comm_cmt_like_seq.NEXTVAL,  -- ���⼭ �������� ���� ���� ���
        p_board_num,
        p_cmt_num,
        p_member_num);
        
    -- INSERT �۾� �� Ŀ��
    COMMIT;
    
    -- �߰��� ���ƿ� ���� ���
    DBMS_OUTPUT.put_line('�Խ��� ��ȣ: ' || p_board_num || ', ��� ��ȣ: ' || p_cmt_num || '�� ���� ���ƿ䰡 �߰��Ǿ����ϴ�. ȸ�� ��ȣ: ' || p_member_num);
END;
-- EXEC up_inslike(1, 10, 3);


-- ���׻�Ȱ ��� ���ƿ� ����(���)
CREATE OR REPLACE PROCEDURE up_dellike(
    p_board_num IN NUMBER,
    p_cmt_num IN NUMBER,
    p_member_num IN NUMBER) -- ������ �Խ��� ��ȣ, ��� ��ȣ, ���ƿ並 ���� ȸ�� ��ȣ �Ű�����
AS
  v_count NUMBER := 0; -- ������ ���� ���� ������ ���� �ʱ�ȭ
BEGIN
    -- ���ƿ� ���� ����
    DELETE FROM comm_cmt_like
    WHERE comm_board_num = p_board_num
      AND cmt_num = p_cmt_num
      AND member_num = p_member_num;
    
    -- ������ ���� ���� ������ ����
    v_count := SQL%ROWCOUNT;

    -- ���� �۾� �� Ŀ��
    COMMIT;
    
    -- ������ ���ƿ� ���� ���
    IF v_count > 0 THEN
        DBMS_OUTPUT.put_line(v_count || '���� ���ƿ䰡 �����Ǿ����ϴ�. �Խ��� ��ȣ: ' || p_board_num || ', ��� ��ȣ: ' || p_cmt_num || ', ȸ�� ��ȣ: ' || p_member_num || '.');
    ELSE
        DBMS_OUTPUT.put_line('������ ���ƿ� ������ �����ϴ�.');
    END IF;
END;

EXEC up_dellike(1, 10, 3);

--------------------------------------------------------------------------------



----------------------------- ���׻�Ȱ ���� -----------------------------------
-- ���׻�Ȱ ���� ����
CREATE OR REPLACE PROCEDURE up_updreply
(
  p_new_board_num cmt_reply.cmt_board_num%TYPE := NULL,  -- ���� �Խñ� ��ȣ
  p_new_num cmt_reply.rcmt_num%TYPE := NULL,  -- ���� ��ȣ
  p_new_member_num cmt_reply.member_num%TYPE := NULL,  -- �ۼ��� ��ȣ
  p_new_date cmt_reply.rcmt_date%TYPE := NULL,  -- ���� �ۼ� ��¥
  p_new_content cmt_reply.rcmt_content%TYPE := NULL  -- ���� ����
)
IS
BEGIN
  -- ���� ���� ������Ʈ
  UPDATE cmt_reply
  SET cmt_board_num = NVL(p_new_board_num, cmt_board_num),
      rcmt_num = NVL(p_new_num, rcmt_num),
      member_num = NVL(p_new_member_num, member_num),
      rcmt_date = NVL(p_new_date, rcmt_date),
      rcmt_content = NVL(p_new_content, rcmt_content)
  WHERE rcmt_num = p_new_num;

  -- ������Ʈ�� ���� �ִ��� Ȯ���ϰ� ��� �޽��� ���
  IF SQL%ROWCOUNT > 0 THEN
    DBMS_OUTPUT.PUT_LINE('���� ��ȣ ' || p_new_num || '�� ���������� �����Ǿ����ϴ�.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('���� ��ȣ ' || p_new_num || '�� �ش��ϴ� ������ �����ϴ�.');
  END IF;
END;
-- EXEC up_updreply(10, 10, 10, SYSDATE, '������ ���� �����Դϴ�.');

-- ���׻�Ȱ ���� ����
CREATE OR REPLACE PROCEDURE up_delreply
(
    p_rcmt_num cmt_reply.rcmt_num%TYPE -- ���� ��ȣ
)
IS
BEGIN
    -- ���ۿ� ���� ��� ���ƿ� ����
    DELETE FROM cmt_reply_like WHERE rcmt_num = p_rcmt_num;

    -- ���� ����
    DELETE FROM cmt_reply WHERE rcmt_num = p_rcmt_num;

    -- ������ ���� �ִ��� Ȯ���ϰ� ��� �޽��� ���
    IF SQL%ROWCOUNT > 0 THEN
      DBMS_OUTPUT.PUT_LINE('���� ��ȣ ' || p_rcmt_num || '�� �ش��ϴ� ������ ���������� �����Ǿ����ϴ�.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('���� ��ȣ ' || p_rcmt_num || '�� �ش��ϴ� ������ �����ϴ�.');
    END IF;
END;

EXEC up_delreply(10);

--------------------------------------------------------------------------------



-------------------------- ���׻�Ȱ ���� ���ƿ� -------------------------------
-- ���׻�Ȱ ���� ���ƿ� �߰�/����
CREATE OR REPLACE PROCEDURE up_insdelcmtreplylike

(
    prcmt_like_num  cmt_reply_like.rcmt_like_num%TYPE
    , pmember_num   cmt_reply_like.member_num%TYPE
    , prcmt_num     cmt_reply_like.rcmt_num%TYPE
)
IS
   cnt_replylike NUMBER;
BEGIN      

    SELECT COUNT(rcmt_like_num) INTO cnt_replylike
    FROM cmt_reply_like 
    WHERE member_num = pmember_num AND rcmt_num = prcmt_num ;
    
    SELECT COUNT(rcmt_like_num) INTO cnt_replylike
    FROM cmt_reply_like 
    WHERE member_num = pmember_num AND rcmt_num = prcmt_num ;

    IF cnt_replylike < 1 THEN 
        INSERT INTO cmt_reply_like VALUES (prcmt_like_num, pmember_num, prcmt_num) ;
    ELSIF cnt_replylike = 1 THEN
        DELETE FROM cmt_reply_like WHERE member_num = pmember_num;
    END IF; 
    
    COMMIT;

--EXCEPTION
END;

EXEC up_insdelcmtreplylike(25, 2, 1);

--------------------------------------------------------------------------------

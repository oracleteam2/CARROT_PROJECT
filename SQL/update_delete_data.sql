-- SCOTT
-- ������ �߰�/����/����
----
-- ȸ��
-- ȸ�� ���� ����
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

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20002, '������Ʈ�� ȸ���� �������� �ʴ´�.');
END;

EXEC up_update_member(1, '����')
ROLLBaCk;
SELECT * FROM member;

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

EXECUTE up_insert_member( '981012', '����', '���� ���ֱ� �����', '010-1111-2222', 'https://image.newsis.com/2012/05/25/NISI20120525_0006401508_web.jpg');
SELECT * FROM member;

-- ȸ�� ����
ALTER TABLE memeber
DROP CONSTRAINT PK_member CASCADE;

CREATE OR REPLACE PROCEDURE up_delete_member
(
    pmem_num member.member_num%TYPE
)
IS
    v_is_member NUMBER;
BEGIN
    SELECT COUNT(*)
        INTO v_is_member
    FROM member
    WHERE member_num = pmem_num;

    IF v_is_member = 1
    THEN
    DELETE FROM member
    WHERE member_num = pmem_num;
    ELSE
    RAISE_APPLICATION_ERROR(-20002, '������ ȸ���� �����ϴ�');
    END IF;
--EXCEPTION
END;


-- ������
-- ������ �߰� ���ν���
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

EXEC up_insAdmin('������4', 'admin9999', '12385');

-- ������ ���� ���� ���ν���
CREATE OR REPLACE PROCEDURE up_updAdmin
(
    padmin_num admin.admin_num%TYPE 
    , padmin_nickname admin.admin_nickname%TYPE := NULL
    , padmin_ID admin.admin_ID%TYPE := NULL 
    , padmin_password admin.admin_password%TYPE := NULL
)
IS
BEGIN
    UPDATE admin
    SET admin_nickname = NVL(padmin_nickname, admin_nickname)
        , admin_id = NVL(padmin_id, admin_id)
        , admin_password = NVL(padmin_password, admin_password)
    WHERE admin_num = padmin_num;
END;

EXEC up_updAdmin(1, padmin_id => 'admin1241');

SELECT * FROM admin;

ROLLBACK;

-- ������ ���� ���ν���

ALTER TABLE admin
DROP CONSTRAINT PK_admin CASCADE;

CREATE OR REPLACE PROCEDURE up_delAdmin
(
    padmin_num admin.admin_num%TYPE
)
IS
BEGIN
    DELETE FROM admin WHERE admin_num = padmin_num;
END;

EXEC up_delAdmin(5);


-- �Ű�
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

SELECT * FROM report;

-- ����
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

DELETE FROM block;

SELECT * FROM block;

-- ä��
CREATE OR REPLACE PROCEDURE delchat
( pchat_room_num chat.chat_room_num%type
)
IS
   -- vchat_room_num chat_board.chat_room_num%type;
BEGIN
    DELETE chat 
    Where chat_room_num = pchat_room_num;
    
    dbms_output.put_line(pchat_room_num || '�� ä�ù��� ���� �ƽ��ϴ�.');
END;

EXEC delchat(1);
ROLLBACK;

SELECT * FROM chat;

-- ä�� ����
CREATE Or REPLACE PROCEDURE delcontent
( pchat_num chat_board.chat_num%type
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

--exception

    dbms_output.put_line('������ ä���� �����ƽ��ϴ�.');
END;

EXEC delcontent(2);

SELECT * FROM chat_board;

-- �������
-- ȸ�� ������� �߰�
create or replace PROCEDURE up_insert_danggeun_pay
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

SELECT * FROM danggeun_pay;


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

EXECUTE up_charge_danggeun_pay( 11, 30000);

-- ����
--pay_num NUMBER : ���� ��ȣ ( PK )
--chat_room_num NUMBER : ä�ù� ��ȣ ( FK )
--member_num NUMBER : ������ȣ1 �Ǹ���
--member_num2 NUMBER : ������ȣ2 ������
--pay_date DATE : �۱ݳ�¥
--remittance_amount NUMBER : �۱ݱݾ�
SELECT * FROM chat;


-- ���� ���̺� INSERT
CREATE OR REPLACE PROCEDURE up_insert_pay
(
    p_chat_num chat.chat_room_num%TYPE
)
IS
    vmem_nickname member.member_nickname%TYPE;
    vseller_num trade.member_num%TYPE; -- �Ǹ���
    vbuyer_num chat.buyer_num%TYPE; -- ������
    vtrade_num chat.trade_num%TYPE; -- chat���� trade��ȣ�� ������
    vbalance danggeun_pay.balance%TYPE;
    vprice NUMBER;
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
    
    DBMS_OUTPUT.PUT_LINE ( vmem_nickname );
    DBMS_OUTPUT.PUT_LINE ( vprice || '��');
    DBMS_OUTPUT.PUT_LINE ( '�����ݾ�' || vbalance || '��' );
    DBMS_OUTPUT.PUT_LINE ( '1' || '2' || '3' );
    DBMS_OUTPUT.PUT_LINE ( '4' || '5' || '6' );
    DBMS_OUTPUT.PUT_LINE ( '7' || '8' || '9' );
    DBMS_OUTPUT.PUT_LINE ( ''  || '0' || '<-' );
    
    IF vbalance >= vprice THEN
    INSERT INTO pay ( pay_num, chat_room_num, seller_num, buyer_num, pay_date, remittance_amount )
    VALUES (seq_pay.NEXTVAL, p_chat_num, vseller_num, vbuyer_num, SYSDATE, vprice);
    ELSE 
    RAISE_APPLICATION_ERROR(-06502, '���� �ܾ��� �����մϴ�.');
    END IF;
--EXCEPTION
END;

EXECUTE up_insert_pay(1);

SELECT * FROM pay;

-- num1�� ������ �Ǹ��� ������� �ݾ� ++
-- num2�� ������ ������ ������� �ݾ� --
CREATE OR REPLACE TRIGGER ut_update_danggeun
AFTER 
INSERT ON pay
FOR EACH ROW
BEGIN

    UPDATE danggeun_pay 
    SET balance = balance + :NEW.remittance_amount
    WHERE member_num = :NEW.seler_num;
    
    UPDATE danggeun_pay
    SET balance = balance - :NEW.remittance_amount
    WHERE member_num = :NEW.buyer_num;
END;


-- �������� �Խ���
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

-- �������� �Խ��� ���� ���ν���
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


-- �������� �Խ��� ���� ���ν���
CREATE OR REPLACE PROCEDURE up_delNoticeBoard
(
    pnotice_num notice_board.notice_num%TYPE
)
IS
BEGIN
    DELETE FROM notice_board WHERE notice_num = pnotice_num;
END;

EXEC up_delNoticeBoard (3);

-- �ǸŹ�ǰ ī�װ�
UPDATE item_ctgr
SET item_ctgr_name = '������'
WHERE item_ctgr_num = 1;

SELECT * FROM item_ctgr;
ROLLBACK;

COMMIT;

-- �߰�ŷ� �Խ���
-- �߰�ŷ� ������ ����
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
up_updtradeboard(1, pmember_num => 1
,ptrade_title => '������', pupload_date => '24/03/08', ptrade_price => 200000);
END;


-- �߰�ŷ� ������ ����
--ALTER TABLE trade_board
--DROP CONSTRAINT PK_TRADEBOARD CASCADE;
--
--SELECT *
--FROM trade_board;
--
--SELECT *
--FROM item_image
--WHERE trade_num = 1;
--
--SELECT *
--FROM trade_board_like
--WHERE trade_num = 1;
--
--DELETE FROM trade_board
--WHERE trade_num = 1;

ROLLBACK;

-- �ŷ��Խ��� ����
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
        
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Trade number ' || ptrade_num || ' does not exist.');
    WHEN MEMBER_NOT_MATCHED THEN
        DBMS_OUTPUT.PUT_LINE('Member number ' || pmember_num || ' does not match.'); 
END;

BEGIN
    up_delTradeBoard(ptrade_num => 1, pmember_num => 2);
END;

CREATE OR REPLACE TRIGGER delete_related_data_trigger
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


-- ��ǰ �̹���
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

-- �߰�ŷ� �Խ��� ���ƿ�
<<<<<<< HEAD
-- �̹� �ش�Խ��ǿ� �ش�ȸ���� ���ƿ並 ������ �� ���� ������ ����
DROP  TRIGGER ut_insTradeBoardLike;

CREATE OR REPLACE TRIGGER ut_insTradeBoardLike
BEFORE INSERT ON trade_board_like
FOR EACH ROW
DECLARE
    vcount NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO vcount
    FROM trade_board_like
    WHERE trade_num = :NEW.trade_num AND member_num = :NEW.member_num;

    IF vcount > 0 THEN
        DELETE FROM trade_board_like
        WHERE trade_num = :NEW.trade_num AND member_num = :NEW.member_num;
        
        :NEW.trade_num := NULL;
        :NEW.member_num := NULL;
--        
    END IF;
--    
    DELETE FROM trade_board_like
    WHERE trade_num IS NULL AND member_num IS NULL;
END;


INSERT INTO trade_board_like(trade_like_num, trade_num, member_num)
VALUES(16, 1, 1);

SELECT * FROM trade_board_like;

DELETE trade_board_like
where trade_like_num = 16;

=======
>>>>>>> f18a682367c179c541f4f956841bc02bba456d54
-- ����ѹ�, Ʈ���̵� �ѹ� �����ſ��� Ʈ���̵� ���� ����ũ �ѹ� �����ͼ� �׹�ȣ ����
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

SELECT * FROM trade_board_like;

DELETE trade_board_like
where trade_like_num = 16;

ROLLBACK;

-- �ųʿµ�
-- �ŷ��� �̷��� �����(ä�ù��� �ְ�, �ŷ��� �Ϸ�� �����)���� �ųʿµ� �ø��ų� ���� �� �ִ�.
-- �ŷ��Ϸ� ���¸� üũ�ؾ��Ұ� ����.
-- ä�ð����ؼ��� Ʈ������ ������ �־ ���� �ŷ��Ϸᰡ �ƴϴ��� ä���� ������ �ųʿµ� �ø��ų� ���ߴ°� �����Ѱɷ� ���� �����Ͱ���.
CREATE SEQUENCE seq_manner_points 
INCREMENT BY 1
START WITH 1
NOCYCLE NOCACHE;
--manner_point_num: �ųʿµ� ( PK )
--chat_room_num : ä�ù� 
--manner_points: �ųʿµ� ����.
--updateDate: �ųʿµ� ������Ʈ ��¥.
-- ������ �ųʿµ��� �������� � ȸ����
-- 1 -> 2���� �ųʿµ� ������.
-- �Ű����� 2���ְ�
-- 1���� 2���� pay�Խ����� ������ �Ǿ� �ִ��� Ȯ��
-- ������ �µ� �÷��ִ� INSERT�ϰ� ȸ�� �ųʿµ� ���̺��� UPDATEƮ���� �۵�

-- �ųʿµ� ���̺� press_mem_num, compress_mem_num �߰��� ������
-- �ųʿµ� ++ ���ִ� ���� ( -- �ϴ� ������ ������ �����ҵ� )
CREATE OR REPLACE PROCEDURE up_insert_manner_points
(
    p_chat_room_num pay.chat_room_num%TYPE,
    p_press_mem_num  NUMBER,        --�ųʿµ� �������
    p_compress_mem_num NUMBER       --�ųʿµ� ������ ���
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
    WHERE (buyer_num = p_press_mem_num AND seller_num = p_compress_mem_num) OR
          (buyer_num = p_compress_mem_num AND seller_num = p_press_mem_num);
          
    IF v_m_count = 0 AND v_p_count = 1 THEN
    INSERT INTO manner_points ( manner_points_num, chat_room_num, press_mem_num, compress_mem_num, manner_points, update_date )
    VALUES ( seq_manner_points.NEXTVAL, p_chat_room_num, p_press_mem_num , p_compress_mem_num, vmem_manner_points+(vmem_manner_points*0.025)  ,SYSDATE );
    ELSE
    RAISE_APPLICATION_ERROR(-20001, '�̹� �ųʿµ��� ���� ȸ���Դϴ�.');
    END IF;
--EXCEPTION
END;

SELECT * FROM chat;

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

EXEC up_insert_manner_points( 1, 2, 1);
EXECUTE up_insert_pay(6);
EXECUTE up_select_mpage(1);

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
-- 
END ;

EXEC UP_INSCOMMCTAR(10, '������ǰ');

SELECT * FROM comm_ctgr;

DELETE FROM comm_ctgr WHERE comm_ctgr_num = 10;

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

EXEC up_updcommctgr(1, '�α�');

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

EXEC up_delcommctgr(1);


-- ���׻�Ȱ �Խ���


-- ���׻�Ȱ ���
-- ���׻�Ȱ ��� �߰�
CREATE OR REPLACE PROCEDURE add_comment(
    p_board_num IN NUMBER,
    p_member_num IN NUMBER,
    p_content IN VARCHAR2,
    pcomm_num NUMBER
    ) -- ��� �߰��� ���� �Ű�����
AS
BEGIN
    -- ���ο� ��� INSERT
    INSERT INTO comm_cmt VALUES (p_board_num, pcomm_num, p_member_num, SYSDATE, p_content);
END;

EXEC add_comment(1, 2, '������ʹ�', 20);

SELECT * FROM comm_cmt;

-- ���׻�Ȱ ��� ����
CREATE OR REPLACE PROCEDURE up_delcmt
(
    p_comm_board_num comm_cmt.comm_board_num%TYPE := NULL
)
IS
  v_rows_deleted INTEGER;
BEGIN
    DELETE FROM comm_cmt WHERE comm_board_num = p_comm_board_num;

    v_rows_deleted := SQL%ROWCOUNT;

    IF v_rows_deleted > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_rows_deleted || '���� ����� �����Ǿ����ϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('������ ����� �����ϴ�.');
    END IF;
END;

EXEC up_delcmt(10);

-- ���׻�Ȱ ��� ����
CREATE OR REPLACE PROCEDURE up_updCmt
(
  -- �Է� �Ű����� �̸� ���� (comm_cmt �÷��� ����)
  pcomm_board_num NUMBER,
  pcomm_num NUMBER,
  p_new_date comm_cmt.comm_date%TYPE := SYSDATE,
  p_new_content comm_cmt.comm_content%TYPE := NULL
)
IS
BEGIN
  -- UPDATE ���� ���� (comm_board_num 1ȸ�� ����)
  UPDATE comm_cmt
  SET comm_content = NVL(p_new_content, comm_content)
  WHERE comm_board_num = pcomm_board_num;
END;

EXEC up_updCmt( 1, p_new_content => '���� ����' )

-- ���׻�Ȱ ����
-- 2-1. ���׻�Ȱ ���� �߰�
CREATE OR REPLACE PROCEDURE add_reply(
    p_board_num IN NUMBER,
    p_comm_num IN NUMBER,
    p_member_num IN NUMBER,
    p_content IN VARCHAR2) -- ���� �߰��� ���� �� �Ű�����
AS
BEGIN
    -- ���ο� ���� �߰�(INSERT��)
    INSERT INTO cmt_reply (
        cmt_board_num,
        comm_num,
        member_num,
        rcmt_content)
    -- ���� �߰��� ���� ��
    VALUES (
        p_board_num,
        p_comm_num,
        p_member_num,
        p_content);
END;

EXEC add_reply()

-- ���� ����
CREATE OR REPLACE PROCEDURE up_insrely
(
    p_new_rcmt_num cmt_reply.rcmt_num%TYPE := NULL,
    p_new_member_num cmt_reply.member_num%TYPE := NULL,
    p_new_rcmt_date cmt_reply.rcmt_date%TYPE := NULL,
    p_new_rcmt_content cmt_reply.rcmt_content%TYPE := NULL
)
IS
BEGIN
    UPDATE cmt_reply
    SET rcmt_num = NVL(p_new_rcmt_num, rcmt_num),
        member_num = NVL(p_new_member_num, member_num),
        rcmt_date = NVL(p_new_rcmt_date, rcmt_date),
        rcmt_content = NVL(p_new_rcmt_content, rcmt_content)
    WHERE rcmt_num = p_new_rcmt_num;
END;
EXEC up_insrely();

-- ���׻�Ȱ �Խ��� ���ƿ�
-- �߰�/����
SELECT * FROM comm_board_like ;
-- up_udtcmtreplylike �Խ������ƿ� �߰� (�Ϸ�)
CREATE OR REPLACE PROCEDURE up_insboardlike
(
    pcomm_like_num  comm_board_like.comm_like_num%TYPE
    , pmember_num   comm_board_like.member_num%TYPE
    , pcomm_board_num     comm_board_like.comm_board_num%TYPE
)
IS
    vrow comm_board_like%ROWTYPE;
BEGIN
    --PLS-00103: Encountered the symbol "DISTINCT" when expecting one of the following:
    select * into vrow
    from comm_board_like where member_num != pmember_num and comm_board_num = pcomm_board_num ;
    
    INSERT INTO comm_board_like ( comm_like_num, member_num, comm_board_num )
    values (pcomm_like_num, pmember_num, pcomm_board_num );
    commit;
    
    DBMS_OUTPUT.PUT_LINE('���׻�Ȱ �Խ��� ���ƿ� �ѹ�: ' || pcomm_like_num || ', ' || 'ȸ�� �ѹ� : ' || pmember_num
                        || ', ' || '���׻�Ȱ �Խ��� �ѹ�: ' || ', ' || pcomm_board_num );
--EXCEPTION
END;

EXEC up_insboardlike()

--select * 
--from comm_board_like where member_num != 1 and comm_board_num = 1 ;
--exec up_insboardlike ( 20, 2, 1);

--up_delcmtreplylike �Խ������ƿ� ���� ( �Ϸ� )
CREATE OR REPLACE PROCEDURE up_delboardlike
(
    pcomm_like_num  comm_board_like.comm_like_num%TYPE
    , pmember_num   comm_board_like.member_num%TYPE
    , pcomm_board_num     comm_board_like.comm_board_num%TYPE
)
IS
    vrow comm_board_like%ROWTYPE;
BEGIN   
    
    SELECT * INTO vrow
    from comm_board_like where member_num = pmember_num and comm_like_num = pcomm_like_num ;
    
    DELETE FROM comm_board_like
    where member_num = pmember_num ;
    commit ;
--EXCEPTION
END;


SELECT * FROM comm_board_like ;

--
EXEC up_delboardlike( 14, 1, 1);
--
--DESC comm_board_like;
--SELECT * FROM comm_board_like WHERE COMM_BOARD_NUM = 1;
--INSERT INTO comm_board_like VALUES (15,2,1 );

-- ���׻�Ȱ ��� ���ƿ�


-- ���׻�Ȱ ���� ���ƿ�
-- �߰�/����
SELECT * FROM cmt_reply_like ;
DESC cmt_reply_like;

-- ���׻�Ȱ ���� ���ƿ�
---- �߰�/����
-- up_inscmtreplylike �������ƿ� �߰�
CREATE OR REPLACE PROCEDURE up_inscmtreplylike
(
    prcmt_like_num  cmt_reply_like.rcmt_like_num%TYPE
    , pmember_num   cmt_reply_like.member_num%TYPE
    , prcmt_num     cmt_reply_like.rcmt_num%TYPE
)
IS
    vrlrow cmt_reply_like%ROWTYPE;
    select * into vrlrow
    from cmt_reply_like where member_num != pmember_num and rcmt_num = prcmt_num
                       
BEGIN
      
    INSERT INTO cmt_reply_like ( rcmt_like_num, member_num, rcmt_num )
    values (prcmt_like_num, pmember_num, prcmt_num );
    commit;
    
--    DBMS_OUTPUT.PUT_LINE('���׻�Ȱ ���� ���ƿ� �ѹ�: ' || prcmt_like_num || ', ' || 'ȸ�� �ѹ� : ' || pmember_num
--                        || ', ' || '���׻�Ȱ ���� �ѹ�: ' || ', ' || prcmt_num );
    
--EXCEPTION
END;

--EXEC up_inscmtreplylike(20, 2, 1);
--select * from cmt_reply_like;
--delete from cmt_reply_like where rcmt_like_num = 23;
--select * 
--from cmt_reply_like where member_num != 2 and rcmt_num = 1 ;
--up_delcmtreplylike �������ƿ� ����
CREATE OR REPLACE PROCEDURE up_delcmtreplylike
(
    prcmt_like_num  cmt_reply_like.rcmt_like_num%TYPE
    , pmember_num   cmt_reply_like.member_num%TYPE
    , prcmt_num     cmt_reply_like.rcmt_num%TYPE
)
IS
    vrlrow cmt_reply_like%ROWTYPE;
BEGIN
    SELECT * INTO vrow
    from comm_board_like where member_num = pmember_num and rcmt_num = prcmt_num ;
    
    DELETE FROM cmt_reply_like
    where member_num = pmember_num ;
    commit ;
    
--EXCEPTION
END;

--EXEC up_delcmtreplylike(19, 5, 1);
--SELECT * FROM cmt_reply_like;

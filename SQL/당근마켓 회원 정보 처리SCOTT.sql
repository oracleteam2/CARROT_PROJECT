

�̵��� (��,�� ����)
-- ȸ�� ����
-- ȸ�� ���������� ��ȸ
-- ȸ������
-- ������� �ݾ�����
-- ȸ�� ������� �߰�
-- ȸ�� �߰�


-- ȸ�� ���õ����� ����
-- ����



-- ȸ�� ���������� ��ȸ
CREATE OR REPLACE PROCEDURE up_selmypage
(
    pmember_num member.member_num%TYPE
)
IS
    vcount_memb_tboard NUMBER;
    vmem_nickname member.member_nickname%TYPE;
    vmem_profile member.member_profile%TYPE;
    vmem_mpoints member.member_manner_points%TYPE;
    vmem_addr   member.member_address%TYPE;
BEGIN

    SELECT m.member_profile, m.member_nickname, m.member_manner_points, t.count_mem_tboard, m.member_address
        INTO  vmem_profile , vmem_nickname, vmem_mpoints, vcount_memb_tboard, vmem_addr
    FROM member m ,(
        SELECT COUNT(t.member_num) count_mem_tboard
        FROM member m JOIN trade_board t ON m.member_num = t.member_num 
        WHERE m.member_num = pmember_num
            ) t
    WHERE m.member_num = pmember_num;

    DBMS_OUTPUT.PUT( vmem_profile );
    DBMS_OUTPUT.PUT_LINE( vmem_nickname );
    DBMS_OUTPUT.PUT_LINE( '�ųʿµ� : ' || vmem_mpoints || '��' );
    DBMS_OUTPUT.PUT_LINE( '�ǸŹ�ǰ : ' ||vcount_memb_tboard || '��' );
    DBMS_OUTPUT.PUT_LINE( '�ּ� : ' || vmem_addr );

--EXCEPTION
END;


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


-- ȸ�� ���� ����
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


-- ȸ�� ������� �߰�
create or replace PROCEDURE up_insert_danggeun_pay
(
    pmem_num danggeun_pay.member_num%TYPE,
    paccount VARCHAR2,
    pbank_name danggeun_pay.bank_name%TYPE,
    pbalance danggeun_pay.balance%TYPE := 0
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


-- ȸ�� ����
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

-- ���� ���̺�
--ä�ÿ��� �ŷ���ȣ�� �־���Ѵ�.
--pay_num NUMBER : ���� ��ȣ ( PK )
--chat_room_num NUMBER : ä�ù� ��ȣ ( FK )
--member_num NUMBER : ������ȣ1 �Ǹ���
--member_num2 NUMBER : ������ȣ2 ������
--pay_date DATE : �۱ݳ�¥
--remittance_amount NUMBER : �۱ݱݾ�


CREATE OR REPLACE PROCEDURE up_insert_pay
(
    p_chat_num chat.chat_room_num%TYPE
)
IS
    vseller_num trade.member_num%TYPE; -- �Ǹ���
    vbuyer_num chat.buyer_num%TYPE; -- ������
    vtrade_num chat.trade_num%TYPE; -- chat���� trade��ȣ�� ������
    vprice NUMBER;
BEGIN
    -- ������
    SELECT trade_num, buyer_num
        INTO vtrade_num, vbuyer_num
    FROM chat
    WHERE chat_room_num = p_chat_num;
    
    SELECT trade_price, member_num 
        INTO vprice, seller_num
    FROM trade_board
    WHERE trade_num = vtrade_num;
    
    INSERT INTO pay ( pay_num, chat_room_num, seller_num, buyer_num, pay_date, remittance_amount )
    VALUES (seq_pay.NEXTVAL, p_chat_num, seller_num, vbuyer_num, SYSDATE, vprice);
--EXCEPTION
END;

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


-- ��������
-- �ųʿµ� ���̺�
-- �ŷ��� �̷��� �����(ä�ù��� �ְ�, �ŷ��� �Ϸ�� �����)���� �ųʿµ� �ø��ų� ���� �� �ִ�.
-- �ŷ��Ϸ� ���¸� üũ�ؾ��Ұ� ����.
-- ä�ð����ؼ��� Ʈ������ ������ �־ ���� �ŷ��Ϸᰡ �ƴϴ��� ä���� ������ �ųʿµ� �ø��ų� ���ߴ°� �����Ѱɷ� ���� �����Ͱ���.

--manner_point_num: �ųʿµ� ( PK )
--chat_room_num : ä�ù� 
--manner_points: �ųʿµ� ����.
--updateDate: �ųʿµ� ������Ʈ ��¥.
-- ������ �ųʿµ��� �������� � ȸ����
-- 1 -> 2���� �ųʿµ� ������.
-- �Ű����� 2���ְ�
-- 1���� 2���� pay�Խ����� ������ �Ǿ� �ִ��� Ȯ��
-- ������ �µ� �÷��ִ� INSERT�ϰ� ȸ�� �ųʿµ� ���̺��� UPDATEƮ���� �۵�
SELECT * FROM chat;
-- �ųʿµ� ���̺� press_mem_num, compress_mem_num �߰��� ������
-- �ųʿµ� ++ ���ִ� ���� ( -- �ϴ� ������ ������ �����ҵ� )

CREATE OR REPLACE PROCEDURE up_insert_manner_points
(
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
    WHERE (buyer_num = p_press_mem_num AND seller_num = p_compress_mem_num) OR
          (buyer_num = p_compress_mem_num AND seller_num = p_press_mem_num);
          
    IF v_m_count = 0 AND v_p_count = 1 AND p_�� LIKE '����' THEN
    INSERT INTO manner_points ( manner_proints_num, chat_room_num, press_mem_num, compress_mem_numm manner_points, update_date )
    VALUES ( seq_manner_points.NEXTVAL, p_chat_room_num, p_press_mem_num, p_compress_mem_num, vmem_manner_points+(vmem_manner_points*0.025)  ,SYSDATE );
    ELSIF v_m_count = 0 AND v_p_count = 1 AND p_�� LIKE '����' THEN
    INSERT INTO manner_points ( manner_proints_num, chat_room_num, press_mem_num, compress_mem_numm manner_points, update_date )
    VALUES ( seq_manner_points.NEXTVAL, p_chat_room_num, p_press_mem_num, p_compress_mem_num, vmem_manner_points-(vmem_manner_points*0.025)  ,SYSDATE );
    ELSE
    RAISE_APPLICATION_ERROR(-20001, '�̹� �ųʿµ��� ���� ȸ���Դϴ�.');
    END IF;
--EXCEPTION
END;

CREATE OR REPLACE TRIGGER ut_update_mem_manner
AFTER
INSERT ON manner_points
FOR EACH ROW
BEGIN
    UPDATE member
    SET manner_points = :NEW.manner_points
    WHERE member_num = :NEW.compress_mem_num;
END;



-- ȸ���ѹ�
EXECUTE up_select_mpage(1);

-- �ֹε�Ϲ�ȣ, �г���, �ּ�, ��ȭ��ȣ, �������̹���
EXECUTE up_insert_member( '981012', '����', '���� ���ֱ� �����', '010-1111-2222', 'https://image.newsis.com/2012/05/25/NISI20120525_0006401508_web.jpg');

-- ȸ���ѹ�, ȸ���г���, ȸ���ּ�, ȸ����ȭ��ȣ, ȸ�� �������̹���
EXECUTE up_update_member(10, '����');

-- ȸ���ѹ�, ���¹�ȣ, �����̸�, ������ ��(�⺻�� null��)
EXECUTE up_insert_danggeun_pay( 13, 0901091101878, '��������');

-- ȸ���ѹ� ( �����ִ� ������ ���� �����ϴ� BEFORE Ʈ���� �־���ҵ� )
EXECUTE up_delete_member(13);

-- ä�ù� ��ȣ
EXECUTE up_insert_pay(1);

-- ä�ù��ȣ, ��������ѹ�, ��������� �ѹ�, ��(����, ����)
EXECUTE( 6, 2, 1, '����'); 



DELETE FROM danggeun_pay
WHERE member_num = 13;

EXECUTE up_charge_danggeun_pay( 13, 30000);
EXECUTE up_insert_pay(6);
SELECT * FROM danggeun_pay;
SELECT * FROM member;

ALTER TABLE member DISABLE CONSTRAINT [���� ���� �̸�];
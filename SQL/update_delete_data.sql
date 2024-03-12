-- SCOTT
-- ������ �߰�/����/����
----
-- ȸ��


-- ������


-- �Ű�


-- ����

-- ä��

-------

CREATE OR REPLACE PROCEDURE delchat
( ptrade_num chat.trade_num%type
)
IS
   -- vchat_room_num chat_board.chat_room_num%type;
BEGIN
    DELETE chat 
    Where trade_num = ptrade_num;
    
    dbms_output.put_line(ptrade_num || '�� ä�ù��� ���� �ƽ��ϴ�.');
END;

  


-- ä�� ����


CREATE Or REPLACE PROCEDURE delcontent
( ptrade_num chat_board.trade_num%type
)
IS
vchat_num chat_board.chat_num%type;
    
BEGIN
    SELECT MAX(chat_num)
    INTO vchat_num
    FROM chat_board
    WHERE trade_num = ptrade_num;

DELETE 
FROM CHAT_BOARD
    WHERE chat_num=vchat_num;

--exception

    dbms_output.put_line('������ ä���� �����ƽ��ϴ�.');
END;


-- �������


-- ����


-- �������� �Խ���


-- �ǸŹ�ǰ ī�װ�
-- �ǸŹ�ǰ ī�װ� �� ���� Ʈ����
UPDATE item_ctgr
SET item_ctgr_name = '������'
WHERE item_ctgr_num = 1;

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
,ptrade_title => '������ �ƽ� ����ǰ', pupload_date => '24/03/08', ptrade_price => 200000);
END;


-- �߰�ŷ� ������ ����
---- �߰�ŷ� ���̺��� �����Ǹ� �������̹��� ���̺� �����Ǵ� Ʈ����
--CREATE OR REPLACE TRIGGER ut_deImage_Like
--BEFORE
--DELETE ON trade_board -- �߰�ŷ� �Խ��� ���̺�
--FOR EACH ROW
--BEGIN
--    DELETE FROM item_image  -- �߰�ŷ� ��ǰ �̹��� �������̺�
--    WHERE trade_num = :OLD.trade_num;
--    
--    DELETE FROM trade_board_like
--    WHERE trade_num = :OLD.trade_num;
----EXCEPTION
----  WHEN OTHERS THEN
----    raise_application_error(-20002,'XXX');    
--END;

-- �߰�ŷ� �Խ��� �����Ǹ� �ش� ���ƿ� ���̺� �����Ǵ� Ʈ����
--CREATE OR REPLACE TRIGGER ut_delTradeBoardLike
--BEFORE
--DELETE ON trade_board -- �߰�ŷ� �Խ��� ���̺�
--FOR EACH ROW
--DECLARE
--BEGIN
--    DELETE FROM trade_board_like
--    WHERE trade_num = :OLD.trade_num;
--END;

ALTER TABLE trade_board
DROP CONSTRAINT PK_TRADEBOARD CASCADE;

SELECT *
FROM trade_board;

SELECT *
FROM item_image
WHERE trade_num = 1;

SELECT *
FROM trade_board_like
WHERE trade_num = 1;

DELETE FROm trade_board
WHERE trade_num = 1;

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
    up_delTradeBoard(ptrade_num => 1, pmember_num => 1);
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
        
    END IF;
END;

INSERT INTO trade_board_like(trade_like_num, trade_num, member_num)
VALUES(16, 1, 1);

SELECT * FROM trade_board_like;

DELETE trade_board_like
where trade_like_num = 16;

-- ���׻�Ȱ ī�װ�
-- �߰�/����/����

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

--

-- ���׻�Ȱ �Խ���


-- ���׻�Ȱ ���


-- ���׻�Ȱ ����


-- ���׻�Ȱ �Խ��� ���ƿ�
-- [[���׻�Ȱ �Խ��� ���ƿ�]]
-- �߰�/����
CREATE OR REPLACE TRIGGER ut_inscommboardlike
BEFORE INSERT ON comm_board_like  
FOR EACH ROW
DECLARE
    vblcount NUMBER;
BEGIN
    SELECT COUNT(*) INTO vblcount
    FROM comm_board_like
    WHERE member_num = :NEW.member_num AND comm_board_num = :NEW.comm_board_num;

    IF vblcount > 0 THEN
        DELETE FROM comm_board_like
        WHERE member_num = :NEW.member_num AND comm_board_num = :NEW.comm_board_num;       
        
        :NEW.comm_board_num := NULL;
        :NEW.member_num := NULL;
     END IF;       
END;

-- ���׻�Ȱ ��� ���ƿ�


-- ���׻�Ȱ ���� ���ƿ�
---- �߰�/����

-- ���� �߰�/���� Ʈ���� ����
CREATE OR REPLACE TRIGGER ut_inscmtreplylike
BEFORE INSERT ON cmt_reply_like   
FOR EACH ROW
DECLARE
    vrlcount NUMBER;
BEGIN
    SELECT COUNT(*) INTO vrlcount
    FROM cmt_reply_like
    WHERE member_num = :NEW.member_num AND rcmt_num = :NEW.rcmt_num;

    IF vrlcount > 0 THEN
        DELETE FROM cmt_reply_like
        WHERE member_num = :NEW.member_num AND rcmt_num = :NEW.rcmt_num;       
        
        :NEW.rcmt_num := NULL;
        :NEW.member_num := NULL;
     END IF;       
END;

--
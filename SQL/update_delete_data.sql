-- SCOTT
-- ������ �߰�/����/����

-- ȸ��


-- ������


-- �Ű�


-- ����


-- ä��


-- ä�� ����


-- �������


-- ����


-- �������� �Խ���


-- �ǸŹ�ǰ ī�װ�
-- �ǸŹ�ǰ ī�װ� �� ���� Ʈ����
CREATE OR REPLACE TRIGGER ut_updItemCtgr
AFTER 
UPDATE OF item_ctgr_name ON item_ctgr 
FOR EACH ROW
DECLARE
BEGIN
    up_selTradeBoard(:OLD.item_ctgr_num);
END;

UPDATE item_ctgr
SET item_ctgr_name = '�Ƿ�'
WHERE item_ctgr_num = 3;

COMMIT;

-- �߰�ŷ� �Խ���


-- ��ǰ �̹���
CREATE OR REPLACE TRIGGER utItemImage
BEFORE INSERT OR UPDATE OR DELETE ON item_image
FOR EACH ROW
DECLARE
    vmember_num trade_board.member_num%TYPE;
BEGIN
    -- item_image ���̺� ���ο� �����Ͱ� ���Ե� ��
    IF INSERTING THEN
        -- �ش� trade_num�� ���� member_num ���� �����ɴϴ�.
        SELECT member_num INTO vmember_num
        FROM trade_board
        WHERE trade_num = :NEW.trade_num;

        -- ������ member_num ���� ���� ������� member_num ���� ���Ͽ� �ٸ� ��쿡�� ������ �߻���ŵ�ϴ�.
        IF vmember_num != :NEW.trade_num THEN
            RAISE_APPLICATION_ERROR(-20025, '�ش� trade_num�� ���� ���� ������ �����ϴ�.');
        END IF;
    END IF;

    -- item_image ���̺��� �����Ͱ� ������ ��
    IF UPDATING THEN
        -- ����� �����Ͱ� �ִ��� Ȯ���ϰ�, ����� trade_num�� ���� member_num ���� �����ɴϴ�.
        IF :OLD.trade_num != :NEW.trade_num THEN
            -- ���ο� trade_num�� ���� member_num ���� �����ɴϴ�.
            SELECT member_num INTO vmember_num
            FROM trade_board
            WHERE trade_num = :NEW.trade_num;

            -- ������ member_num ���� ���� ������� member_num ���� ���Ͽ� �ٸ� ��쿡�� ������ �߻���ŵ�ϴ�.
            IF vmember_num != :NEW.trade_num THEN
                RAISE_APPLICATION_ERROR(-20025, '�ش� trade_num�� ���� ���� ������ �����ϴ�.');
            END IF;
        END IF;
    END IF;

    -- item_image ���̺��� �����Ͱ� ������ ��
    IF DELETING THEN
        -- �ش� trade_num�� ���� member_num ���� �����ɴϴ�.
        SELECT member_num INTO vmember_num
        FROM trade_board
        WHERE trade_num = :OLD.trade_num;

        -- ������ member_num ���� ���� ������� member_num ���� ���Ͽ� �ٸ� ��쿡�� ������ �߻���ŵ�ϴ�.
        IF vmember_num != :OLD.trade_num THEN
            RAISE_APPLICATION_ERROR(-20025, '�ش� trade_num�� ���� ���� ������ �����ϴ�.');
        END IF;
    END IF;
END;

INSERT INTO item_image (trade_num, item_image_num, item_image_url) 
VALUES (1, seq_image.NEXTVAL, '���ο� �̹��� URL');

UPDATE item_image
SET item_image_url = '������ �̹��� URL'
WHERE item_image_num = 40;

DELETE item_image
WHERE item_image_num = 40;

-- �߰�ŷ� �Խ��� ���ƿ�
-- �̹� �ش�Խ��ǿ� �ش�ȸ���� ���ƿ並 ������ �� ���� ������ ����
CREATE OR REPLACE TRIGGER ut_insTradeBoardLike
BEFORE 
INSERT ON trade_board_like
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM trade_board_like
    WHERE trade_num = :NEW.trade_num AND member_num = :NEW.member_num;

    IF v_count > 0 THEN
        DELETE FROM trade_board_like WHERE trade_num = :NEW.trade_num AND member_num = :NEW.member_num;
    END IF;
    
    IF v_count = 0 AND :OLD.trade_num != :NEW.trade_num AND :OLD.member_num != :NEW.member_num THEN
        NULL;
    END IF;
END;

-- ���ƿ� �������� �ŷ��Խ��� ����ȸ�� �ݿ��Ǵ� Ʈ����
CREATE OR REPLACE TRIGGER ut_updSelTradeBoard
AFTER INSERT OR DELETE OR UPDATE ON trade_board_like
FOR EACH ROW
BEGIN
    IF INSERTING OR DELETING OR UPDATING THEN
        up_selTradeBoard(:NEW.trade_num);
    END IF;
END;

INSERT INTO trade_board_like(trade_like_num, trade_num, member_num)
VALUES(16, 7, 3);

DELETE trade_board_like
where trade_like_num = 1;

-- ���׻�Ȱ ī�װ�


-- ���׻�Ȱ �Խ���


-- ���׻�Ȱ ���


-- ���׻�Ȱ ����


-- ���׻�Ȱ �Խ��� ���ƿ�


-- ���׻�Ȱ ��� ���ƿ�


-- ���׻�Ȱ ���� ���ƿ�
-- SCOTT
-- �� ���̺� ��ȸ
-- ȸ��
SELECT * FROM member;


-- ������
SELECT * FROM admin;


-- �Ű�
SELECT * FROM report;


-- ����
SELECT * FROM block;


-- ä��
SELECT * FROM chat;


-- ä�� ����
SELECT * FROM chat_board;

-- �������
SELECT * FROM DANGGEUN_pay;


-- ����
SELECT * FROM pay;

-- �������� �Խ���
SELECT * FROM notice_board;


-- �Ǹ� ��ǰ ī�װ�
SELECT * FROM ITEM_CTGR;


-- �߰�ŷ� �Խ���
SELECT * FROM TRADE_BOARD
ORDER BY trade_num;
DELETE trade_board
WHERE trade_num = 12;

-- ��ǰ �̹���
SELECT * FROM item_image
ORDER BY trade_num, item_image_num;
ALTER TABLE item_image ADD member_num NUMBER;
ROLLBACK;

-- �߰�ŷ� �Խ��� ���ƿ�
SELECT * FROM trade_board_like
ORDER BY trade_like_num;

DELETE trade_board_like
WHERE trade_like_num = 1;
-- ���׻�Ȱ ī�װ�


-- ���׻�Ȱ �Խ���


-- ���׻�Ȱ ���


-- ���׻�Ȱ ����


-- ���׻�Ȱ �Խ��� ���ƿ�


-- ���׻�Ȱ ��� ���ƿ�


-- ���׻�Ȱ ���� ���ƿ�

dkdkdkdkdkdkdkdkd








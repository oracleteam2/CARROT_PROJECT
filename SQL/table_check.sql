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
<<<<<<< HEAD

-- �߰�ŷ� �Խ���
SELECT * FROM TRADE_BOARD;

-- ��ǰ �̹���
SELECT * FROM item_image;

-- �߰�ŷ� �Խ��� ���ƿ�
SELECT * FROM trade_board_like;

=======


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
>>>>>>> 1be24fee4c738d4ee927daa68b494c0e27f70f08
-- ���׻�Ȱ ī�װ�
SELECT * FROM

-- ���׻�Ȱ �Խ���
SELECT * FROM comm_board;

-- ���׻�Ȱ ���
SELECT * FROM COMM_CMT;

-- ���׻�Ȱ ����
SELECT * FROM CMT_REPLY;

-- ���׻�Ȱ �Խ��� ���ƿ�
SELECT * FROM comm_board_like;

-- ���׻�Ȱ ��� ���ƿ�
SELECT * FROM comm_cmt_like;
SELECT * FROM comm_cmt_like;

-- ���׻�Ȱ ���� ���ƿ�
<<<<<<< HEAD
SELECT * FROM CMT_REPLY_LIKE;
=======

dkdkdkdkdkdkdkdkd
>>>>>>> 1be24fee4c738d4ee927daa68b494c0e27f70f08








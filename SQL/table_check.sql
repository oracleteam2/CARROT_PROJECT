-- SCOTT
-- �? ?��?���? 조회
-- ?��?��
SELECT * FROM member;


-- �?리자
SELECT * FROM admin;


-- ?���?
SELECT * FROM report;


-- 차단
SELECT * FROM block;


-- 채팅
SELECT * FROM chat;


-- 채팅 ?��?��
SELECT * FROM chat_board;

-- ?��근페?��
SELECT * FROM DANGGEUN_pay;


-- 결제
SELECT * FROM pay;

-- 공�??��?�� 게시?��
SELECT * FROM notice_board;


-- ?���? 물품 카테고리
SELECT * FROM ITEM_CTGR;


-- 중고거래 게시?��
SELECT * FROM TRADE_BOARD
ORDER BY trade_num;
DELETE trade_board
WHERE trade_num = 12;




-- ��ǰ �̹���
SELECT * FROM item_image;

SELECT trade_num, item_image_num, member_num FROM item_image
ORDER BY trade_num, item_image_num;
ALTER TABLE item_image ADD member_num NUMBER;
ROLLBACK;

-- 중고거래 게시?�� 좋아?��
SELECT * FROM trade_board_like
ORDER BY trade_like_num;

DELETE trade_board_like
WHERE trade_like_num = 1;
-- ?��?��?��?�� 카테고리

-- ?��?��?��?�� 게시?��


-- ?��?��?��?�� ?���?


-- ?��?��?��?�� ???���?


-- ?��?��?��?�� 게시?�� 좋아?��


-- ?��?��?��?�� ?���? 좋아?��


-- ?��?��?��?�� ???���? 좋아?��









-- SCOTT
-- κ°? ??΄λΈ? μ‘°ν
-- ??
SELECT * FROM member;


-- κ΄?λ¦¬μ
SELECT * FROM admin;


-- ? κ³?
SELECT * FROM report;


-- μ°¨λ¨
SELECT * FROM block;


-- μ±ν
SELECT * FROM chat;


-- μ±ν ?΄?©
SELECT * FROM chat_board;

-- ?Ήκ·Όν?΄
SELECT * FROM DANGGEUN_pay;


-- κ²°μ 
SELECT * FROM pay;

-- κ³΅μ??¬?­ κ²μ?
SELECT * FROM notice_board;


-- ?λ§? λ¬Όν μΉ΄νκ³ λ¦¬
SELECT * FROM ITEM_CTGR;


-- μ€κ³ κ±°λ κ²μ?
SELECT * FROM TRADE_BOARD
ORDER BY trade_num;
DELETE trade_board
WHERE trade_num = 12;




-- »σΗ° ΐΜΉΜΑφ
SELECT * FROM item_image;

SELECT trade_num, item_image_num, member_num FROM item_image
ORDER BY trade_num, item_image_num;
ALTER TABLE item_image ADD member_num NUMBER;
ROLLBACK;

-- μ€κ³ κ±°λ κ²μ? μ’μ?
SELECT * FROM trade_board_like
ORDER BY trade_like_num;

DELETE trade_board_like
WHERE trade_like_num = 1;
-- ??€?? μΉ΄νκ³ λ¦¬

-- ??€?? κ²μ?


-- ??€?? ?κΈ?


-- ??€?? ???κΈ?


-- ??€?? κ²μ? μ’μ?


-- ??€?? ?κΈ? μ’μ?


-- ??€?? ???κΈ? μ’μ?









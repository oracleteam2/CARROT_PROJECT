-- SCOTT
-- ������ ��¿�(ȭ��)
----
-- ȸ�� ���������� ��ȸ


-- �������� �Խ��� ��ü ��ȸ


-- �������� �Խ��� �� ��ȸ


-- �߰�ŷ� �Խ��� ��ü ��ȸ


-- �߰�ŷ� �Խ��� �� ��ȸ
CREATE OR REPLACE PROCEDURE up_selTradeBoard
(
    ptrade_num NUMBER
)
IS
    vtrade_num NUMBER;
BEGIN
    SELECT trade_num INTO vtrade_num
    FROM trade_board
    WHERE trade_num = ptrade_num;
    
    IF vtrade_num = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Trade number ' || ptrade_num || ' does not exist.');
    ELSE
        FOR rec IN (
            SELECT  
                tb.trade_num
                ,(SELECT LISTAGG(ii.item_image_url || CHR(10), ', ') WITHIN GROUP (ORDER BY ii.item_image_url) 
                  FROM item_image ii 
                  WHERE ii.trade_num = tb.trade_num
                  GROUP BY ii.trade_num) item_images
                ,m.member_profile member_profile_image
                ,m.member_nickname nickname
                ,SUBSTR(m.member_address, INSTR(m.member_address, '�� ') + 1) address
                ,m.member_manner_points manner_point
                ,tb.trade_title title
                ,ic.item_ctgr_name category_name
                ,CASE 
                    WHEN SYSDATE - TO_DATE(tb.upload_date) < 1 THEN TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24 * 60) || '�� ��'
                    ELSE TRUNC(SYSDATE - TO_DATE(tb.upload_date)) || '�� ��'
                END time
                ,tb.trade_content content
                ,TO_CHAR(tb.trade_price, '999,999,999') price
                ,COUNT(DISTINCT tbl.member_num) like_count
            FROM 
                item_image ii 
                JOIN trade_board tb ON ii.trade_num = tb.trade_num
                JOIN member m ON m.member_num = tb.member_num
                JOIN item_ctgr ic ON ic.item_ctgr_num = tb.selitem_ctgr_num
                LEFT JOIN trade_board_like tbl ON tbl.trade_num = tb.trade_num
            WHERE 
                tb.trade_num = ptrade_num
            GROUP BY 
                tb.trade_num, m.member_profile, m.member_nickname, tb.trade_price
                ,SUBSTR(m.member_address, INSTR(m.member_address, '�� ') + 1) 
                ,m.member_manner_points, tb.trade_title, ic.item_ctgr_name
                , CASE 
                    WHEN SYSDATE - TO_DATE(tb.upload_date) < 1 THEN TRUNC((SYSDATE - TO_DATE(tb.upload_date)) * 24 * 60) || '�� ��'
                    ELSE TRUNC(SYSDATE - TO_DATE(tb.upload_date)) || '�� ��'
                END
                , tb.trade_content
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Item Image:');
            DBMS_OUTPUT.PUT(rec.item_images);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('Member Profile Image: ' || rec.member_profile_image);
            DBMS_OUTPUT.PUT_LINE('Nickname: ' || rec.nickname);
            DBMS_OUTPUT.PUT_LINE('Address: ' || rec.address);
            DBMS_OUTPUT.PUT_LINE('Manner Point: ' || rec.manner_point);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('Title: ' || rec.title);
            DBMS_OUTPUT.PUT_LINE('Content: ' || rec.content);
            DBMS_OUTPUT.PUT_LINE('PRICE: ' || rec.price || '��');
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('Category Name: ' || rec.category_name);
            DBMS_OUTPUT.PUT_LINE('Time: ' || rec.time);
            DBMS_OUTPUT.PUT_LINE('Like Count: ' || rec.like_count);
        END LOOP;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Trade number ' || ptrade_num || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;

EXEC up_selTradeBoard(1);

-- ���׻�Ȱ �Խ��� ��ü ��ȸ


-- ���׻�Ȱ �Խ��� �� ��ȸ


-- ���׻�Ȱ �Խ��� ��� ��ȸ


-- ���׻�Ȱ �Խ��� ���� ��ȸ


-- ä�ù� ��� ��ȸ
CREATE OR REPLACE PROCEDURE seek_list
(
    ptrade_num chat.trade_num%type
)
is
    vtrade_num chat.trade_num%type;
    vmember_num2 chat.member_num2%type;
    vmember_nickname member.member_nickname%type;
    vtrade_title trade_board.trade_title%type;
begin 
for slc in(
    select c.trade_num, member_num2, member_nickname, trade_title 
    from chat c join member m on c.member_num2 = m.member_num
                join trade_board t on c.trade_num = t.trade_num
    where c.trade_num= ptrade_num)
    
    loop
    
    DBMS_OUTPUT.PUT_LINE('�Խ��� ���� : ' || slc.trade_title ||'   '||   'ä�� ���� : ' ||  slc.member_nickname);    
   
    end loop;
end;



-- ä�� ���� ��ȸ



CREATE OR REPLACE PROCEDURE seek_chat_content
(
    ptrade_num chat.trade_num%type
)
is
--    vchat_content chat_board.chat_content%type;
--    vmember_num2 chat.member_num2%type;
--    vmember_nickname member.member_nickname%type;
    vtrade_title trade_board.trade_title%type;
begin 
    select trade_title into vtrade_title
    from trade_board
    where trade_num = ptrade_num;
    
 DBMS_OUTPUT.PUT_LINE('�Ǹ����� ��ǰ : ' || vtrade_title);

for vcc in(
 select chat_content , member_num2, member_nickname, trade_title, b.chat_time
    from chat c join member m on c.member_num2 = m.member_num
                join chat_board  b on c.trade_num = b.trade_num
                join trade_board t on c.member_num2 = t.member_num
    where c.trade_num=ptrade_num

)

 
  loop  
  
  
    DBMS_OUTPUT.PUT_LINE('ä�ó��� : ' || vcc.chat_content  ||'   '||   'ä�� ���� : ' ||  vcc.member_nickname || '   ' || 'ä�� �ð� : ' || vcc.chat_time);    
   end loop;

end;

-- ���� ������

-------------------------- danggeun_query_yeon--------------------------
-- [[���׻�Ȱ �Խ��� �� ��ȸ]] 
-- [���׻�Ȱ�Խ���+���׻�Ȱī�װ�+�Խ������ƿ�+ȸ��+���׻�Ȱ���+������ƿ�+����+�������ƿ�]
-- �Խ��� ����
-- �Խ�ȸ���������̹��� / ȸ���г���
-- �Խ�ȸ���ּ� / ���ε�ð�
-- �Խñ� ����
-- �Խñ� ����
-- ��ȸ�� X
-- ���ƿ�
SELECT  cb.comm_board_num             --���׻�Ȱ�Խ��ǳѹ�
        , cc.comm_ctgr_num            --ī�װ���ȣ
        , cc.comm_ctgr_name           --ī�װ��̸�
        , member_profile              --ȸ���������̹���
        , member_nickname             --ȸ���г���
        , SUBSTR(m.member_address,7)    --�Խñ�ȸ���ּ�
        , cb.comm_upload_date           --���ε�����
        , cb.comm_title                 --�Խñ�����
        , cb.comm_content               --�Խñ۳���
        , (SELECT distinct COUNT(comm_board_num) FROM comm_board_like cbl where cbl.comm_board_num = cb.comm_board_num  GROUP BY COMM_BOARD_NUM ) --�Խ������ƿ䰹�� 
FROM comm_board cb JOIN comm_ctgr cc ON cb.comm_ctgr_num = cc.comm_ctgr_num 
                   JOIN member m ON cb.member_num = m.member_num 
                   JOIN comm_board_like bl ON cb.member_num = bl.member_num
                   
                   --order by cc.comm_ctgr_num --ī�װ���ȣ
 ;
                    
-- �Խ��� ���ƿ� ���� ����
SELECT distinct COUNT(comm_board_num) FROM COMM_BOARD_LIKE cbl where cbl.COMM_BOARD_NUM = '11' GROUP BY COMM_BOARD_NUM;
SELECT * FROM comm_board_like;
-- �Խ��� ��� ���� ����
SELECT distinct COUNT(comm_num) FROM comm_cmt where  comm_board_num = '19'  GROUP BY comm_num;
SELECT * FROM COMM_CMT;
-- �Խ��� ��� ���ƿ� ���� ����
--SELECT comm_board_num, cmt_num  FROM comm_cmt_like ccl  where ccl.comm_board_num = '2' order BY comm_board_num;
--SELECT * FROM comm_cmt_like; 
-- �Խ��� ���� ���� ����
SELECT distinct COUNT(rcmt_num) FROM cmt_reply cr where comm_num = '2'  GROUP BY rcmt_num;
SELECT * FROM cmt_reply;
-- �Խ��� ���� ���ƿ� ���� ����
SELECT distinct COUNT(rcmt_num) FROM cmt_reply_like crl where crl.rcmt_num = '1' GROUP BY rcmt_num;
SELECT * FROM cmt_reply_like;


                     
-- �ּ� �� �ڸ���
select SUBSTR(member_address,7) from member ;     

SELECT COUNT(*) FROM cmt_reply GROUP BY cmt_board_num;  -- �������ƿ䰹��

-- ���׻�Ȱ �Խ���+���׻�Ȱ �Խ��� ���ƿ� ����
SELECT t.*
from(
select count(comm_like_num) �Խ������ƿ�ѹ�         
from comm_board cb JOIN comm_board_like cbl ON cb.comm_board_num = cbl.comm_board_num
group by cb.comm_board_num, comm_ctgr_num
order by cb.comm_board_num
) t;
--
select cb.comm_board_num �Խ��ǹ�ȣ
        , comm_ctgr_num �Խ���ī�װ���ȣ
        , count(comm_like_num) �Խ������ƿ�ѹ�         
from comm_board cb JOIN comm_board_like cbl ON cb.comm_board_num = cbl.comm_board_num
group by cb.comm_board_num, comm_ctgr_num
order by cb.comm_board_num;
--
select cb.comm_board_num �Խ��ǹ�ȣ
        , comm_ctgr_num �Խ���ī�װ���ȣ
        , comm_like_num �Խ������ƿ�ѹ�         
from comm_board cb JOIN comm_board_like cbl ON cb.comm_board_num = cbl.comm_board_num
order by cb.comm_board_num;

-- ���׻�Ȱ �Խ��� ���ƿ� ���� ��ȸ
--SELECT *
--FROM (
--    SELECT comm_board_num
--    FROM comm_board_like
--    )
--PIVOT( COUNT(comm_board_num) FOR comm_board_num IN ('1', '2','3','4','5','6','7','8','9','10'
--                                                   , '11', '12','13','14','15','16','17','18','19','20') );
-- up_updtboardlike ���νü� ���� - �߰�                                                   
--CREATE OR REPLACE PROCEDURE up_updtboardlike
--(
--    prcmt_like_num  comm_board_like.rcmt_like_num%TYPE := NULL
--    , pmember_num comm_board_like.member_num%TYPE  
--    , prcmt_num   comm_board_like.prcmt_num%TYPE    
--)
--IS
--  vrcmt_like_num  comm_board_like.rcmt_like_numno%TYPE;
--  vmember_num comm_board_like.member_num%TYPE;
--  vrcmt_num   comm_board_like.prcmt_num%TYPE;
--BEGIN
--    -- ���� ���� ���� dname, loc
--    SELECT rcmt_like_num, member_num, rcmt_num INTO vrcmt_like_num, vmember_num, vrcmt_num
--    FROM comm_board_like
--    WHERE rcmt_num = prcmt_num; 
--    
--    IF prcmt_like_num IS NULL AND pmember_num IS NULL THEN
--       UPDATE comm_board_like
--       SET rcmt_like_num = vrcmt_like_num, member_num = vmember_num
--       WHERE member_num = pmember_num;
--    ELSIF prcmt_like_num IS NULL THEN
--       UPDATE comm_board_like
--       SET rcmt_like_num = vrcmt_like_num, member_num = pmember_num
--       WHERE member_num = pmember_num;
--    ELSIF pmember_num IS NULL THEN
--       UPDATE comm_board_like
--       SET rcmt_like_num = prcmt_like_num, member_num = vmember_num
--       WHERE member_num = pmember_num;  
--    ELSE
--      UPDATE comm_board_like
--       SET rcmt_like_num = prcmt_like_num, member_num = pmember_num
--       WHERE member_num = pmember_num; 
--    END IF;    
--    COMMIT;
---- EXCEPTION
--END;
-- ����

---------------------------------------------------
-- [[���׻�Ȱ �Խ��� �� ��ȸ]] 
-- [���׻�Ȱ�Խ���+���׻�Ȱī�װ�+�Խ������ƿ�+ȸ��+���׻�Ȱ���+������ƿ�+����+�������ƿ�]
-- �Խ��� ����
-- �Խ�ȸ���������̹��� / ȸ���г���
-- �Խ�ȸ���ּ� / ���ε�ð�
-- �Խñ� ����
-- �Խñ� ����
-- ��ȸ��
-- ���ƿ�
-- ��� ����
-- ���ȸ���������̹��� / ȸ���г���
-- ���ȸ���ּ� / ���ε� �ð�
-- ��� ����
-- ��� ���ƿ� ����
-- ���� ȸ���������̹��� / ȸ���г���
-- ����ȸ���ּ� / ���ε� �ð�
-- ���� ����
-- ���� ���ƿ� ����
-- �츮 ���� �α��
-- �Խ��� ����
-- �Խñ� ����
-- �Խñ� ����
-- ȸ���ּ� / ���ε�ð� / ��ȸ�� / ���ƿ�� / ��ۼ�

select * from comm_board ;
desc comm_board;
--
SELECT  cb.comm_board_num               --���׻�Ȱ�Խ��ǳѹ�
        , cc.comm_ctgr_name             --  ī�װ��̸�
        , m.member_profile              --�Խñ�ȸ��������
        , m.member_nickname             --�Խñ�ȸ���г���
        , SUBSTR(m.member_address,7)    --�Խñ�ȸ���ּ�
        , cb.comm_upload_date           --���ε�����
        , cb.comm_title                 --�Խñ�����
        , cb.comm_content               --�Խñ۳���
        , (SELECT distinct COUNT(comm_board_num) FROM comm_board_like cbl where cbl.comm_board_num = cb.comm_board_num  GROUP BY COMM_BOARD_NUM ) �Խ������ƿ䰹�� 
         ,(SELECT distinct COUNT(comm_num) FROM comm_cmt cct where cct.comm_board_num = cb.comm_board_num   GROUP BY comm_num)        �Խ��Ǵ�۰���
        , (select member_profile from member where member_num = cct.member_num ) ���ȸ��������
        , (select member_nickname from member where member_num = cct.member_num ) ���ȸ���г���  
        , (select SUBSTR(member_address,7) from member where member_num = cct.member_num ) ���ȸ���ּ�
        , cct.comm_content              ��۳���
        --, (SELECT distinct COUNT(cmt_num) FROM comm_cmt_like ccl where ccl.comm_board_num = cb.comm_board_num GROUP BY cmt_num ) ������ƿ䰹��
        , (SELECT distinct COUNT(rcmt_num) FROM cmt_reply cr where cr.comm_num = cct.comm_num  GROUP BY rcmt_num )  ���۰���
        , (select member_profile from member where member_num = cr.member_num ) ����ȸ��������
        , (select member_nickname from member where member_num = cr.member_num ) ����ȸ���г���  
        , (select SUBSTR(member_address,7) from member where member_num = cr.member_num )  ����ȸ���ּ�
        , rcmt_content                                                           ���۳���
        , (SELECT distinct COUNT(rcmt_num) FROM cmt_reply_like crl where crl.rcmt_num = cr.rcmt_num GROUP BY rcmt_num )�������ƿ䰹��
FROM comm_board cb JOIN comm_ctgr cc ON cb.comm_ctgr_num = cc.comm_ctgr_num 
                   JOIN member m ON cb.member_num = m.member_num 
                   JOIN comm_board_like cbl ON cb.member_num = cbl.member_num
                   JOIN comm_cmt cct  ON cct.comm_board_num = cb.comm_board_num
                   JOIN comm_cmt_like ccl ON cb.member_num = ccl.member_num
                   JOIN cmt_reply cr ON cr.comm_num = cct.comm_num
                   JOIN cmt_reply_like crl ON crl.rcmt_num = cr.rcmt_num
                   ;
----------------------------------------
-- up_commboard ���׻�Ȱ �Խ��� �� ��ȸ ���ν���1
-----------------------------------------
-------------------------------------------------------
-- up_seltblcommboard ���׻�Ȱ �Խ��� �� ��ȸ ���ν���2
-------------------------------------------------------
-- ������---------------------------------------------------------
-- ���׻�Ȱ�������ƿ����̺�
SELECT * FROM
cmt_reply_like;  
------------------------�������ƿ䰹��
SELECT DISTINCT rcmt_num, COUNT(*) like_count 
from cmt_Reply_like -- ���״������ƿ�
GROUP BY rcmt_num;

-- ���׻�Ȱ������ƿ����̺�
SELECT * 
FROM comm_cmt_like; 
----------------------------------------------------------------

-- ���׻�Ȱ �Խ��� �� ��ȸ
-- ���׻�Ȱ �Խ��� ���ƿ�
-- ���׻�Ȱ ī�װ�
-- ���׻�Ȱ ���� ���ƿ�

-- TBL_COMMBOARD ���̺� ����
CREATE TABLE tbl_commboard
AS
(       SELECT  cb.comm_board_num       board_num  --���׻�Ȱ�Խ��ǳѹ�
        , cc.comm_ctgr_num              ctgr_num  --ī�װ���ȣ
        , cc.comm_ctgr_name             ctgr_name  --ī�װ��̸�
        , member_profile                profile  --ȸ���������̹���
        , member_nickname               nickname  --ȸ���г���
        , SUBSTR(m.member_address,7)    member_address   --�Խñ�ȸ���ּ�
        , cb.comm_upload_date           upload_date    --���ε�����
        , cb.comm_title                 title       --�Խñ�����
        , cb.comm_content               comm_content     --�Խñ۳���
        , (SELECT distinct COUNT(comm_board_num) FROM comm_board_like cbl where cbl.comm_board_num = cb.comm_board_num  GROUP BY COMM_BOARD_NUM ) board_like_cnt --�Խ������ƿ䰹�� 
        FROM comm_board cb JOIN comm_ctgr cc ON cb.comm_ctgr_num = cc.comm_ctgr_num 
                   JOIN member m ON cb.member_num = m.member_num 
                   JOIN comm_board_like bl ON cb.member_num = bl.member_num   
);

-- [[���׻�Ȱ �Խ��� �� ��ȸ]] 
-- [���׻�Ȱ�Խ���+���׻�Ȱī�װ�+�Խ������ƿ�+ȸ��+���׻�Ȱ���+������ƿ�+����+�������ƿ�]
-- �Խ��� ����
-- �Խ�ȸ���������̹��� / ȸ���г���
-- �Խ�ȸ���ּ� / ���ε�ð�
-- �Խñ� ����
-- �Խñ� ����
-- ��ȸ�� X
-- ���ƿ�
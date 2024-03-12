-- SCOTT
-- ������ ����
11
22
--COMM : COMMUNITY
--CMT : COMMENT
--CTGR : CATEGORY
--NUM : NUMBER

-- '&' �� ���ڷ� ����ϰ��ϴ� �ڵ�
SHOW DEFINE;
SET DEFINE OFF;


-- ȸ�� ������
-- ȸ���ѹ�(pk), �������, �г���, �ּ�, ��ȭ��ȣ, �������̹���, �ųʿµ�(default)
CREATE SEQUENCE SEQ_MEMBER_ID
START WITH 1
INCREMENT BY 1;



INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1998-06-29', '����', '�λ걤���� �ؿ�뱸 �ߵ�', '010-4044-4444', 'https://cliimage.commutil.kr/phpwas/restmb_allidxmake.php?pp=002&idx=3&simg=20170712195535009572d12411ff9587970114.jpg&nmt=12');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1990-03-12', '������', '����Ư���� ������ �ߵ�', '010-1234-4444', 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8fA%3D%3D
');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1991-05-23', '�����', '����Ư���� ������ �ߵ�', '010-9822-4224', 'https://img.freepik.com/premium-photo/caricature-of-a-carrot-with-a-face-and-limbs-generative-ai_252214-6349.jpg?w=2000');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1992-07-27', '������', '����Ư���� ����� �ߵ�', '010-4467-2454', 'https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg
');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1993-11-19', '���', '����Ư���� ������ �ߵ�', '010-7014-1244', 'https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/rZ1xSXKCJ4cd-IExOYahRWdrqoo.jpg');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1994-12-04', '����', '�뱸������ ������ �ߵ�', '010-8344-8894', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUepaBdMZtoy5GmiKF_v1vkRbwo3MgxAiIwcaztDaqiYwLdV58jhq19hUX00btfdkBUF8&usqp=CAU 
');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1995-09-02', '������', '����������  ���� �ߵ�', '010-7744-4477', ' https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnoC/image/tfQwmqh621xPopjfnJ9wXkfrBcc.jpg');


INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1996-08-24', '����', '�λ걤���� �ؿ�뱸 �µ�', '010-1253-8964', 'https://i.pinimg.com/736x/05/fe/0c/05fe0c269a225ac1251fff5bc74483ef.jpg');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1997-02-15', 'ī����', '��õ������ ���� �ߵ�', '010-2834-5315', 'https://www.moneynet.co.kr/files/attach/images/33793530/304/717/049/0d8e9d6eee5e97ac11f96085c56072ab.jpg');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '2000-07-11', '�ռ���', '����Ư���� ���ֽ� �ƶ��ϵ�', '010-2427-2453', 'https://cdnimage.dailian.co.kr/news/201802/news_1518415236_693408_m_1.jpg');

COMMIT;

-- ������ ����
-- ADMIN ���̺�, ������ �ѹ� ( PK ), �����ڴг���, ������ID, �����ں�й�ȣ
CREATE SEQUENCE SEQ_ADMIN_ID
START WITH 1
INCREMENT BY 1;

INSERT INTO admin
VALUES (SEQ_ADMIN_ID.NEXTVAL, '������1', 'admin123', '1234');

INSERT INTO admin
VALUES (SEQ_ADMIN_ID.NEXTVAL, '������2', 'admin4875', '842135');

INSERT INTO admin
VALUES (SEQ_ADMIN_ID.NEXTVAL, '������3', 'admin9753', '84651321');


-- DANNGN_PAY ���̺�, ȸ�� �ѹ� ( PK ), ���¹�ȣ, �����̸�, �ܾ�
INSERT INTO DANGGEUN_pay
VALUES(1, '91098112453', 'KB��������', 1350000);
INSERT INTO DANGGEUN_pay
VALUES(2, '33332955474', '��������', 350000);
INSERT INTO DANGGEUN_pay
VALUES(3, '91963923557953', 'KEB�ϳ�����', 275000);
INSERT INTO DANGGEUN_pay
VALUES(4, '1234811255453', 'NH��������', 64000);
INSERT INTO DANGGEUN_pay
VALUES(5, '44445930203', 'SC��������', 170000);
INSERT INTO DANGGEUN_pay
VALUES(6, '123456789434', '��Ƽ����', 600000);
INSERT INTO DANGGEUN_pay
VALUES(7, '45629759232', '���̹�ũ', 1790000);
INSERT INTO DANGGEUN_pay
VALUES(8, '914346765579', 'īī����ũ', 510000);
INSERT INTO DANGGEUN_pay
VALUES(9, '09173549283', 'DGB�뱸����', 200000);
INSERT INTO DANGGEUN_pay
VALUES(10, '056737235267', 'BNK�λ�����', 660000);
COMMIT;

-- PAY ���̺�, ȸ�� �ѹ�, ȸ�� �ѹ�2
CREATE SEQUENCE seq_pay
START WITH 1
INCREMENT BY 1;

INSERT INTO pay
VALUES(1, 3);

-- ITEM_CTGR ���̺�
--��ǰ ī�װ� �ѹ� ( PK )
--��ǰ ī�װ� �̸�
INSERT INTO ITEM_CTGR VALUES ( 1, '�����б��') ;
INSERT INTO ITEM_CTGR VALUES ( 2, '��Ȱ����') ;
INSERT INTO ITEM_CTGR VALUES ( 3, '�Ƿ�') ;
INSERT INTO ITEM_CTGR VALUES ( 4, '�Ƶ�') ;
INSERT INTO ITEM_CTGR VALUES ( 5, '������') ;
INSERT INTO ITEM_CTGR VALUES ( 6, '��ǰ') ;
INSERT INTO ITEM_CTGR VALUES ( 7, '���') ;
INSERT INTO ITEM_CTGR VALUES ( 8, '��ϴ�') ;
COMMIT;

DROP SEQUENCE seq_tboard;
DROP SEQUENCE seq_image;

DELETE FROM item_image;

DELETE FROM trade_board;
-- TRADE_BOARD ���̺�
-- trade_num ( PK ), member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location

-- ITEM_IMAGE ���̺�
-- trade_num, item_image_num (PK) ,item_image_url

-- TRADE_BOARD INSERT �ϳ� �ϰ� ITEM_IMAGE INSERT�� ���������� �����Ͻø� �˴ϴ�.
--
-- ������ ����
CREATE SEQUENCE seq_tboard INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;
CREATE SEQUENCE seq_image INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;

--
-- �����̸ƽ� ����ǰ
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    seq_tboard.NEXTVAL
    , 1
    , 1
    , '�����̸ƽ� ����ǰ'
    , '�̰��� ����ǰ�ε� ���� �̹� �ϳ� �־ �Ⱦƿ�'
    ,  SYSDATE
    ,  200000
    , '�ߵ�'
    );   
-- �����̸ƽ� ����ǰ
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( seq_image.NEXTVAL, seq_tboard.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/f3cc3e8742b9f393e3a0294691d87e4a24254b200cf7fbde7b1df4c512dd0590.jpg?q=95&s=1440x1440&t=inside&f=webp',1);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( seq_image.NEXTVAL, seq_tboard.CURRVAL,  'https://search.pstatic.net/common/?src=https%3A%2F%2Fshopping-phinf.pstatic.net%2Fmain_8711646%2F87116460443.jpg&type=f372_372',1);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( seq_image.NEXTVAL, seq_tboard.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMDVfMTU4%2FMDAxNzAxNzY0Mjk0MDc4.iDJ3j4hn_JIb1eL1BLSkxrtmFn7PCNcoVusyNmeDzXwg.42yYugGj2rjwedgzSYFmzOer2zHl1bejswZ96rkQsqEg.JPEG.sol__l2%2FKakaoTalk_20231205_170011141_01.jpg&type=a340', 1);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( seq_image.NEXTVAL, seq_tboard.CURRVAL, 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimage.msscdn.net%2Fimages%2Fgoods_img%2F20240118%2F3806183%2F3806183_17080610408383_500.jpg&type=a340', 1);


-- ���̽� ������̱�
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_TBOARD.NEXTVAL
    , 2
    , 1
    , '���̽� ���ۼҴ� ������̾� ��� ���� �Ǹ��մϴ�.'
     , '�̰��� ����ǰ ��ǰ�Դϴ�. ���ŷ��� ���嵿���� �����մϴ�.'
    , '2024-03-01'
    , 100000
    , '�ߵ�'
    );
    
-- ���̽� ������̱�
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/9887accfc129500a7c887f3a94b6441752b6db9f061b690f82777ec7e06e7ed5_0.webp?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/861b835995343e320e6259fa92c2d3c9b3f059c7b1b226a5cafa3993773daba7_1.webp?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/9887accfc129500a7c887f3a94b6441752b6db9f061b690f82777ec7e06e7ed5_2.webp?q=95&s=1440x1440&t=inside&f=webp', 2);


-- ���� �佺��
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_TBOARD.NEXTVAL
    , 3
    , 2
    , '���� �佺��'
    , '��ü�� ���� �������ϴ�. ȥ�ڻ�� ���̶�� ����� ����� ���� ũ���Դϴ�.'
    , '2024-02-28'
    , 40000  
    , '������'
    );

-- ���� �佺��
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/08ec535f0dc069be48db7970231f52a662446f8e07d334b7e44f23d97ffa145f_0.webp?q=95&s=1440x1440&t=inside&f=webp', 3);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/community/community/20240216/2ffbac14-1384-480d-acc4-4fdeb42fabb5.png?&f=webp', 3);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fdnvefa72aowie.cloudfront.net%2Forigin%2Farticle%2F202312%2Fac867456b1fe127309cf94a172a46ac2d514cafc2a982e622383af25493a2f60.jpg%3Fq%3D95%26s%3D1440x1440%26t%3Dinside%26f%3Dwebp&type=sc960_832', 3);

-- ���� �۶� ��Ʈ
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_TBOARD.NEXTVAL
    , 4
    , 2
    , '���� �۶�'
    , '������ī�� ���α۶��Դϴ�. ū ������� ������ �����Դϴ�. ���� ��� �����̳� ������.'
    , '2024-02-16'
    , 30000  
    , '�����'
    );
    
-- ���� �۶� ��Ʈ
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202402/cc6cf7e733f70887fb9d4963c4e96d22af16021f9a86729c4f1b5f08dd6a8e68.jpg?q=95&s=1440x1440&t=inside&f=webp', 4);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshopping.phinf.naver.net%2Fmain_3754868%2F37548689017.20230131125646.jpg&type=sc960_832', 4);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20230324_114%2F1679637966978NtLwq_JPEG%2FTLbli_100901_7.jpg&type=sc960_832', 4);


 -- �����Ƿ� Ķ��Ŭ���� ����Ƽ
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_TBOARD.NEXTVAL
    , 5
    , 3
    , '�����Ƿ� Ķ��Ŭ���� ����Ƽ �˴ϴ�.'
    , '3ȸ �����߽��ϴ�. ���� ����ǰ�Դϴ�. ���ŷ� ���մϴ� ��ŷ� ����'
    , '2024-02-04'
    , 25000   
    , '������'
    );

 -- �����Ƿ� Ķ��Ŭ���� ����Ƽ
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/51a2ebe878d07f4ff8223922c38bea16a348775645e01ab5ff4fc146499ca61d.jpg?q=95&s=1440x1440&t=inside&f=webp', 5);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimage.musinsa.com%2Fmfile_s01%2F2022%2F04%2F15%2Fff67c3458fdaa4d4f3b5e3dc23c5506d184029.jpg&type=sc960_832', 5);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA1MTVfOTkg%2FMDAxNjg0MTUwNTU0MjM4.QyxnLWV6NqLFYleqyR-PK8W_Z7_hgeoXg2RKDEQ6QdQg.kWGLc6KYE0tnxdvtGlQHbtkfQ79kteDu199f559s1Tog.JPEG.tnstnqorqo%2FIMG_8125.JPG&type=sc960_832', 5);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL, 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fck-s3.s3.ap-northeast-2.amazonaws.com%2Fecom%2F24SS%2FCKJ%2FJ223860-YAF%2FJ223860-YAF-ITEM-2.jpg&type=a340', 5);

-- ��ڹ��� �����Ƿ� ��Ʈ���� ������ 95
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_TBOARD.NEXTVAL
    , 6
    , 3
    , '��ڹ��� �����Ƿ� ��Ʈ���� ������95'
    , '��ڹ��� �����Ƿ� ��Ʈ���� ������95 �� �� ���Ծ����ϴ�.'
    , '2024-02-01'
    , 35000
    , '������û'
    ); 

-- ��ڹ��� �����Ƿ� ��Ʈ���� ������ 95
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210828_228%2F163013337942202vwE_JPEG%2F31269162995911619_1021975160.jpg&type=sc960_832', 6);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210710_203%2F1625916196021Ubx5S_JPEG%2F33380828139819908_936957536.jpg&type=sc960_832', 6);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fccimg.hellomarket.com%2Fimages%2F2023%2Fitem%2F02%2F16%2F13%2F2522936_5731861_1.jpg%3Fsize%3Ds6&type=sc960_832', 6);


-- �޸��� ��� ������
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_TBOARD.NEXTVAL
    , 7
    , 4
    , '�޸��� ��� ������'
    , '�ִϾ� �������Դϴ�. ��밨 �ֽ��ϴ�. �������ž��ؿ�'
    , '2024-01-30'
    , 70000
    , '�µ�'
    );   

-- �޸��� ��� ������
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/ac29d7c003f5c248866caf0beb4b197ecfad62315987dbb241d512aa66d4d574_0.webp?q=95&s=1440x1440&t=inside&f=webp', 7);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODA0MjdfNTEg%2FMDAxNTI0ODMwNDU5MjM0.EEzN1PjwOjDrsQt6AMdKGUGqZ7GWp8FE17w6Ff5oLgYg.1SUuiexNmY8B7L9vEgMnjcYzvX_iUZdZP0cOvF7ZHZUg.JPEG.1984velo%2FKakaoTalk_20180427_200934077.jpg&type=sc960_832', 7);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxOTA0MDdfMjcg%2FMDAxNTU0NTkxMTA2ODE1.uCJ7D0xtEAz85zKy0c510bZML4FGoZPPWw1kRX9mRrMg.H7DLcFWg2Iry0ZOJ9A0a_keNHGjIOQVRJSF9H5_Olygg.JPEG.kyungin0315%2FAE5B12D6-F4F9-451A-8825-8A539D88F208.jpeg&type=sc960_832', 7);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMjdfMjA3%2FMDAxNzA2MzQzNjc5MjE0.Ma3dduyAiiLYPyGbnhlADUZnC0ftAZaNrGO8eAUveKgg.z9rEJ1hwJtwifePsI2izr_uxh7kWulM94rqEmSpUfmIg.JPEG.okuro1977%2F%25B8%25DE%25B8%25AE%25B4%25D920.jpg&type=sc960_832', 7 );


-- �Ƶ� ������
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_TBOARD.NEXTVAL
    , 8
    , 4
    , '�Ƶ� ������ �˴ϴ�.'
    , '�ؿ���� �Բ� �� �� �ִ� ����å�Դϴ�. �� �Ⱥ��� å�� �����ؿ�~'
    , TO_DATE('2023-02-23','YY-MM-DD')
    , 15000
    , '�ߵ� ��Ÿ����'
    );     
    
-- �Ƶ� ������
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/c05c5dbd0a7f9024e140997cfb00a0d97aba1a67ef280682dccd3a3eabadd00a_0.webp?q=95&s=1440x1440&t=inside&f=webp', 8);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMDRfNTkg%2FMDAxNzA0MzU5MzQ2MzYw.SnuXXedY-d-o69g7wa4U5rFq0uOGx6I8m3gT5VMX6k4g.iU1C4BUd1IQ-xeHEp-e9wT-lwvUk6IKjj8mFlZZB-SQg.JPEG.yaena1143%2FIMG_2961.jpg&type=sc960_832', 8);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20200304_158%2F1583306549050vLuw0_JPEG%2F20668882615659850_1383306984.jpg&type=sc960_832', 8);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL,'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxOTExMjhfMjYg%2FMDAxNTc0OTIwNDE3NTQ4.SBjpdDpT1NVClTOyhy6zoEA5iYg_cuLKEbkcDoP5JDYg.E7Z3seCuctdf6b5lvyjmUFFmfN8mNrg_v1sdRLk1-ZUg.JPEG%2FexternalFile.jpg&type=sc960_832', 8);
INSERT INTO item_image ( item_image_num , trade_num , item_image_url, member_num)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_TBOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20220503_138%2F1651533711184nSJx7_JPEG%2F52669539010215726_920666573.jpg&type=sc960_832', 8);

-- ����� �ŷ�
INSERT INTO trade_board ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES 
    ( 
    seq_Tboard.NEXTVAL
    , 1
    , 1
    , '����� 24��ġ Ŀ��� AK'
    , '�繫�ǿ��� ����߽��ϴ� ����ó�� ���Դϴ�. Ŀ���� �������ƿ�'
    , TO_DATE('2023-02-21','YY-MM-DD')
    , 20000
    , '�ߵ�'
    );

-- ����� �ŷ� �̹���
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202309/e66df18442ef31f0ebb34d6171d91626863ea6cacdc7e4bc3ef91241d3daafa7.jpg?q=95&s=1440x1440&t=inside&f=webp', 1);
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202309/5dca6ae7ff3000b33d78f98595a1f0bbbce56472bcdbd7c1ec4628aab36802c9.jpg?q=95&s=1440x1440&t=inside&f=webp', 1);



-- �ִϾ� ������
INSERT INTO trade_board ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES 
    ( 
    seq_tboard.NEXTVAL
    , 2
    , 5
    , 'RITE WAY �ִϾ� ������'
    , '18 ��ġ �ִϾ� �������Դϴ�. 1�Ⱓ�� ����̹Ƿ� ���´� �����ϴٸ�, �ణ�� ��ũ��ġ��� �Ű��� ������ �ʴ� ���� ������ ��ٸ��� �ֽ��ϴ�.'
    , TO_DATE('2023-01-30','YY-MM-DD')
    , 1000000
    , '������'
    );

-- �ִϾ� ������ �̹���     
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/a42229bfc28ea3427d8a61c3032e91bd91d557fef62de6b5b136adf6c1373c53.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/d32d07b745d60a6d252608cce09a3fdfaebfab329a6fc4bd433d6fa0033a83b1.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/ad34d9b59c5e2d1a586113bed1262ff763323741f7c331382e620c293e941d75.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/8c9314be1295267df2b22832cd46b3be30c12e4e1cd552d293a52e1caa9198db.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/7e7eff3d0e19c0f0d63bea281872492944515ebc25e729a4ba60d02275011ea2.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);


-- ������ �ŷ�
INSERT INTO trade_board ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES 
    ( 
    seq_tboard.NEXTVAL
    , 2
    , 1
    , 'iPhone 8 Gold 64GB'
    , '�� ��� ���� �� �������Դϴ�. ���͸� �ִ� �뷮: 95% .'
    , TO_DATE('2023-01-21','YY-MM-DD')
    , 350000
    , '������'
    );

-- ������ �ŷ� �̹���
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202210/CF1D735E3998828421B45FCBD98687B733405FCF51E2EA8FD64219FD7A741EE0.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202210/E9E849356D1CB51E516EB459E5D593F8159705A15FEAF2C899783737A4EB0C7A.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);
INSERT INTO item_image ( trade_num, item_image_num, item_image_url, member_num)
VALUES ( seq_tboard.CURRVAL, seq_image.NEXTVAL, 'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202210/6EA3286D098D6EF7041FACC4CD0210F197F872987848678C25130E5E848FDEFF.jpg?q=95&s=1440x1440&t=inside&f=webp', 2);

COMMIT;


-- CHAT ���̺�, ä�ù� �ѹ� ( PK ), ȸ�� �ѹ�, ȸ�� �ѹ�2
CREATE SEQUENCE SEQ_CHATROOM_ID
START WITH 1
INCREMENT BY 1;

INSERT INTO chat
VALUES(SEQ_CHATROOM_ID.NEXTVAL, 1, 2);

INSERT INTO chat
VALUES(SEQ_CHATROOM_ID.NEXTVAL, 3, 5);

INSERT INTO chat
VALUES(SEQ_CHATROOM_ID.NEXTVAL, 1, 10);

INSERT INTO chat
VALUES(SEQ_CHATROOM_ID.NEXTVAL, 2, 8);

INSERT INTO chat
VALUES(SEQ_CHATROOM_ID.NEXTVAL, 6, 9);


-- CHAT_BOARD ���̺�, ä�ù� �ѹ�, ä�� �ѹ� ( PK ), ȸ���ѹ�, ä�ó���, ä�ýð�
CREATE SEQUENCE SEQ_CHATCONTENT_ROOM1_ID 
START WITH 1
INCREMENT BY 1;

SELECT * FROM trade_board;



INSERT INTO chat_board(trade_num,chat_num, CHAT_CONTENT, CHAT_TIME )
VALUES (1,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '�ȳ��ϼ���~ Ȥ�� ���� �ȷȳ���?','11�� 23��');



INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (2,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '���ŷ� �ϰ������ �����ϽŰ���?', '12�� 24��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (2,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '�׷� ���ﵿ���� ���Ǽ� �����Ű���?', '14�� 20��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (2,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '�� �׷� 6�ñ��� �ű�� ���ڽ��ϴ�', '15�� 15��');



INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (3,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '�����մϴ� ���� �Ϸ� �Ǽ���', '08�� 23��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (3,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '�� ���� �ŷ� �� ���ּż� �����߽��ϴ�~', '10�� 03��');



INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (4,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, 'Ȥ�� ���� ģ�� ��������?', '19�� 56��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (4,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '��~ �־�� :)', '20�� 01��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (4,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '�� Ȥ�� �����ø�... �� �����', '21�� 00��');

--


INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (5,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, 'Ȥ�� ���� �ȷȳ���?', '15�� 31��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (5,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '�ƴϿ� ���� �Ǹ����Դϴ�', '17�� 28��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (5,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, 'Ȥ�� ���� �ٺ��� �׷��� �ù�� �����ֽǼ� �������?', '17�� 30��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (5,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, '���� ���� ���ŷ����մϴ�', '17�� 42��');

INSERT INTO chat_board(trade_num, CHAT_NUM, CHAT_CONTENT, CHAT_TIME )
VALUES (5,SEQ_CHATCONTENT_ROOM1_ID.NEXTVAL, ' ���� ������ ', '17�� 50��');


commit;

-- �Ű�
CREATE SEQUENCE SEQ_REPORT_ID
START WITH 1
INCREMENT BY 1;

-- ���ν����� �μ�Ʈ

-- BLOCK ���̺�, ȸ���ѹ�1, ȸ���ѹ�2

-- ���ν����� �μ�Ʈ

-- �������� �Խ���
-- �������� �ѹ�(pk), �����ڳѹ�, ����, ����, ��¥
CREATE SEQUENCE SEQ_NOTICE_BOARD_ID
START WITH 1
INCREMENT BY 1;

INSERT INTO notice_board
VALUES(SEQ_NOTICE_BOARD_ID.NEXTVAL, 1, '���� ����� �װ� �Ұ��Դϴ�', '���� ����� ���Ϻη� �װ��� �� �����ϴ�. �װ�� ȸ���ڰ��� ��Ż�ϰڽ��ϴ�.', SYSDATE);

INSERT INTO notice_board
VALUES(SEQ_NOTICE_BOARD_ID.NEXTVAL, 2, '�Ƿᱤ�� ������ �ۼ� ��� ����', '�Ƿᱤ���� ���, �ʼ������� �Ƿᱤ�� �����ʶ��� ������ ��ȣ�� �ۼ��� �ֽñ� �ٶ��ϴ�. �����ʶ��� �ۼ����� �ʰ�, �ٸ� ��ġ�� �ۼ��� ��� �ɻ� �� ������ ����� �� �ֽ��ϴ�.', '2023-03-30');

INSERT INTO notice_board
VALUES(SEQ_NOTICE_BOARD_ID.NEXTVAL, 1, '��� ���� ���� �ذ�', '��� ȭ�鿡�� 9�� 26�� ������ ��ȸ�� �� �湮 �����Ͱ� ������� �ʾҾ��.
                                                           10�� 4�� ��� ���� �Ϸ� �Ͽ�����, ��� ���ڿ��� ���������� ��踦 Ȯ���Ͻ� �� �־��.
                                                           �̿뿡 ������ ��� ����� �˼��մϴ�.
                                                           ���� �������� ���񽺸� �����ϴ� ��� ����Ͻ��� �ǰڽ��ϴ�.', '2023-06-21');
                                                           
INSERT INTO notice_board
VALUES(SEQ_NOTICE_BOARD_ID.NEXTVAL, 2, '��������� ��ʰ����� �ȳ�', '��� ���������� �Բ� ����Ͻ��� ������ ���� �������� �̾߱⸦ ��Ƴ���, ���� 1ȸ ��������� ��� ���������� ���۵Ǿ����.', '2023-08-12');

INSERT INTO notice_board
VALUES(SEQ_NOTICE_BOARD_ID.NEXTVAL, 3, '������ ���� ��û�� �ս��� �޾ƺ�����.', '���� ���� ���� ��û�� Ȯ���ϰ� ������ ���� �� �־��. ���� ��û���� ��ǰ ������ ��û ������ ��� �־� �Ź� ���� ������ ������� �ߴ� ���ŷο��� �������.', '2024-02-16');

COMMIT;


-- ���׻�Ȱ ī�װ� ���̺�
--���׻�Ȱ ī�װ� �ѹ� ( PK ), ���׻�Ȱ ī�װ� �̸�

INSERT INTO comm_ctgr VALUES( 1,'�α�');
INSERT INTO comm_ctgr VALUES( 2,'����');
INSERT INTO comm_ctgr VALUES( 3,'����');
INSERT INTO comm_ctgr VALUES( 4,'��������');
INSERT INTO comm_ctgr VALUES( 5,'�н�');
INSERT INTO comm_ctgr VALUES( 6,'��ǻ��');

COMMIT;

-- ���׻�Ȱ �Խ���
-- COMM_BOARD ���̺� 
-- COMM_BOARD_NUM ( PK ), COMM_CTGR_NUM, MEMBER_NUM, COMM_TITLE, COMM_CONTENT, COMM_UPLOAD_DATE
CREATE SEQUENCE SEQ_BOARD
START WITH 1
INCREMENT BY 1;


INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'�������� �Ϸ翡 10�и� �����ϸ� ���ڰ� �� �� �ֽ��ϴ�. ','���ڵǴ� ��',1,to_date('21-04-23','yy-mm-dd'),9);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'��31�� ���ڰ� ��õ���׿� �϶����� �Ⱦ� ���µ� ���װ��ôº� ��������ױ��� īǮ�մϴ� ~ ���޶� ���⳻������ ���� ����?���� ����� �����ϰԵ� īǮ���ּż� ���ϰ� ���� ������־ �÷����ϴ�^^ ','���� (3.7)���� 6��30�� ��� ��������Ÿ��ʿ���',1,to_date('20-01-13','yy-mm-dd'),6);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'ġŲ�԰�;�� ������ ���ڴ� ','�������ʿ� ġŲƮ�� �µ� �־��?',1,to_date('22-11-03','yy-mm-dd'),7);

INSERT INTO comm_board(comm_board_num,comm_content,comm_title,comm_ctgr_num,comm_upload_date,member_num)
VALUES(seq_board.nextval,'���� ������ ��� ������ ����� ������� ���� �˾ƺ�����?  ���� ��� 8������ ������ �������� ���� ����� �������� �˾ƺ��°� �������?
 ','���� ��� �ñ���',2,to_date('24-01-01','yy-mm-dd'),3);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'�ȳ��ϼ���:) �� �� ���� �̻�ͼ� ���� ǲ������ ���� ���� �Ǿ�  ���� �౸�����̶� �ٳຼ�� �մϴ�.  ������ �� ������ �Ұ� ��Ź����� �����մϴ�
 ','������ó �����౸���� ���ǵ帳�ϴ�',2,to_date('23-07-16','yy-mm-dd'),1);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,' ������ �ϰ� ������
 ','���� �� ���ϴ� �� �ֳ���',2,to_date('23-09-12','yy-mm-dd'),2);
 
INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,' ��� �޾��ּ���!
 ','���̽� ġ�ôº� ��Ű���?',3,to_date('23-05-02','yy-mm-dd'),4);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� ���屹�� ���������ϽǷ���? 3 0 ��
 ','��������ó����Ͻź�',3,to_date('23-06-11','yy-mm-dd'),8);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� ���뱸û �տ� ����ŷ�ʿ� ������� �Կ��ϴµ� ���� �ƽôº�?
 ','���� ���뱸û �տ� ����ŷ�ʿ� ������� �Կ��ϴµ� ���� �ƽôº�?',3,to_date('23-10-01','yy-mm-dd'),7);
 
 
INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'����αٿ� ���������� �˷��ֽʽÿ�. ���� �ٴϴ� �������� ���� �ȵ���. �ʹ� ��������� ȯ�ڸ� ����ϴ°� ���ƿ�
 ','��������',4,to_date('23-05-10','yy-mm-dd'),4);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'�ʹ� ���� �����Ÿ��� ���ϰ� ��ħ�� ���ɴϴ�', '���� �ȳ��� ���ֽø� �����մϴ�.', 4, to_date('23-01-21','yy-mm-dd'),8);


INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���뱸 �ʿ� ��ž���� �� ���ϰ� ��������, �Ź��� �� ���׿�� �� ���� �� ã�ƺ� �� �ִ� ����� �������?
 ','���뱸 ��ž��',4,to_date('23-12-11','yy-mm-dd'),5);


INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'� �߰� �����̱��� ���� ũ���� ���� ���޶�Ͼ� �Դϴ� ���� ���� ��� �޾��ּ��� �̤�',  '���� �� �鵹�̸� �о� ���Ⱦ�� �̤Ѥ�
',5,to_date('23-02-12','yy-mm-dd'),9);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� ���� 5�ÿ� ���������� �������� üũī�� �н��ߴµ� ���忡 ���� �нǹ��� ���ٰ� �ϳ׿� Ȥ��
���� �� ��ø� ��۷� �� �˷��ּ��� �̤̤�','���� ���� 5�ÿ� ������ ��Ÿ�������� ī�� �ֿ�ź�?',5,to_date('23-06-01','yy-mm-dd'),1);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� ����� �տ� �����Ÿ� ��� �������µ� ���� �������׿� ������ ���� ������ ������ �Դϴ� Ȥ�� ã�� �ֽô� �� ������ ��� �ص帱�Կ� �̤� 
�ε� ����ũ�� ������ �������Դϴ�.!!',
'���� ���� 9���� �����Ÿ� �Ҿ� ���Ƚ��ϴ�. ',5,to_date('23-01-30','yy-mm-dd'),4);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� Ȩ�÷��� 1�� �̵�� �� �������� �츮���� üũī�带 �ֿ����ϴ�. �׳� ������ ������ �ٱ� �ϴٰ� ���⿡�� �� �ø��ϴ�!! ī�� ������ ��x�� 98��1�� 30�� ���̶�� �����ֽ��ϴ�.!',
' üũī�带 �ֿ����ϴ�. ',5,to_date('24-02-27','yy-mm-dd'),6);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� �� ������ ��ó ȣ������ 50�� ���ڽý��� �߰ߵƴٰ� �ϳ׿� �̤� �ٵ� �����ϼ���',
' ������ ���� �ý� ',6,to_date('24-03-06','yy-mm-dd'),3);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� �㸸 �Ǹ� ���� �ٿ� ��� ������ �ɾƼ� �����׿� �̤� ������ ���� ���� �� �ߴµ� �ٵ� ������ �����δ� �����ٴϽ��� �ʴ°� ������ ���ƿ� !!',
' ��� �� ',6,to_date('23-08-27','yy-mm-dd'),4);

INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� �����ʵ��б� �տ��� ��ȸ�� �ϴ� ������ �ʵ��л� ���̰� ġ�� ũ�� ���ƴٰ� �ϳ׿� �����鵵 ������ �ٳ�� ������ ���ȿ��� ���� ���̵鿡�� ���� ������ Ȯ���� ��ų �ʿ䰡 ������ ���׿� �̤� ������ �����ϴ� �̤̤̤�',
' ������ �� ������ ',6,to_date('23-2-27','yy-mm-dd'),2);


INSERT INTO comm_board(COMM_BOARD_NUM,COMM_CONTENT,COMM_TITLE,COMM_CTGR_NUM,COMM_UPLOAD_DATE,MEMBER_NUM)
VALUES(seq_board.nextval,'���� ū ��Ÿ��� �ִ� 5��� �� ������ ������ �ð� �η����׿� �̤� ���� ������ �����ִ� ��ȣ�� ���� ���翴�µ� �η����ϱ� ���� ������ �� �����ϴ� �̤�',
'500�� �� ���� ... ',6,to_date('22-08-16','yy-mm-dd'),8);

COMMIT;

-- COMM_BOARD_LIKE  ���̺�
-- ���׻�Ȱ �Խ��� ���ƿ� �ѹ�( PK )
--ȸ�� �ѹ�
--���׻�Ȱ �Խ��� �ѹ�
CREATE SEQUENCE SEQ_COMM_LIKE
START WITH 1
INCREMENT BY 1;


INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,1,1);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,5,3);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,7,13);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,3,12);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,3,10);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,8,5);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,9,4);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,7,9);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,6,4);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,5,12);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,3,16);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,6,12);

INSERT INTO comm_board_like Values(SEQ_COMM_LIKE.NEXTVAL,7,11);


COMMIT;

-- ���׻�Ȱ ���  
-- COMM_BOARD_NUM  , COMM_NUM ( PK ) , COMM_WRITER_NICKNAME, COMM_DATE, COMM_CTGR_NAME, COMM_CONTENT

-- ��� �ѹ� ������ ����
CREATE SEQUENCE SEQ_COMM_NUM
START WITH 1
INCREMENT BY 1;

SELECT * FROM comm_board;


--1
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (1, SEQ_COMM_NUM.NEXTVAL, 8, '2023-01-14', '������ �����̾����ϴ�');
--2
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (2, SEQ_COMM_NUM.NEXTVAL, 4, '2020-01-15', 'Ȥ�� īǮ �����ұ��?');
--3
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (3, SEQ_COMM_NUM.NEXTVAL, 5, '2022-11-03', 'ȭ���� �ƴϾ���?');
--4
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (4, SEQ_COMM_NUM.NEXTVAL, 7, '2024-01-01', '�ε��꿡 ����� ��Ȯ�ҵ�');
--5
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (5, SEQ_COMM_NUM.NEXTVAL, 3, '2023-07-16', '�츮�� �����Ƿ���?');
--6
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (6, SEQ_COMM_NUM.NEXTVAL, 4, '2023-09-12','���� �̿�� ������.');
--7
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (7, SEQ_COMM_NUM.NEXTVAL, 8, '2023-05-02', '���̽� ������ ��ȭ�ּ��� 010-2245-8243');
--8
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (8, SEQ_COMM_NUM.NEXTVAL, 7, '2023-06-11', '���� ����˴ϱ�? ���� �� �� �Ͻ���.');
--9
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (9, SEQ_COMM_NUM.NEXTVAL, 5, '2023-10-01', '���� �������ε�?');
--10
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (10, SEQ_COMM_NUM.NEXTVAL, 3, '2023-05-10', '�ٷγ����� ����. �ű� ����� ���� �ߺ����.');
--11
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (11, SEQ_COMM_NUM.NEXTVAL, 2, '2023-01-21', '������������ �ٷ� ������ ���ø� ���ƿ�!');
--12
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (12, SEQ_COMM_NUM.NEXTVAL, 2, '2023-12-11', '���� �ε������� ������. ���ص帱��! õ��ε��� �˻�.');
--13
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (13, SEQ_COMM_NUM.NEXTVAL, 1, '2023-02-12', '�� ã���ñ� �ٶ��Կ�.');
--14
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (14, SEQ_COMM_NUM.NEXTVAL, 9, '2023-06-01', 'ī�� �������̾�����?');
--15
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (15, SEQ_COMM_NUM.NEXTVAL, 7, '2023-01-30', '��! Ȥ�� ���� ���� ���������ٰ� �����.');
--16
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (16, SEQ_COMM_NUM.NEXTVAL, 10, '2024-02-27', '�װ� �����ε� ���� ��� ��ó���?');
--17
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (17, SEQ_COMM_NUM.NEXTVAL, 5, '2024-03-06', '���� �������׿�;');
--18
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (18, SEQ_COMM_NUM.NEXTVAL, 7, '2023-08-27', '�ο� �־��µ��� ���� �ʳ����� �Ф�');
--19
INSERT INTO COMM_CMT (COMM_BOARD_NUM, COMM_NUM, MEMBER_NUM,  COMM_DATE, COMM_CONTENT)
VALUES (19, SEQ_COMM_NUM.NEXTVAL, 8, '2023-2-27', '�츮 �����׵� ���س��߰ڳ׿�. �����մϴ�.');




-- ���׻�Ȱ ����
-- RCMT_NUM, COMM_NUM, RCMT_WRITER_NICKNAME ( PK ), CMT_BOARD_NUM, RCMT_CONTENT, RCMT_DATE
CREATE SEQUENCE SEQ_RCMT_NUM
START WITH 1
INCREMENT BY 1;


--1
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (1, 1, SEQ_RCMT_NUM.NEXTVAL, 9, '�� ������ �������� ã�� �˰ڽ��ϴ�.', '2023-01-15');
--2
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (2, 2, SEQ_RCMT_NUM.NEXTVAL, 6, '���� ��� ��ó���? �� ����ؾߵǼ�...', '2020-01-15');
--3
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (3, 3, SEQ_RCMT_NUM.NEXTVAL, 4, '���� ȭ���� �´µ�', '2022-11-03');
--4
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)       
VALUES (4, 4, SEQ_RCMT_NUM.NEXTVAL, 6, '�츮�ε��� ��ȭ�ּ��� 010-6547-2321', '2024-01-01');
--5
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (5, 5, SEQ_RCMT_NUM.NEXTVAL, 2, '�� ���� �ֳ�?', '2023-07-16');
--6
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (6, 6, SEQ_RCMT_NUM.NEXTVAL, 5, '���� ���� �̿�� ���� ��������', '2023-09-12');
--7
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (7, 7, SEQ_RCMT_NUM.NEXTVAL, 1, '���� ���� ���� �ɱ��?', '2023-05-02');
--8
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (8, 8, SEQ_RCMT_NUM.NEXTVAL, 10, '��, ���� ������ �´µ�', '2023-06-11');
--9
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (9, 9, SEQ_RCMT_NUM.NEXTVAL, 4, '�¾ƿ�, �ٷγ��� ���� ��õ!!!', '2023-10-01');
--10
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (10, 10, SEQ_RCMT_NUM.NEXTVAL, 6, '�ٷ� ������ ���ô� �� ���ƿ�!', '2023-05-10');
--11
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (11, 11, SEQ_RCMT_NUM.NEXTVAL, 9, '���� ���� ��� ���Ƽ� �ε��굵 ������', '2023-01-21');
--12
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (12, 12, SEQ_RCMT_NUM.NEXTVAL, 3, 'ã���̳���?', '2023-12-11');
--13
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (13, 13, SEQ_RCMT_NUM.NEXTVAL, 5, '�Ʊ� ���Կ��� �� �� ������...', '2023-02-12');
--14
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (14, 14, SEQ_RCMT_NUM.NEXTVAL, 4, '�װ� �� ��������?...', '2023-06-01');
--15
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (15, 15, SEQ_RCMT_NUM.NEXTVAL, 8, '�������ΰ�? �� �� ������?', '2023-01-30');
--16
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (16, 16, SEQ_RCMT_NUM.NEXTVAL, 10, 'ã�ҳ�����', '2024-02-27');
--17
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (17, 17, SEQ_RCMT_NUM.NEXTVAL, 2, '�������� ���Դ��� �ʹ� �������� �Ф�', '2024-03-06');
--18
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (18, 18, SEQ_RCMT_NUM.NEXTVAL, 4, '��¥ �ʹ� �ò�������! ���� �ذ������..', '2023-08-27');
--19
INSERT INTO CMT_REPLY (CMT_BOARD_NUM, COMM_NUM, RCMT_NUM, MEMBER_NUM, RCMT_CONTENT, RCMT_DATE)
VALUES (19, 19, SEQ_RCMT_NUM.NEXTVAL, 5, '�츮 �Ƶ鵵 ū�ϳ� �� �ߴ��� �������׿�.', '2023-2-27');

COMMIT;


-- ���׻�Ȱ ��� ���ƿ� ���̺�
-- COMM_CMT_LIKE ( PK ), COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM

CREATE SEQUENCE SEQ_COMM_CMT_LIKE
START WITH 1
INCREMENT BY 1;

--1
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 1, 1, 2);
--2
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 1, 3, 8);
--3
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 2, 7, 4);
--4
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 3, 7, 2);
--5
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 2, 3, 1);
--6
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 7, 5, 10);
--7
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 1, 4, 3);
--8
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 10, 4, 6);
--9
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 15, 6, 5);
--10
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 19, 7, 7);
--11
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 18, 1, 4);
--12
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 16, 8, 2);
--13
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 1, 9, 3);
--14
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 12, 10, 1);
--15
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 3, 8, 4);
--16
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 7, 3, 8);
--17
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 6, 1, 3);
--18
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 5, 9, 6);
--19
INSERT INTO COMM_CMT_LIKE (COMM_CMT_LIKE, COMM_BOARD_NUM, MEMBER_NUM, CMT_NUM)
VALUES (SEQ_COMM_CMT_LIKE.NEXTVAL, 15, 9, 3);

COMMIT;

-- ���׻�Ȱ ���� ���ƿ� ���̺�
-- RCMT_LIKE_NUM ( PK ), RCMT_NUM, MEMBER_NUM
CREATE SEQUENCE SEQ_RCMT_LIKE
START WITH 1
INCREMENT BY 1;


--1
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 1, 1);
--2
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)       
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 10, 1);
--3
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)       
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 9, 6);
--4
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)       
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 4, 7);
--5
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)      
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 3, 8);
--6
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)       
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 1, 9);
--7
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)      
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 2, 8);
--8
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)       
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 4, 7);
--9
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)       
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 8, 1);
--10
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)       
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 6, 2);
--11
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 7, 2);
--12
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 3, 5);
--13
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 2, 5);
--14
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 5, 2);
--15
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 6, 4);
--16
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 7, 10);
--17
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 4, 7);
--18
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 2, 5);
--19
INSERT INTO CMT_REPLY_LIKE (RCMT_LIKE_NUM, RCMT_NUM, MEMBER_NUM)
VALUES (SEQ_RCMT_LIKE.NEXTVAL, 1, 5);







-- TRADE_BOARD_LIKE ���̺� ( Ʈ���ŷ� �ߺ� ���ƿ� ó�� )
-- trade_like_num  (PK), trade_num, member_num

-- ��ǰ �Խ��� ���ƿ� ������
CREATE SEQUENCE seq_tboard_like 
INCREMENT BY 1 
START WITH 1 
NOCYCLE NOCACHE;

SELECT * FROM trade_board_like;

DROP SEQUENCE seq_tboard_like;

DELETE FROM trade_board_like;

INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 1, 1);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 1);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 3, 1);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 1, 2);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 3);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 1, 4);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 2);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 3, 2);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 1, 5);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 5);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 4);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 1, 3);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 6);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 7);
INSERT INTO trade_board_like (trade_like_num, trade_num, member_num) VALUES  ( seq_tboard_like.NEXTVAL, 2, 8);

COMMIT;



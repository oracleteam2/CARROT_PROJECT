-- scott ����
-- ITEM_CTGR ��ǰ ī�װ� �μ�Ʈ
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 1, '�����б��') ;
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 2, '��Ȱ����') ;
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 3, '�Ƿ�') ;
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 4, '�Ƶ�') ;
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 5, '������') ;
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 6, '��ǰ') ;
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 7, '���') ;
INSERT INTO ITEM_CTGR(item_ctgr_num, item_ctgr_name) VALUES ( 8, '��ϴ�') ;
COMMIT;
SELECT * FROM ITEM_CTGR;

-- TRADE_BOARD �߰�ŷ��Խ��� ������
CREATE SEQUENCE SEQ_BOARD
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE ;

select * from TRADE_BOARD ;
-- TRADE_BOARD �߰�ŷ��Խ��� �μ�Ʈ
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 1
    , 1
    , '����' 
    , 'https://cliimage.commutil.kr/phpwas/restmb_allidxmake.php?pp=002&idx=3&simg=20170712195535009572d12411ff9587970114.jpg&nmt=12'
    , '�����̸ƽ� ����ǰ'
    ,  SYSDATE
    ,  200000
    , '�̰��� ����ǰ�ε� ���� �̹� �ϳ� �־ �Ⱦƿ�'
    , '���� ��õ�� ��'
    , '��'
    , '45.5��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 2
    , 1
    , '��Ÿ'
    , 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8fA%3D%3D'
    , '���̽� ��� ����̾�'
    , SYSDATE
    , 100000
    , '�ݳ� ���� ������ ���̽� ������̾��Դϴ�. �̻�뿡 �������.'
    , '��⵵ ����� ���嵿'
    , '���嵿'
    , '39��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 3
    , 2
    , '��ȿ��'
    , 'https://img.freepik.com/premium-photo/caricature-of-a-carrot-with-a-face-and-limbs-generative-ai_252214-6349.jpg?w=2000'
    , '���� �佺��'
    , SYSDATE
    , 40000
    , '��ü�� ���� �������ϴ�. ȥ�ڻ�� ���̶�� ����� ����� ���� ũ���Դϴ�.'
    , '��⵵ ������ ������'
    , '������'
    , '42.1��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 4
    , 2
    , '�ٴ�'
    , 'https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg'
    , '���� �۶�'
    , SYSDATE
    , 30000
    , '������ī�� ���α۶��Դϴ�. ū ������� ������ �����Դϴ�. ���� ��� �����̳� ������.'
    , '���� ������ �Ｚ2��'
    , '�Ｚ2��'
    , '42.3��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 5
    , 3
    , '���¿�'
    , 'https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/rZ1xSXKCJ4cd-IExOYahRWdrqoo.jpg'
    , '�����Ƿ� Ķ��Ŭ���� ����Ƽ �˴ϴ�.'
    , SYSDATE
    , 25000
    , '3ȸ �����߽��ϴ�. ���� ����ǰ�Դϴ�. ���ŷ� ���մϴ� ��ŷ� ����'
    , '��⵵ ��õ�� ��3��'
    , '��3��'
    , '36.5��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 6
    , 3
    , '��ȣ��'
    , 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUepaBdMZtoy5GmiKF_v1vkRbwo3MgxAiIwcaztDaqiYwLdV58jhq19hUX00btfdkBUF8&usqp=CAU'
    , '��ڹ��� �����Ƿ� ��Ʈ���� ������95'
    , SYSDATE
    , 35000
    , '��ڹ��� �����Ƿ� ��Ʈ���� ������95 �� �� ���Ծ����ϴ�.'
    , '�泲 ���ؽ� ��浿'
    , '��浿'
    , '58.3��'
    );    
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 7
    , 4
    , '���¿�'
    , ' https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnoC/image/tfQwmqh621xPopjfnJ9wXkfrBcc.jpg'
    , '�޸��� ��� ������'
    , SYSDATE
    , 70000
    , '�ִϾ� �������Դϴ�. ��밨 �ֽ��ϴ�. �������ž��ؿ�'
    , '��⵵ ȭ���� �Ⳳ��'
    , '�Ⳳ��'
    , '58.3��'
    );   
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 8
    , 4
    , '����'
    , 'https://i.pinimg.com/736x/05/fe/0c/05fe0c269a225ac1251fff5bc74483ef.jpg'
    , '�Ƶ� ������ �˴ϴ�.'
    , SYSDATE
    , 15000
    , '�ؿ���� �Բ� �� �� �ִ� ����å�Դϴ�. �� �Ⱥ��� å�� �����ؿ�~'
    , '��⵵ ������ �꺻1��'
    , '�꺻1��'
    , '37.2��'
    );     
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 9
    , 5
    , 'ī����'
    , 'https://www.moneynet.co.kr/files/attach/images/33793530/304/717/049/0d8e9d6eee5e97ac11f96085c56072ab.jpg'
    , '�������� ���� �Ⱦƿ�'
    , SYSDATE
    , 10000
    , '�����ϰ� ��� �Ƚž ���� ��ȣ�մϴ�. ������ ���ؿ�!!'
    , '���� ������ ����1����2��'
    , '����1����2��'
    , '51.3��'
    );  
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 10
    , 5
    , '�ռ���'
    , 'https://cdnimage.dailian.co.kr/news/201802/news_1518415236_693408_m_1.jpg'
    , '����Ű ������ ũ�ν���'
    , SYSDATE
    , 48000
    , '����� �±±�/���ô°�ó�� �������� �Ǹ��Ͽ� ������,����,å���� �پ��ϰ� �Ű� �ٴ� �� �ֽ��ϴ�. ���� ���� ��Ź�����'
    , '���� ���α� â����1��'
    , 'â����1��'
    , '47.2��'
    );      
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 1
    , 6
    , '����' 
    , 'https://cliimage.commutil.kr/phpwas/restmb_allidxmake.php?pp=002&idx=3&simg=20170712195535009572d12411ff9587970114.jpg&nmt=12'
    , '(����ǰ)�ǰ���ǰ ȫ��/���/�λ�/���� �Ǹ�'
    , SYSDATE
    , 10000
    , '��� ����ǰ������ �߰�ŷ� Ư���� ��ǰ/ȯ��X, ����&�ϰ� ���Ű���/�װ���'
    , '��⵵ �ϳ��� ������'
    , '������'
    , '41.0��'
    );   
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 2
    , 6
    , '��Ÿ'
    , 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8fA%3D%3D'
    , 'û���ǰ ������ �ѹڽ�X20�� �¶��� ������'
    , SYSDATE
    , 20000
    , '���� ������ ģ�� �������ͼ� ��ư� �ư�� ������ 6�ڽ� �Ǹ��մϴ�.'
    , '��⵵ ���ֽ� �񵿵�'
    , '�񵿵�'
    , '39.6��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 3
    , 7
    , '��ȿ��'
    , 'https://img.freepik.com/premium-photo/caricature-of-a-carrot-with-a-face-and-limbs-generative-ai_252214-6349.jpg?w=2000'
    , '�׸��׸��� å ���'
    , SYSDATE
    , 20000
    , '���� ������ ģ�� �������ͼ� ��ư� �ư�� ������ 6�ڽ� �Ǹ��մϴ�.'
    , '���� ���ֽ� ��������'
    , '��������'
    , '37.7��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 4
    , 7
    , '�ٴ�'
    , 'https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg'
    , '��� ���� �Ҹ����� �������'
    , SYSDATE
    , 8000
    , '���ƺ���������ε� ���� ģ�����̶� �� ���ø鼭 �����ϱ⵵ ���� ���߷� �������!'
    , '��⵵ �ϳ��� ������'
    , '������'
    , '37.4��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 5
    , 8
    , '���¿�'
    , 'https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/rZ1xSXKCJ4cd-IExOYahRWdrqoo.jpg'
    , '������ ���ϼ� ��ϴ�'
    , SYSDATE
    , 15000
    , '10000~15000���� ��� �ù�� ������ �����Դϴ�. �ǹ������̳� ��������� �� �����ּž��մϴ�.���ŷ��� �����ؿ�~'
    , '�λ� ������ ������8��'
    , '������8��'
    , '37.1��'
    );
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 6
    , 8
    , '��ȣ��'
    , 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUepaBdMZtoy5GmiKF_v1vkRbwo3MgxAiIwcaztDaqiYwLdV58jhq19hUX00btfdkBUF8&usqp=CAU'
    , '10������ �ż����ǰ�� ��ϴ�.'
    , SYSDATE
    , 94000
    , '9.4�� 50����� �纾�ϴ�~~'
    , '���� ���Ǳ� �߾ӵ�'
    , '������8��'
    , '47.3��'
    );

-- ITEM_IMAGE �߰��ǰ �̹��� ������
CREATE SEQUENCE SEQ_IMAGE 
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE; 

-- ��ǰ�̹��� ������Ÿ�� ���� ( -> VARCHAR2 )
ALTER TABLE ITEM_IMAGE MODIFY(
ITEM_IMAGE_URL VARCHAR2(4000) );

-- ��ǰ �Խ��� ���� �� �̹��� �����!! 
-- ITEM_IMAGE ��ǰ �̹��� �μ�Ʈ
--1. �����̸ƽ� ����ǰ
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/f3cc3e8742b9f393e3a0294691d87e4a24254b200cf7fbde7b1df4c512dd0590.jpg?q=95&s=1440x1440&t=inside&f=webp');
--1. ���̽� ������̱�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202402/a33849be0e1a93ac4d5e3d26d5db12a396d7507b4aaf505a0cccffe648e81639.jpg?q=95&s=1440x1440&t=inside&f=webp');

--2. ���� �佺��
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/08ec535f0dc069be48db7970231f52a662446f8e07d334b7e44f23d97ffa145f_0.webp?q=95&s=1440x1440&t=inside&f=webp');
--2. ���� �۶� ��Ʈ
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202402/cc6cf7e733f70887fb9d4963c4e96d22af16021f9a86729c4f1b5f08dd6a8e68.jpg?q=95&s=1440x1440&t=inside&f=webp');

--3. �����Ƿ� Ķ��Ŭ���� ����Ƽ
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/51a2ebe878d07f4ff8223922c38bea16a348775645e01ab5ff4fc146499ca61d.jpg?q=95&s=1440x1440&t=inside&f=webp');
--3. ��ڹ��� �����Ƿ� ��Ʈ���� ������ 95
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/bd0118fec665620ed0284959a46cfd4b69caf2034b3ed4046594d3ff680de518_0.webp?q=95&s=1440x1440&t=inside&f=webp');

--4. �޸��� ��� ������
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/ac29d7c003f5c248866caf0beb4b197ecfad62315987dbb241d512aa66d4d574_0.webp?q=95&s=1440x1440&t=inside&f=webp');
--4. �Ƶ� ������
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/c05c5dbd0a7f9024e140997cfb00a0d97aba1a67ef280682dccd3a3eabadd00a_0.webp?q=95&s=1440x1440&t=inside&f=webp');

--5. �������� ����
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/cc0557c1b1fe9644ab8d7aeb6286941269238e30cbdc2974313889ac57aa934c_0.webp?q=95&s=1440x1440&t=inside&f=webp');
--5. ����Ű ������ ũ�ν���
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/dab501b13199011884360972c1c83a6359920d1183ec11858b692996b8fae9ba.jpg?q=95&s=1440x1440&t=inside&f=webp');

--6. �ǰ���ǰ ȫ��/���/�λ� �Ǹ�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/443d225e529c56a3e1ca01ce43bb0c5996e8e155d344c856170e94551bc1cd8b.jpg?q=95&s=1440x1440&t=inside&f=webp');
--6. û���ǰ ������ �ѹڽ�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/eb7d278209226ba4e0f50d785e2bfcd3eea172940114b282f8ae3b5210871388_0.webp?q=95&s=1440x1440&t=inside&f=webp');

--7. �׸��׸��� å
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/381060bf56789f968187e21207f799f9c8ac683c9ec4c7a93f5467edb88a9b3f.jpg?q=95&s=1440x1440&t=inside&f=webp');
--7. ��� �Ҹ����� �������
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/09dc177b0574a519229a12c93671ae4649c5527293e52504eaa39873d24f6704.jpg?q=95&s=1440x1440&t=inside&f=webp');

--8. ������ ���ϼ� ��ϴ�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/0bc0de5e3842995b678fd4c32d76b51f9d4745182e4b82a7fea1fa7b8f531429_0.webp?q=95&s=1440x1440&t=inside&f=webp');
--8. �ż��� ��ǰ��
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/f63093fdcb0c7ce520dd22f3609316a3be290e5a75d3210eca1c5e3152d5fef1_0.webp?q=95&s=1440x1440&t=inside&f=webp');
------------------------------------------------------------------------------------


-- TRADE_BOARD �߰�ŷ��Խ��� ������
CREATE SEQUENCE SEQ_BOARD
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE ;
-- ITEM_IMAGE �߰��ǰ �̹��� ������
CREATE SEQUENCE SEQ_IMAGE 
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

------------------------------------------------------------------------------------
select * from TRADE_BOARD ;
-- TRADE_BOARD �߰�ŷ��Խ��� �μ�Ʈ + ITEM_IMAGE ��ǰ�̹��� �μ�Ʈ 
--1. �����̸ƽ� ����ǰ
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 1
    , 1
    , '�����̸ƽ� ����ǰ'
    , '�̰��� ����ǰ�ε� ���� �̹� �ϳ� �־ �Ⱦƿ�'
    ,  SYSDATE
    ,  200000
    , '��'
    );   
--1. �����̸ƽ� ����ǰ
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/f3cc3e8742b9f393e3a0294691d87e4a24254b200cf7fbde7b1df4c512dd0590.jpg?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/common/?src=https%3A%2F%2Fshopping-phinf.pstatic.net%2Fmain_8711646%2F87116460443.jpg&type=f372_372');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMDVfMTU4%2FMDAxNzAxNzY0Mjk0MDc4.iDJ3j4hn_JIb1eL1BLSkxrtmFn7PCNcoVusyNmeDzXwg.42yYugGj2rjwedgzSYFmzOer2zHl1bejswZ96rkQsqEg.JPEG.sol__l2%2FKakaoTalk_20231205_170011141_01.jpg&type=a340');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimage.msscdn.net%2Fimages%2Fgoods_img%2F20240118%2F3806183%2F3806183_17080610408383_500.jpg&type=a340');


--1. ���̽� ������̱�
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 2
    , 1
    , '���̽� ���ۼҴ� ������̾� ��� ���� �Ǹ��մϴ�.'
     , '�̰��� ����ǰ ��ǰ�Դϴ�. ���ŷ��� ���嵿���� �����մϴ�.'
    , '2024-03-01'
    , 100000
    , '���嵿'
    );
--1. ���̽� ������̱�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/9887accfc129500a7c887f3a94b6441752b6db9f061b690f82777ec7e06e7ed5_0.webp?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/861b835995343e320e6259fa92c2d3c9b3f059c7b1b226a5cafa3993773daba7_1.webp?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/9887accfc129500a7c887f3a94b6441752b6db9f061b690f82777ec7e06e7ed5_2.webp?q=95&s=1440x1440&t=inside&f=webp');

--2. ���� �佺��
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 3
    , 2
    , '���� �佺��'
    , '��ü�� ���� �������ϴ�. ȥ�ڻ�� ���̶�� ����� ����� ���� ũ���Դϴ�.'
    , '2024-02-28'
    , 40000  
    , '������'
    );
--2. ���� �佺��
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202401/08ec535f0dc069be48db7970231f52a662446f8e07d334b7e44f23d97ffa145f_0.webp?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/community/community/20240216/2ffbac14-1384-480d-acc4-4fdeb42fabb5.png?&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fdnvefa72aowie.cloudfront.net%2Forigin%2Farticle%2F202312%2Fac867456b1fe127309cf94a172a46ac2d514cafc2a982e622383af25493a2f60.jpg%3Fq%3D95%26s%3D1440x1440%26t%3Dinside%26f%3Dwebp&type=sc960_832');

--2. ���� �۶� ��Ʈ
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 4
    , 2
    , '���� �۶�'
    , '������ī�� ���α۶��Դϴ�. ū ������� ������ �����Դϴ�. ���� ��� �����̳� ������.'
    , '2024-02-16'
    , 30000  
    , '�Ｚ2��'
    );
--2. ���� �۶� ��Ʈ
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://d3pl61q8x5fmnh.cloudfront.net/origin/article/202402/cc6cf7e733f70887fb9d4963c4e96d22af16021f9a86729c4f1b5f08dd6a8e68.jpg?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshopping.phinf.naver.net%2Fmain_3754868%2F37548689017.20230131125646.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20230324_114%2F1679637966978NtLwq_JPEG%2FTLbli_100901_7.jpg&type=sc960_832');

 --3. �����Ƿ� Ķ��Ŭ���� ����Ƽ
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 5
    , 3
    , '�����Ƿ� Ķ��Ŭ���� ����Ƽ �˴ϴ�.'
    , '3ȸ �����߽��ϴ�. ���� ����ǰ�Դϴ�. ���ŷ� ���մϴ� ��ŷ� ����'
    , '2024-02-04'
    , 25000   
    , '��3��'
    );
 --3. �����Ƿ� Ķ��Ŭ���� ����Ƽ
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/51a2ebe878d07f4ff8223922c38bea16a348775645e01ab5ff4fc146499ca61d.jpg?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimage.musinsa.com%2Fmfile_s01%2F2022%2F04%2F15%2Fff67c3458fdaa4d4f3b5e3dc23c5506d184029.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA1MTVfOTkg%2FMDAxNjg0MTUwNTU0MjM4.QyxnLWV6NqLFYleqyR-PK8W_Z7_hgeoXg2RKDEQ6QdQg.kWGLc6KYE0tnxdvtGlQHbtkfQ79kteDu199f559s1Tog.JPEG.tnstnqorqo%2FIMG_8125.JPG&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fck-s3.s3.ap-northeast-2.amazonaws.com%2Fecom%2F24SS%2FCKJ%2FJ223860-YAF%2FJ223860-YAF-ITEM-2.jpg&type=a340');

--3. ��ڹ��� �����Ƿ� ��Ʈ���� ������ 95
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 6
    , 3
    , '��ڹ��� �����Ƿ� ��Ʈ���� ������95'
    , '��ڹ��� �����Ƿ� ��Ʈ���� ������95 �� �� ���Ծ����ϴ�.'
    , '2024-02-01'
    , 35000
    , '��浿'
    ); 
--3. ��ڹ��� �����Ƿ� ��Ʈ���� ������ 95
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210828_228%2F163013337942202vwE_JPEG%2F31269162995911619_1021975160.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210710_203%2F1625916196021Ubx5S_JPEG%2F33380828139819908_936957536.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fccimg.hellomarket.com%2Fimages%2F2023%2Fitem%2F02%2F16%2F13%2F2522936_5731861_1.jpg%3Fsize%3Ds6&type=sc960_832');

--4. �޸��� ��� ������
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 7
    , 4
    , '�޸��� ��� ������'
    , '�ִϾ� �������Դϴ�. ��밨 �ֽ��ϴ�. �������ž��ؿ�'
    , '2024-01-30'
    , 70000
    , '�Ⳳ��'
    );   
--4. �޸��� ��� ������
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/ac29d7c003f5c248866caf0beb4b197ecfad62315987dbb241d512aa66d4d574_0.webp?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODA0MjdfNTEg%2FMDAxNTI0ODMwNDU5MjM0.EEzN1PjwOjDrsQt6AMdKGUGqZ7GWp8FE17w6Ff5oLgYg.1SUuiexNmY8B7L9vEgMnjcYzvX_iUZdZP0cOvF7ZHZUg.JPEG.1984velo%2FKakaoTalk_20180427_200934077.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxOTA0MDdfMjcg%2FMDAxNTU0NTkxMTA2ODE1.uCJ7D0xtEAz85zKy0c510bZML4FGoZPPWw1kRX9mRrMg.H7DLcFWg2Iry0ZOJ9A0a_keNHGjIOQVRJSF9H5_Olygg.JPEG.kyungin0315%2FAE5B12D6-F4F9-451A-8825-8A539D88F208.jpeg&type=sc960_832' );
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMjdfMjA3%2FMDAxNzA2MzQzNjc5MjE0.Ma3dduyAiiLYPyGbnhlADUZnC0ftAZaNrGO8eAUveKgg.z9rEJ1hwJtwifePsI2izr_uxh7kWulM94rqEmSpUfmIg.JPEG.okuro1977%2F%25B8%25DE%25B8%25AE%25B4%25D920.jpg&type=sc960_832' );

--4. �Ƶ� ������
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 8
    , 4
    , '�Ƶ� ������ �˴ϴ�.'
    , '�ؿ���� �Բ� �� �� �ִ� ����å�Դϴ�. �� �Ⱥ��� å�� �����ؿ�~'
    , '2024-01-14'
    , 15000
    , '�꺻1��'
    );     
--4. �Ƶ� ������
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/c05c5dbd0a7f9024e140997cfb00a0d97aba1a67ef280682dccd3a3eabadd00a_0.webp?q=95&s=1440x1440&t=inside&f=webp');    
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMDRfNTkg%2FMDAxNzA0MzU5MzQ2MzYw.SnuXXedY-d-o69g7wa4U5rFq0uOGx6I8m3gT5VMX6k4g.iU1C4BUd1IQ-xeHEp-e9wT-lwvUk6IKjj8mFlZZB-SQg.JPEG.yaena1143%2FIMG_2961.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20200304_158%2F1583306549050vLuw0_JPEG%2F20668882615659850_1383306984.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxOTExMjhfMjYg%2FMDAxNTc0OTIwNDE3NTQ4.SBjpdDpT1NVClTOyhy6zoEA5iYg_cuLKEbkcDoP5JDYg.E7Z3seCuctdf6b5lvyjmUFFmfN8mNrg_v1sdRLk1-ZUg.JPEG%2FexternalFile.jpg&type=sc960_832');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20220503_138%2F1651533711184nSJx7_JPEG%2F52669539010215726_920666573.jpg&type=sc960_832');
----------------------------------------------------������� �̹��� �߰���
--5. �������� ����
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 9
    , 5
    , '�������� ���� �Ⱦƿ�'
    , '�����ϰ� ��� �Ƚž ���� ��ȣ�մϴ�. ������ ���ؿ�!!'
    , SYSDATE
    , 10000
    , '����1����2��'
    );  
--5. �������� ����
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/cc0557c1b1fe9644ab8d7aeb6286941269238e30cbdc2974313889ac57aa934c_0.webp?q=95&s=1440x1440&t=inside&f=webp');
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL, 'https://search.pstatic.net/common/?src=http%3A%2F%2Fshopping.phinf.naver.net%2Fmain_4423427%2F44234275577.20231124174445.jpg&type=sc960_832');

--5. ����Ű ������ ũ�ν���
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 10
    , 5
    , '����Ű ������ ũ�ν���'
    , '����� �±±�/���ô°�ó�� �������� �Ǹ��Ͽ� ������,����,å���� �پ��ϰ� �Ű� �ٴ� �� �ֽ��ϴ�. ���� ���� ��Ź�����'
    , SYSDATE
    , 48000    
    , 'â����1��'
    );  
--5. ����Ű ������ ũ�ν���
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/dab501b13199011884360972c1c83a6359920d1183ec11858b692996b8fae9ba.jpg?q=95&s=1440x1440&t=inside&f=webp');
    
--6. �ǰ���ǰ ȫ��/���/�λ� �Ǹ�
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 1
    , 6
    , '(����ǰ)�ǰ���ǰ ȫ��/���/�λ�/���� �Ǹ�'
    , '��� ����ǰ������ �߰�ŷ� Ư���� ��ǰ/ȯ��X, ����&�ϰ� ���Ű���/�װ���'
    , SYSDATE
    , 10000
    , '������'
    );   
--6. �ǰ���ǰ ȫ��/���/�λ� �Ǹ�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/443d225e529c56a3e1ca01ce43bb0c5996e8e155d344c856170e94551bc1cd8b.jpg?q=95&s=1440x1440&t=inside&f=webp');

--6. û���ǰ ������ �ѹڽ�
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 2
    , 6
    , 'û���ǰ ������ �ѹڽ�X20�� �¶��� ������'
    , '���� ������ ģ�� �������ͼ� ��ư� �ư�� ������ 6�ڽ� �Ǹ��մϴ�.'
    , SYSDATE
    , 20000
    , '�񵿵�'
    ); 
--6. û���ǰ ������ �ѹڽ�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/eb7d278209226ba4e0f50d785e2bfcd3eea172940114b282f8ae3b5210871388_0.webp?q=95&s=1440x1440&t=inside&f=webp');
   
--7. �׸��׸��� å
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 3
    , 7
    , '�׸��׸��� å ���'
    , 'ȥ���ϱ� �ʹ� ���� ����Դϴ� ������ �غ��� ���� �����غ�����~'
    , SYSDATE
    , 20000
    , '��������'
    );
--7. �׸��׸��� å
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/381060bf56789f968187e21207f799f9c8ac683c9ec4c7a93f5467edb88a9b3f.jpg?q=95&s=1440x1440&t=inside&f=webp');

--7. ��� �Ҹ����� �������
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES (
    SEQ_BOARD.NEXTVAL
    , 4
    , 7
    , '��� ���� �Ҹ����� �������'
    , '���ƺ���������ε� ���� ģ�����̶� �� ���ø鼭 �����ϱ⵵ ���� ���߷� �������!'
    , SYSDATE
    , 8000
    , '������'
    );
--7. ��� �Ҹ����� �������
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/09dc177b0574a519229a12c93671ae4649c5527293e52504eaa39873d24f6704.jpg?q=95&s=1440x1440&t=inside&f=webp');

    
--8. ������ ���ϼ� ��ϴ�
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 5
    , 8
    , '������ ���ϼ� ��ϴ�'
    , '10000~15000���� ��� �ù�� ������ �����Դϴ�. �ǹ������̳� ��������� �� �����ּž��մϴ�.���ŷ��� �����ؿ�~'
    , SYSDATE
    , 15000
    , '������8��'
    );
--8. ������ ���ϼ� ��ϴ�
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/0bc0de5e3842995b678fd4c32d76b51f9d4745182e4b82a7fea1fa7b8f531429_0.webp?q=95&s=1440x1440&t=inside&f=webp');

--8. �ż��� ��ǰ��
INSERT INTO TRADE_BOARD ( trade_num, member_num, selitem_ctgr_num, trade_title, trade_content, upload_date, trade_price, trade_location)
VALUES ( 
    SEQ_BOARD.NEXTVAL
    , 6
    , 8
    , '10������ �ż����ǰ�� ��ϴ�.'
    , '9.4�� 50����� �纾�ϴ�~~'
    , SYSDATE
    , 94000
    , '������8��'
    );
--8. �ż��� ��ǰ��
INSERT INTO item_image ( trade_num, item_image_num, item_image_url)
VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  'https://dnvefa72aowie.cloudfront.net/origin/article/202403/f63093fdcb0c7ce520dd22f3609316a3be290e5a75d3210eca1c5e3152d5fef1_0.webp?q=95&s=1440x1440&t=inside&f=webp');
 

-----------------------------------------------------------------------------------
INSERT INTO ITEM_IMAGE VALUES ( SEQ_IMAGE.NEXTVAL, SEQ_BOARD.CURRVAL,  '');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1998-06-29', '����', '�λ걤���� �ؿ�뱸 �ߵ�', '010-4044-4444', 'https://cliimage.commutil.kr/phpwas/restmb_allidxmake.php?pp=002&idx=3&simg=20170712195535009572d12411ff9587970114.jpg&nmt=12');

-- & = ���ڰ����� ����ϵ��� ����
SHOW DEFINE;

SET DEFINE OFF;

--- TRADE_PRICE ������Ÿ��(NUMBER-> VARCHAR2) ���� 
ALTER TABLE item_image MODIFY(
ITEM_IMAGE_URL varchar2(4000) );


SELECT * FROM member;
select * from ITEM_CTGR ;
SELECT * FROM ITEM_IMAGE;

CREATE SEQUENCE seq_member_id ;
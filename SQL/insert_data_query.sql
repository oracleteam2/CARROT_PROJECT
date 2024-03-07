-- SCOTT
-- ������ ����

-- ȸ��
-- ȸ�� �ֱ����� �߰����ּ���
ALTER TABLE member MODIFY (member_manner_points DEFAULT '36.5');

CREATE SEQUENCE SEQ_MEMBER_ID
START WITH 1
INCREMENT BY 1;

SHOW DEFINE;
SET DEFINE OFF;

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1998-06-29', '����', '�λ걤���� �ؿ�뱸 �ߵ�', '010-4044-4444', 'https://cliimage.commutil.kr/phpwas/restmb_allidxmake.php?pp=002&idx=3&simg=20170712195535009572d12411ff9587970114.jpg&nmt=12');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1990-03-12', '��Ÿ', '����Ư���� ������ �ߵ�', '010-1234-4444', 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8fA%3D%3D
');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1991-05-23', '��ȿ��', '����Ư���� ������ �ߵ�', '010-9822-4224', 'https://img.freepik.com/premium-photo/caricature-of-a-carrot-with-a-face-and-limbs-generative-ai_252214-6349.jpg?w=2000

');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1992-07-27', '�ٴ�', '����Ư���� ����� �ߵ�', '010-4467-2454', 'https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg
');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1993-11-19', '���¿�', '����Ư���� ������ �ߵ�', '010-7014-1244', 'https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/rZ1xSXKCJ4cd-IExOYahRWdrqoo.jpg');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1994-12-04', '��ȣ��', '�뱸������ ������ �ߵ�', '010-8344-8894', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUepaBdMZtoy5GmiKF_v1vkRbwo3MgxAiIwcaztDaqiYwLdV58jhq19hUX00btfdkBUF8&usqp=CAU 
');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1995-09-02', '���¿�', '����������  ���� �ߵ�', '010-7744-4477', ' https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnoC/image/tfQwmqh621xPopjfnJ9wXkfrBcc.jpg
');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1996-08-24', '����', '�λ걤���� �ؿ�뱸 �µ�', '010-1253-8964', 'https://i.pinimg.com/736x/05/fe/0c/05fe0c269a225ac1251fff5bc74483ef.jpg');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '1997-02-15', 'ī����', '��õ������ ���� �ߵ�', '010-2834-5315', 'https://www.moneynet.co.kr/files/attach/images/33793530/304/717/049/0d8e9d6eee5e97ac11f96085c56072ab.jpg');

INSERT INTO member(member_num, member_birth, member_nickname, member_address, member_tel, member_profile) 
VALUES (seq_member_id.NEXTVAL, '2000-07-11', '�ռ���', '����Ư���� ���ֽ� �ƶ��ϵ�', '010-2427-2453', 'https://cdnimage.dailian.co.kr/news/201802/news_1518415236_693408_m_1.jpg');

-- ������
CREATE SEQUENCE SEQ_ADMIN_ID
START WITH 1
INCREMENT BY 1;

INSERT INTO admin
VALUES (SEQ_ADMIN_ID.NEXTVAL, '������1', 'admin123', '1234');

INSERT INTO admin
VALUES (SEQ_ADMIN_ID.NEXTVAL, '������2', 'admin4875', '842135');

INSERT INTO admin
VALUES (SEQ_ADMIN_ID.NEXTVAL, '������3', 'admin9753', '84651321');

-- �Ű�
CREATE SEQUENCE SEQ_REPORT_ID
START WITH 1
INCREMENT BY 1;

INSERT INTO report
VALUES (SEQ_REPORT_ID.NEXTVAL, 1, 3);

-- ����
INSERT INTO block
VALUES (3, 5);

-- ä��
CREATE SEQUENCE SEQ_CHATROOM_ID
START WITH 1
INCREMENT BY 1;
 
1

2

-- ä�� ����
CREATE SEQUENCE SEQ_CHATCONTENT_ROOM1_ID --1��ä�ù� �����ȣ
START WITH 1
INCREMENT BY 1;

INSERT INTO chat_board
VALUES (1,SEQ_CHATCONTENT_ROOM1_ID,���̳��� );

CREATE SEQUENCE SEQ_CHATCONTENT_ROOM2_ID -- 2��ä�ù� �����ȣ
START WITH 1
INCREMENT BY 1;

INSERT INTO chat_board
VALUES (2,SEQ_CHATCONTENT_ROOM2_ID,���̳��� );


-- �������


-- ����


-- �������� �Խ���


-- �Ǹ� ��ǰ ī�װ�


-- �߰�ŷ� �Խ���


-- ��ǰ �̹���


-- �߰�ŷ� �Խ��� ���ƿ�


-- ���׻�Ȱ ī�װ�


-- ���׻�Ȱ �Խ���


-- ���׻�Ȱ ���


-- ���׻�Ȱ ����


-- ���׻�Ȱ �Խ��� ���ƿ�


-- ���׻�Ȱ ��� ���ƿ�


-- ���׻�Ȱ ���� ���ƿ�
























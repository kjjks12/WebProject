drop table book;
create table book(
  book_code varchar2(15) not null constraint book_id_pk primary key, --�����ڵ� (���� ISBN)
  book_title varchar2(90) not null,  --��������(�ѱ��ִ� 30��) 
  book_author varchar2(60) not null,  --���� (�ѱ��ִ� 20��)
  book_publisher varchar2(60) not null, --���ǻ�(�ѱ��ִ� 20��)
  book_date date not null,  --�Ⱓ��
  book_page number(4) not null, --��������
  book_price number(7) not null, --��������
  book_cover varchar2(20), --����ǥ��(ǥ�� �̹��� �����̸�- �����ڵ�.jpg)
  book_category_code varchar2(4), --���� �з��ڵ�(�����ڵ�)
  book_inventory number(10) -- ������
);

drop table bookDetail;
create table bookDetail(
  bookdetail_code varchar2(15) not null constraint bookDetail_id_pk primary key CONSTRAINT bookDetail_id_fk REFERENCES book(book_code), --�����������ڵ�(�����ڵ�)
  bookdetail_description clob, --���� �⺻�Ұ�
  bookdetail_author clob, -- ���� ���ڼҰ�
  bookdetail_index clob -- ���� ����
)

drop table customer;
create table customer(
  customer_code varchar2(20) not null constraint customer_id_pk primary key, --����� id
  customer_password varchar2(20) not null, --��й�ȣ
  customer_tel varchar2(15) not null, --����ó
  customer_addr varchar2(210) not null, -- �ּ� (�ѱ��ִ� 70��)
  customer_gender varchar2(4) not null, --���� (�����ڵ�)
  customer_birth varchar2(10) not null, --������� (YYYY-MM-DD)
  customer_email varchar2(30) not null, --�̸��� (�ִ� 30����)
  customer_name varchar2(21) not null, --�̸� (�ѱ��ִ� 7��)
  customer_hint varchar2(60) not null, --��й�ȣ ��Ʈ (�ѱ��ִ� 20��)
  customer_question varchar2(120) not null, -- ��й�ȣ ���� (�ѱ��ִ� 40��)
  customer_answer varchar2(30) not null -- ��й�ȣ �� (�ѱ��ִ� 10��)
)

drop table bookOrder;
create table bookOrder(
  order_code varchar2(35) not null constraint order_id_pk primary key, -- �ֹ���ȣ =  to_char(sysdate,'YYYYMMDDHHMISS')+customer_code
  order_customer_code varchar2(20) not null constraint order_id_fk references customer(customer_code), --����� code(id)
  order_date date not null, --�ֹ�����(sysdate)
  order_addr varchar2(210) not null, --������ּ�
  order_tel varchar2(15) not null, --����� ��ȭ��ȣ
  order_state varchar2(4) not null  --�ֹ�����(�����ڵ�)
)

drop table orderDetail;
create table orderDetail(
  --orderdetail_code varchar2(30) not null constraint orderDetail_id_pk primary key, --�ֹ������ڵ�
  orderdetail_order_code varchar2(35) not null constraint orderdetail_id_fk1 references bookOrder(order_code), --�ֹ���ȣ
  orderdetail_book_code varchar2(15) not null constraint orderdetail_id_fk2 references book(book_code), --������ȣ
  orderdetail_qty number(4) not null, --����
  orderdetail_price number(8) not null, --�հ�ݾ�
  constraint orderDetail_id_pk  primary key(orderdetail_order_code, orderdetail_book_code)
)

drop SEQUENCE cart_sequence;
create SEQUENCE cart_sequence
  START WITH 1
  INCREMENT BY 1 MAXVALUE 99999999 CYCLE;


drop table cart;
create table cart(
  cart_code varchar2(8) not null constraint cart_id_pk primary key, --��ٱ��� �ڵ�(��ȯ ������)
  cart_customer_code varchar2(20) not null  constraint cart_id_fk1 references customer(customer_code), -- �����id
  cart_book_code varchar2(15) not null constraint cart_id_fk2 references book(book_code), --�����ڵ�
  cart_qty number(4) not null, --���� (�ִ� ���ż�: 9999��)
  cart_price number(8) not null --�հ�ݾ� (�ִ� ���� �ݾ� : 99,999,999��)
);

drop table payment;
create table payment(
  payment_code varchar2(35) not null constraint payment_id_pk primary key constraint payment_id_fk references bookOrder(order_code), --�����ڵ�(�ֹ��ڵ�)
  payment_total_price number(8) not null, --�����ݾ�(�ִ� ���� �ݾ� : 99,999,999��)
  payment_type varchar2(4) not null, --������� (�����ڵ�)
  payment_date date not null --�����ð� (sysdate)
)

drop table commonCode;
create table commonCode(
  commonCode_common_code varchar2(4) not null constraint commonCode_id_pk primary key, --�����ڵ�
  commonCode_name varchar2(50), --�����ڵ��̸�
  commonCode_desc varchar2(100), --�����ڵ� ����
  commonCode_parent_code varchar2(4), --�θ� �����ڵ�
  commonCode_reg_date date not null, --�ڵ� ����Ͻ� (sysdate)
  commonCode_update_date date not null, --�ڵ� �����Ͻ� (sysdate)
  commonCode_used varchar2(1) default 'Y'--�ڵ� ������� ('Y' or 'N')
)

insert into commonCode values('01', '����', '��������', null, sysdate, sysdate, 'Y');
insert into commonCode values('02', '�������', 'ī��, ������ü�� ������� ����', null, sysdate, sysdate, 'Y');
insert into commonCode values('03', '�ֹ�����', '�ֹ��� ������¸� ��Ÿ����', null, sysdate, sysdate, 'Y');
insert into commonCode values('04', '�о�', '������ �о߸� ��Ÿ����.', null, sysdate, sysdate, 'Y');

insert into commonCode values('0101', '��', '���� ����', '01', sysdate, sysdate, 'Y');
insert into commonCode values('0102', '��', '���� ����', '01', sysdate, sysdate, 'Y');

insert into commonCode values('0201', 'ī��', 'ī��� ����', '02', sysdate, sysdate, 'Y');
insert into commonCode values('0202', '������ü', '������ü�� ����', '02', sysdate, sysdate, 'Y');
insert into commonCode values('0203', '�ڵ�������', '�ڵ������� ����', '02', sysdate, sysdate, 'Y');
insert into commonCode values('0204', '�������Ա�', '�������Ա�', '02', sysdate, sysdate, 'Y');

insert into commonCode values('0301', '���������', '�ֹ�����', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0302', '�����Ϸ�', '�ֹ�����', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0303', '����غ���', '�ֹ�����', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0304', '�����', '�ֹ�����', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0305', '��ۿϷ�', '�ֹ�����', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0306', '���Ŵ����', '�ֹ�����', '03', sysdate, sysdate, 'N');

insert into commonCode values('0401', '���α׷���', '�о�', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0402', '��', '�о�', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0403', '��Ʈ��ũ', '�о�', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0404', '�����ͺ��̽�', '�о�', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0405', '���輭', '�о�', '04', sysdate, sysdate, 'Y');

select * from commonCode;

select lpad(' ', level*4)||COMMONCODE_COMMON_CODE, COMMONCODE_NAME, COMMONCODE_DESC, COMMONCODE_USED from commonCode where COMMONCODE_USED='Y'
start with commoncode_parent_code is null
connect by PRIOR COMMONCODE_COMMON_CODE=COMMONCODE_PARENT_CODE;

select * from CUSTOMER;
insert into CUSTOMER values('jang', '0000', '010-3333-4444', '�����Ǳ�', '0102', '19970303', 'jang@daum.net', '�����', '��', '��������', '��');
insert into CUSTOMER values('ahn', 'v3', '010-0000-5555', '�����Ǳ��� ����', '0101', '19570408', 'ahn@daum.net', '��ö��', '���', '�������� �ְ� �������� �ְ�', '���ڵ���');
insert into CUSTOMER values('hong', '0000', '010-6383-4140', '���', '0101', '19511103', 'hong@daum.net', '���̷ո�', '���̷ո�', '����������������..', '����������');

select * from book;
insert into book VALUES('9788968483554', '��� ���� ���� JavaScript + jQuery �Թ�(3��)','���μ�', '�Ѻ��̵��', sysdate, 960, 32200, '9788968483554.jpg', '0402', 500);
insert into book VALUES('9788968483561', '���� ù ���̽�','���μ�', '�Ѻ��̵��', sysdate, 664, 30000, '9788968483561.jpg', '0401', 700);
insert into book VALUES('9788968483554', '��� ���� ���� JavaScript + jQuery �Թ�(3��)','���μ�', '�Ѻ��̵��', sysdate, 960, 32200, '9788968483554.jpg', '0402', 500);
insert into book VALUES('9788968483554', '��� ���� ���� JavaScript + jQuery �Թ�(3��)','���μ�', '�Ѻ��̵��', sysdate, 960, 32200, '9788968483554.jpg', '0402', 500);

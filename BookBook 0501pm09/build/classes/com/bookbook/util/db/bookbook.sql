drop table book;
create table book(
  book_code varchar2(15) not null constraint book_id_pk primary key, --도서코드 (도서 ISBN)
  book_title varchar2(90) not null,  --도서제목(한글최대 30자) 
  book_author varchar2(60) not null,  --저자 (한글최대 20자)
  book_publisher varchar2(60) not null, --출판사(한글최대 20자)
  book_date date not null,  --출간일
  book_page number(4) not null, --페이지수
  book_price number(7) not null, --도서가격
  book_cover varchar2(20), --도서표지(표지 이미지 파일이름- 도서코드.jpg)
  book_category_code varchar2(4), --도서 분류코드(공통코드)
  book_inventory number(10) -- 재고수량
);

drop table bookDetail;
create table bookDetail(
  bookdetail_code varchar2(15) not null constraint bookDetail_id_pk primary key CONSTRAINT bookDetail_id_fk REFERENCES book(book_code), --도서상세정보코드(도서코드)
  bookdetail_description clob, --도서 기본소개
  bookdetail_author clob, -- 도서 저자소개
  bookdetail_index clob -- 도서 목차
)

drop table customer;
create table customer(
  customer_code varchar2(20) not null constraint customer_id_pk primary key, --사용자 id
  customer_password varchar2(20) not null, --비밀번호
  customer_tel varchar2(15) not null, --연락처
  customer_addr varchar2(210) not null, -- 주소 (한글최대 70자)
  customer_gender varchar2(4) not null, --성별 (공통코드)
  customer_birth varchar2(10) not null, --생년월일 (YYYY-MM-DD)
  customer_email varchar2(30) not null, --이메일 (최대 30글자)
  customer_name varchar2(21) not null, --이름 (한글최대 7자)
  customer_hint varchar2(60) not null, --비밀번호 힌트 (한글최대 20자)
  customer_question varchar2(120) not null, -- 비밀번호 질문 (한글최대 40자)
  customer_answer varchar2(30) not null -- 비밀번호 답 (한글최대 10자)
)

drop table bookOrder;
create table bookOrder(
  order_code varchar2(35) not null constraint order_id_pk primary key, -- 주문번호 =  to_char(sysdate,'YYYYMMDDHHMISS')+customer_code
  order_customer_code varchar2(20) not null constraint order_id_fk references customer(customer_code), --사용자 code(id)
  order_date date not null, --주문일자(sysdate)
  order_addr varchar2(210) not null, --배송지주소
  order_tel varchar2(15) not null, --배송지 전화번호
  order_state varchar2(4) not null  --주문상태(공통코드)
)

drop table orderDetail;
create table orderDetail(
  --orderdetail_code varchar2(30) not null constraint orderDetail_id_pk primary key, --주문내역코드
  orderdetail_order_code varchar2(35) not null constraint orderdetail_id_fk1 references bookOrder(order_code), --주문번호
  orderdetail_book_code varchar2(15) not null constraint orderdetail_id_fk2 references book(book_code), --도서번호
  orderdetail_qty number(4) not null, --수량
  orderdetail_price number(8) not null, --합계금액
  constraint orderDetail_id_pk  primary key(orderdetail_order_code, orderdetail_book_code)
)

drop SEQUENCE cart_sequence;
create SEQUENCE cart_sequence
  START WITH 1
  INCREMENT BY 1 MAXVALUE 99999999 CYCLE;


drop table cart;
create table cart(
  cart_code varchar2(8) not null constraint cart_id_pk primary key, --장바구니 코드(순환 시퀀스)
  cart_customer_code varchar2(20) not null  constraint cart_id_fk1 references customer(customer_code), -- 사용자id
  cart_book_code varchar2(15) not null constraint cart_id_fk2 references book(book_code), --도서코드
  cart_qty number(4) not null, --수량 (최대 구매수: 9999개)
  cart_price number(8) not null --합계금액 (최대 구매 금액 : 99,999,999원)
);

drop table payment;
create table payment(
  payment_code varchar2(35) not null constraint payment_id_pk primary key constraint payment_id_fk references bookOrder(order_code), --결제코드(주문코드)
  payment_total_price number(8) not null, --결제금액(최대 결제 금액 : 99,999,999원)
  payment_type varchar2(4) not null, --결제방법 (공통코드)
  payment_date date not null --결제시간 (sysdate)
)

drop table commonCode;
create table commonCode(
  commonCode_common_code varchar2(4) not null constraint commonCode_id_pk primary key, --공통코드
  commonCode_name varchar2(50), --공통코드이름
  commonCode_desc varchar2(100), --공통코드 설명
  commonCode_parent_code varchar2(4), --부모 공통코드
  commonCode_reg_date date not null, --코드 등록일시 (sysdate)
  commonCode_update_date date not null, --코드 수정일시 (sysdate)
  commonCode_used varchar2(1) default 'Y'--코드 사용유무 ('Y' or 'N')
)

insert into commonCode values('01', '성별', '성별구분', null, sysdate, sysdate, 'Y');
insert into commonCode values('02', '결제방법', '카드, 계좌이체등 결제방법 구분', null, sysdate, sysdate, 'Y');
insert into commonCode values('03', '주문상태', '주문의 현재상태를 나타낸다', null, sysdate, sysdate, 'Y');
insert into commonCode values('04', '분야', '도서의 분야를 나타낸다.', null, sysdate, sysdate, 'Y');

insert into commonCode values('0101', '남', '성별 남자', '01', sysdate, sysdate, 'Y');
insert into commonCode values('0102', '여', '성별 여자', '01', sysdate, sysdate, 'Y');

insert into commonCode values('0201', '카드', '카드로 결제', '02', sysdate, sysdate, 'Y');
insert into commonCode values('0202', '계좌이체', '계좌이체로 결제', '02', sysdate, sysdate, 'Y');
insert into commonCode values('0203', '핸드폰결제', '핸드폰으로 결제', '02', sysdate, sysdate, 'Y');
insert into commonCode values('0204', '무통장입금', '무통장입금', '02', sysdate, sysdate, 'Y');

insert into commonCode values('0301', '결제대기중', '주문상태', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0302', '결제완료', '주문상태', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0303', '배송준비중', '주문상태', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0304', '배송중', '주문상태', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0305', '배송완료', '주문상태', '03', sysdate, sysdate, 'Y');
insert into commonCode values('0306', '구매대기중', '주문상태', '03', sysdate, sysdate, 'N');

insert into commonCode values('0401', '프로그래밍', '분야', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0402', '웹', '분야', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0403', '네트워크', '분야', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0404', '데이터베이스', '분야', '04', sysdate, sysdate, 'Y');
insert into commonCode values('0405', '수험서', '분야', '04', sysdate, sysdate, 'Y');

select * from commonCode;

select lpad(' ', level*4)||COMMONCODE_COMMON_CODE, COMMONCODE_NAME, COMMONCODE_DESC, COMMONCODE_USED from commonCode where COMMONCODE_USED='Y'
start with commoncode_parent_code is null
connect by PRIOR COMMONCODE_COMMON_CODE=COMMONCODE_PARENT_CODE;

select * from CUSTOMER;
insert into CUSTOMER values('jang', '0000', '010-3333-4444', '성남판교', '0102', '19970303', 'jang@daum.net', '장발장', '빵', '빵빵빵빵', '빵');
insert into CUSTOMER values('ahn', 'v3', '010-0000-5555', '성남판교역 돌담', '0101', '19570408', 'ahn@daum.net', '갑철수', '백신', '있을수도 있고 없을수도 있고', '슈뢰딩거');
insert into CUSTOMER values('hong', '0000', '010-6383-4140', '경북', '0101', '19511103', 'hong@daum.net', '나이롱맨', '나이롱맨', '종북종북종북종북..', '돼지발정제');

select * from book;
insert into book VALUES('9788968483554', '모던 웹을 위한 JavaScript + jQuery 입문(3판)','윤인성', '한빛미디어', sysdate, 960, 32200, '9788968483554.jpg', '0402', 500);
insert into book VALUES('9788968483561', '나의 첫 파이썬','윤인성', '한빛미디어', sysdate, 664, 30000, '9788968483561.jpg', '0401', 700);
insert into book VALUES('9788968483554', '모던 웹을 위한 JavaScript + jQuery 입문(3판)','윤인성', '한빛미디어', sysdate, 960, 32200, '9788968483554.jpg', '0402', 500);
insert into book VALUES('9788968483554', '모던 웹을 위한 JavaScript + jQuery 입문(3판)','윤인성', '한빛미디어', sysdate, 960, 32200, '9788968483554.jpg', '0402', 500);

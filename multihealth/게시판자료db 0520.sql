use healthdb;

create table review_table(
r_num int not null auto_increment,
m_num int not null,
prod_num int not null,
r_image_name varchar(150) not null,
r_point int not null,
r_content varchar(500) not null,
r_date date not null,
primary key (r_num),
foreign key (m_num) references member_table (m_num) on update cascade on delete cascade,
foreign key (prod_num) references product_table (prod_num) on update cascade on delete cascade
);

create table announcement_table(
a_num int not null auto_increment,
a_title varchar(1000) not null,
a_content varchar(2000) not null,
a_date datetime not null,
a_count int not null,
primary key (a_num)
);


insert into announcement_table values (null, "2020년 설 연휴 고객센터 휴무 일정 안내", "안녕하세요. 고객님
항상 멀티헬스를 사랑해 주시는 고객님들께 감사의 말씀 드리며,
민족 대 명절 설을 맞이하여 경자년 새해에는 새로운 소망과
행복을 움켜쥐는 멋진 한해 되시길 기원합니다.

설 연휴 멀티헬스 고객센터 운영 안내드립니다.

* 고객센터 문의 채널별 운영 안내
□ 전화상담 : 설 연휴 미운영 ( 2020년 1월 28일 (화)부터 정상 운영 )
□ 채팅상담 / 홈페이지 게시판 문의 : 2020년 1월 25일(토) ~ 1월 26일(일) 미운영

새해 복 많이 받으세요.
감사합니다", now(), 0);

insert into announcement_table values (null, "이용약관 개정의 건", "이용약관 개정 안내
2019년 5월 1일부터 개정된 이용약관이 적용됩니다.
개정 사유 : 이용자의 저작권 등 정책 변경
기타 자세한 사항은 개정약관을 확인하시기 바랍니다.

감사합니다.", now(), 0);

insert into announcement_table values (null, "2020년 설 연휴 출고 일정 안내", "안녕하세요,
항상 저희 멀티헬스를 사랑해 주시는 고객님들께 감사드리며 
경자년 새해에는 웃음 가득한 한 해 되시길 기원합니다.

*2020-01-21(화) 14시 이전 주문건 : 2020-01-24(금) 까지 출고
*2020-01-21(화) 14시 이후 주문건 : 2020-01-28(화) 부터 순차 출고

설 연휴 이후에는 택배물량의 증가로 평소보다 배송이 지연됩니다.
배송은 우선 주문부터 순차적으로 발송 되고, 주문하신 상품이
신속하게 배송될 수 있도록 최선의 노력을 다하겠습니다.

즐거운 명절 보내세요.
감사합니다.", now(), 0);

insert into announcement_table values (null, "무료배송 기준 변경 안내", "언제나 멀티헬스를 이용해주시는 고객님께 감사드리며
고객님께 멀티헬스가 제공하는 많은 혜택 중
아래와 같이 무료배송 혜택이 변경됨을 알려드립니다.

무료배송 기준
기존 : 50,000원 이상 구매
변경 : 70,000원 이상 구매

변경일자: 2020년 8월 17일

고객님께서는 변경된 무료배송 기준을 참고하여 구매하여 주시기를 부탁드립니다.

고객님들의 많은 양해 부탁드리며
보다 만족도 높은 제품과 서비스를 위해 최선을 다하겠습니다.
항상 멀티헬스를 이용해주셔서 감사합니다.", now(), 0);

insert into announcement_table values (null, "배송비 변경 안내", "안녕하세요 고객님! 멀티헬스입니다.
항상 멀티헬스를 사랑해주시는 고객님들께 진심으로 감사의 말씀 드리며,
고객님께 더 나은 서비스를 제공하기 위해 아르르 배송료 기준 금액이
아래와 같이 변경 될 예정임을 사전에 안내 드립니다.

멀티헬스 배송료 기준 금액 변경
일정 | 2020년 11월2일(월요일) 오전 11시 이후
대상 | 멀티헬스 상품 전체
내용 | 멀티헬스 배송료 기준 금액 변경

기존 2,500원  > 변경 3,000원

멀티헬스는 언제나 고객님들의 만족을 최우선으로 생각하며,
더욱 친절하고 보다 편리한 쇼핑 서비스를 위해 최선을 다하겠습니다.
감사합니다.", now(), 0);

insert into announcement_table values (null, "2021년 설연휴 배송 안내", "2월 8일 (월) 14시 이전 주문 건은 8일 당일 발송되며,
2월 8일 (월) 14시 이후 주문 건은 15일부터 순차적으로 발송됩니다.
배송 일정은 택배사 사정에 따라 지연될 수 있습니다.
주문 시 참고 바랍니다.", now(), 0);

insert into announcement_table values (null, "반품/교환 서비스 한시적 연장 안내", "안녕하세요, 멀티헬스 입니다.

상담사 연결이 지연되는 점 깊은 양해와 사과 드립니다.

고객님의 반품/교환 불편을 덜어드리기 위해 한시적으로 수령 후 7일이 아닌 14일 이내 반품/교환 서비스를 연장해 드립니다.

감사합니다. ", now(), 0);

insert into announcement_table values (null, "8월 연휴기간 배송 안내", "8월 14일 (토) 택배 없는 날, 8월 16일 (월) 광복절 
대체 휴무일로 인해 8월 13일 금요일 이후 주문 건에 대해서는 
8월 18일 수요일부터 순차 배송 예정이오니 
양해 부탁드립니다. 감사합니다.", now(), 0);


SELECT * FROM announcement_table;

create table donation_member(
	member_id varchar2(10char) primary key,
	member_pw varchar2(20char) not null,
	member_email varchar2(40char) not null
);

select * from DONATION_MEMBER;

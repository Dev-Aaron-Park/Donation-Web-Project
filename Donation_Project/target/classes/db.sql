create table donation_member(
	member_id varchar2(10 char) primary key,
	member_pw varchar2(20 char) not null,
	member_email varchar2(40 char) not null,
	member_photo varchar2(100 char) not null
);

select * from DONATION_MEMBER;

drop table donation_member;


-- 작성 중 --
create table donation_board(
	board_no number(4) primary key,
	board_title varchar2(40 char),
	board_content varchar2() 
);
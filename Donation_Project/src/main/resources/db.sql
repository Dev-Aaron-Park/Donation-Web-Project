create table donation_member(
	member_id varchar2(10 char) primary key,
	member_pw varchar2(20 char) not null,
	member_email varchar2(40 char) not null,
	member_photo varchar2(100 char) not null,
	member_permissions number(1) not null
);

select * from DONATION_MEMBER;

drop table donation_member;

create table donation_board(
	board_no number(4) primary key,
	board_creator varchar2(10 char) not null,
	board_business_name varchar2(40 char) not null,
	board_business_license_no varchar2(40 char) not null,
	board_donation_amount number(23) not null,
	board_address varchar2(100 char) not null,
	board_content varchar2(1400 char) not null, 
	board_photo_1 varchar2(400 char),
	board_photo_2 varchar2(400 char),
	board_photo_3 varchar2(400 char),
	board_loi varchar2(400 char),
	board_approval number(1) not null,
	constraint board_creator
		foreign key(board_creator) references donation_member(member_id)
		on delete cascade
);

create sequence donation_board_seq;

select * from donation_board;

drop table donation_board;
drop sequence donation_board_seq;

update DONATION_MEMBER set member_permissions = 9 where member_id = 'test';


------------------ TEST ---------------------
select * from donation_board where board_approval = 1;

update DONATION_BOARD set board_approval=0;

select * from donation_member where member_permissions = 0;

update DONATION_MEMBER set member_permissions = 8 where member_id = 'test2';
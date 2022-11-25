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

create table donation_details(
	detail_no number(6) primary key,
	detail_member varchar(10 char) not null,
	detail_post number(4) not null,
	detail_amount number(23) not null,
	constraint detail_member
		foreign key(detail_member) references donation_member(member_id)
		on delete cascade
);

create sequence donation_details_seq;

select * from donation_details;

create table donation_comment(
	comment_no number(6) primary key,
	comment_board_no number(4) not null,
	comment_member varchar2(10 char) not null,
	comment_date date not null,
	comment_text varchar2(150) not null,
	constraint comment_board_no
		foreign key(comment_board_no) references donation_board(board_no)
		on delete cascade
);

drop table donation_comment;

create sequence donation_comment_seq;


------------------ TEST ---------------------
update DONATION_MEMBER set member_permissions = 9 where member_id = 'test';

insert into donation_board
values(donation_board_seq.nextval, 'test',
'test18', 'test18',
148000, 'test18', 'test18',
'1.jpg', '2.jpg', '3.jpg',
'4.jpg', 0);

select * from donation_board where board_approval = 1;

update DONATION_BOARD set board_approval=0;
update donation_board set board_approval=0 where board_business_name = 'test18';

select * from donation_member where member_permissions = 0;

update DONATION_MEMBER set member_permissions = 8 where member_id = 'test2';

select *
from (
	select rownum as rn, spb_no, spb_writer, spb_title, spb_content, spb_date, spb_color, spm_photo
	from (
		select spb_no, spb_writer, spb_title, spb_content, spb_date, spb_color, spm_photo
		from smvc_project_board, SMVC_PROJECT_MEMBER 
		where spm_id = spb_writer and (spb_writer like '%'||#{keyword}||'%' or spb_title like '%'||#{keyword}||'%' or spb_content like '%'||#{keyword}||'%')
		order by spb_date desc
	) 
) where rn &gt;=#{start} and rn &lt;=#{end}

select *
from (
	select rownum as rn, board_no, board_creator, board_business_name, board_business_license_no, board_donation_amount,
		board_address, board_content, board_photo_1, board_photo_2, board_photo_3, board_loi, board_approval
	from (
		select board_no, board_creator, board_business_name, board_business_license_no, board_donation_amount,
			board_address, board_content, board_photo_1, board_photo_2, board_photo_3, board_loi, board_approval
		from donation_board where board_approval = 1
	)
) where rn >=1 and rn <=10;

delete from donation_board where board_business_name = 'test2';

create table springboard(
 idx number not null, 
 title varchar2(100) not null, 
 content varchar2(2000) not null, 
 writer varchar2(20) not null, 
 count number default 0, 
 indate date default sysdate, 
 constraint pk_sb primary key(idx)
 ); 
 
create sequence sboard_seq
start with 1
increment by 1
maxvalue 100
cycle
nocache;

insert into springboard(idx,title,content,writer) values (sboard_seq.nextval, '제목1', '내용1', '관리자');
insert into springboard(idx,title,content,writer) values (sboard_seq.nextval, '제목2', '내용2', '강예진');

select * from springboard; 

select * from springboard; 
#boramHospital
# drop database community;

create database community;
use community;

#회원(환자)
create table member (
num					int 			unique 		auto_increment,
uId 				char(30) 											,
uPw					char(30) 	not null								,
uName 				char(30) 	not null								,
uEmail 				char(100) 	not null								,
gender 				char(2) 											,
uBirthday 			char(10) 											,
uZipcode 			char(8) 											,
uAddr				char(100) 											,
uHobby				char(10) 											,
uJob				char(30) 											,
joinTM 				datetime											,
constraint 	primary key(uId)
);

desc member;
select * from member order by num desc limit 0, 10;

select * from member;

insert into member (uId, uPw, uName, uEmail)  
values ('you', '1234', '유재석', 'you@naver.com' );

insert into member (uId, uPw, uName, uEmail)   
values ('lee', '1234', '이미주', 'lee@daum.net' );

select num, uId, uPw, uName 
from member order by num desc limit 0, 10;

select * from member order by num desc limit 0, 10;

delete from member where uID='aaa';

#회원가입용 우편번호 테이블
create table tblZipcode(
zipcode 			char(7),
area1 				char(10),
area2 				char(20),
area3 				char(40),
area4 				char(20)
);

desc tblZipcode;
select * from tblZipcode limit 0, 10;

#게시판 테이블
create table tblBoard (
    num          int                    auto_increment,
    uId 		char(30) 			not null,				
    uName		char(30)			not null,
    subject     char(50)			not null,
    content		text				null		,    
    pos			int					not null,
    ref			int					not null,
    depth		int					not null,
    regTM		datetime			not null,
    ip			char(15)			null,    
    readCnt		int				not null,
    fileName	char(50)			null,
    fileSize		int					null,
    constraint		primary key(num)
);

alter table tblboard
add column checkDel boolean default false;

insert tblBoard(uId,uName,subject,content,fileName)
values("tester","김연아","안녕","안녕하세요");

# oriFilename, sysFilename
# 원본파일명         서버에 업로드된 파일명

desc tblBoard;
select * from tblBoard order by num desc limit 0, 10;

select num, uId, uName, subject,
ref, pos, depth from tblBoard 
order by num desc;

insert into tblBoard(uId, uName, subject, content, ref, pos, depth, regTM, ip, readCnt, fileName, fileSize)
values ('ccc', 'ccc', '하이', '하이루', 0, 0, 0, now(), '123', 0, 'file', 123);

select num, uId, uName, subject,
ref, pos, depth from tblBoard 
order by num desc;

select * from tblBoard
order by num desc;

select num, uId, uName, subject,
ref, pos, depth from tblBoard 
where ref = 92
order by ref desc, depth, pos;

update member 
set uPw='123'
where uId = 'tester';

select * from member;

select * from tblBoard;

select count(*) from tblBoard
where subject like '%ㄷㄷ%'
limit 0,5;

select * from tblBoard
where subject like '%안녕%'
order by ref desc, pos asc
LIMIT 1 ,5;

create table test (
num     int ,
txt		char(100)
);

desc test;

insert into test values (1, '&lt;');
select * from test;

select * from tblboard
order by num desc;

desc member;
select * from member;

alter table member
add column uAuth int;

select uAuth from member where uId='tester';

select * from member order by num desc;

#관리자 아이디 생성
insert member(uId, uPw, uName, uEmail, uAuth)
values('admin','1234','관리자','admin@naver.com',1);


#진료과 테이블
create table department(
deptno   int   unique   auto_increment,
deptName   char(30)   not null
);

insert department(deptName) values('흉부외과');
insert department(deptName) values('산부인과');
insert department(deptName) values('신경외과');
insert department(deptName) values('정신의학과');
insert department(deptName) values('소아청소년과');
insert department(deptName) values('재활의학과');
insert department(deptName) values('정형외과');

select * from department;

#의사테이블
create table doctor(
num   int    unique    auto_increment,
uId    char(30)    not null   ,
uPw    char(30)    not null   ,
uName    char(30)    not null   ,
uEmail    char(100)    not null   ,
position   char(30) not null,
deptno   int	not null,
joinTM   datetime,
constraint    primary key(uId),
foreign key (deptno) references department (deptno)
);

insert doctor(uId, uPw, uName, uEmail, position, deptno,joinTM)
values('doctor','123','김연아','yuna@naver.com','진료과장',1,now());

insert doctor(uId, uPw, uName, uEmail, position, deptno,joinTM)
values('doc1','123','김동글','one@naver.com','레지던트',2,now());

insert doctor(uId, uPw, uName, uEmail, position, deptno,joinTM)
values('doc2','123','홍길동','gil@naver.com','인턴',3,now());

insert doctor(uId, uPw, uName, uEmail, position, deptno,joinTM)
values('doc3','123','김지현','ji@gmail.com','이사장',4,now());

insert doctor(uId, uPw, uName, uEmail, position, deptno,joinTM)
values('doc4','123','정영상','dis@naver.com','진료과장',5,now());

insert doctor(uId, uPw, uName, uEmail, position, deptno,joinTM)
values('doc5','123','이동글','onetwo@naver.com','레지던트',6,now());

insert doctor(uId, uPw, uName, uEmail, position, deptno,joinTM)
values('doc6','123','김유나','onetwo2@naver.com','진료과장',7,now());

#delete from doctor where deptno=1;

select * from doctor
order by num;
#drop table doctor;
#drop table department;
#drop table reservation;
desc doctor;


#진료예약 테이블
create table reservation(
no	int	unique	auto_increment primary key,
memId	char(30) not null,
foreign key (memId) references member (uId),
docId	char(30) not null,
foreign key (docId) references doctor(uId),
reservation	char(255)	not null,
regdate	datetime,
docCheck boolean not null
);

select * from reservation;
commit;

select count(*) from tblBoard;

select * from tblBoard order by num desc limit 0, 10;

select * from tblBoard order by num desc limit 0, 5;

#drop table tblBoard;

select * from member order by num desc limit 0, 10;
	# member 테이블 : 회원목록 테이블
select * from tblBoard order by num desc limit 0, 10;
	# tblBoard 테이블 : 가입한 회원이 작성한 자유게시판 테이블
select * from tblzipcode limit 0, 10;
	# tblzipcode 테이블 : 회원 가입에서 사용되는 우편번호 테이블
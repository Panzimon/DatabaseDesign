create database dbdesign;

create table hospital(
hno int(4) primary key,
name varchar(20) not null,
address varchar(200) not null,
tel int(20) not null,
zipcode int(10) not null
);

set names gbk;
alter table hospital modify name varchar(20) not null character set gbk not null;
alter table hospital modify address varchar(200) character set gbk null;

insert into hospital(hno,name,address,tel,zipcode) values (1,'广工校医院','龙洞',87081234,510520);
insert into hospital(hno,name,address,tel,zipcode) values (2,'中山医','中山一路',83812345,510120);
alter table hospital drop primary key;
alter table hospital add primary key(hno,name);

--------------------------------------------------------------------------------------------------------------

create table dept(
deptno int(4) not null primary key,
deptname varchar(20) not null,
deptloc varchar(100) not null,
hno int(4) not null,
name varchar(20) not null
);

alter table dept modify name varchar(20) character set gbk not null;
alter table dept modify deptloc varchar(100) character set gbk not null;
alter table dept modify deptname varchar(20) character set gbk not null;
alter table dept add constraint foreign key (hno,name) references hospital (hno,name);
alter table dept add primary key(deptno,deptname);

insert into dept(deptno,deptname,deptloc,hno,name) values (1,'儿童科','二楼',1,'广工校医院');
insert into dept(deptno,deptname,deptloc,hno,name) values (2,'妇科','二楼',1,'广工校医院');
insert into dept(deptno,deptname,deptloc,hno,name) values (3,'皮肤科','三楼',1,'广工校医院');
insert into dept(deptno,deptname,deptloc,hno,name) values (4,'外科','三楼',1,'广工校医院');
insert into dept(deptno,deptname,deptloc,hno,name) values (5,'内科','二楼',1,'广工校医院');
insert into dept(deptno,deptname,deptloc,hno,name) values (6,'内科','一楼',2,'中山医');

--------------------------------------------------------------------------------------------------------------

create table doctor(
docno int(4) not null,
deptno int(4) not null,
name varchar(20) not null,
deptname varchar(40) not null,
worktime varchar(20) not null
);

---外键只能references primary key

alter table doctor modify deptname varchar(20) character set gbk not null;
alter table doctor modify name varchar(20) character set gbk not null;
alter table doctor modify worktime varchar(20) character set gbk not null;
alter table doctor add constraint foreign key (deptno,deptname) references dept(deptno,deptname) on delete cascade on update cascade;
alter table doctor add primary key (docno,name);

insert into doctor(docno,deptno,name,deptname,worktime) values (1,4,'区家壕','外科','全天');
insert into doctor(docno,deptno,name,deptname,worktime) values (2,5,'施志标','内科','晚上');

--------------------------------------------------------------------------------------------------------------

create table room(
rno int(4) primary key,
loc varchar(20) not null,
aval varchar(10) not null
);

alter table room modify loc varchar(20) character set gbk not null;
alter table room modify aval varchar(10) character set gbk not null;
alter table room add hno int(4) not null;
alter table room add name varchar(20) not null;
alter table room modify name varchar(20) character set gbk not null;
alter table room drop primary key;
 delete from room;
alter table room add primary key(hno,name,rno);
alter table room add constraint foreign key (hno,name) references hospital (hno,name);

insert into room(rno,loc,aval,hno,name) values (833,'D区','否',1,'广工校医院');
insert into room(rno,loc,aval,hno,name) values (801,'B区','是',2,'中山医');
insert into room(rno,loc,aval,hno,name) values (205,'D区','是',1,'广工校医院');
insert into room(rno,loc,aval,hno,name) values (303,'B区','是',2,'中山医');
insert into room(rno,loc,aval,hno,name) values (408,'D区','否',1,'广工校医院');
insert into room(rno,loc,aval,hno,name) values (405,'B区','否',2,'中山医');
insert into room(rno,loc,aval,hno,name) values (624,'D区','否',1,'广工校医院');
insert into room(rno,loc,aval,hno,name) values (412,'B区','是',2,'中山医');
insert into room(rno,loc,aval,hno,name) values (725,'D区','是',1,'广工校医院');
insert into room(rno,loc,aval,hno,name) values (630,'B区','否',2,'中山医');
insert into room(rno,loc,aval,hno,name) values (333,'D区','否',1,'广工校医院');
insert into room(rno,loc,aval,hno,name) values (909,'B区','是',2,'中山医');

--------------------------------------------------------------------------------------------------------------

create table patient (
pno int(4) primary key,
pname varchar(10) not null,
age int(4),
lastdate date
);

alter table patient modify pname varchar(10) character set gbk not null;

insert into patient(pno,pname,age,lastdate) values (1,'宋晓',20,'2016-12-29');
insert into patient(pno,pname,age,lastdate) values (2,'苏涛',34,'2016-12-30');

create table product(
pid int(4) primary key,
name varchar(50) not null,
note text,
price float(10,2) not null ,
amount int(5)
);

alter table product modify name varchar(50) character set gbk not null;
alter table product modify note text character set gbk;

insert into product(pid,name,note,price,amount) values (1596,'维C银翘片','专治流行性感冒，头痛，发烧，咽喉痛',13.5,150);
insert into product(pid,name,note,price,amount) values (5738,'健胃消食片','别再让你的胃难受了~',8.35,86);

--------------------------------------------------------------------------------------------------------------

create table member(
	account varchar(50) primary key,
	password varchar(50) not null,
	nickname varchar(100) not null,
	signdate date 
);

alter table member modify nickname varchar(100) character set gbk not null;
alter table member add safequestion text ;
alter table member add safestring text;
alter table member modify safequestion text character set gbk ;
alter table member modify safestring text character set gbk ;

--------------------------------------------------------------------------------------------------------------

set character_set_client =utf8; 

set character_set_connection =utf8; 

set character_set_database =utf8; 

set character_set_results =utf8; 

set character_set_server =utf8; 

set collation_server = utf8_general_ci;

set collation_database = utf8_general_ci;

set collation_connection =utf8_general_ci;

--------------------------------------------------------------------------------------------------------------

create table booking(
pno int(4) not null,
pname varchar(10) not null,
age int(4) not null,
deptno int(4) not null,
docno int(4) not null,
date date not null
);

alter table booking modify pname varchar(10) character set gbk not null;

--------------------------------------------------------------------------------------------------------------

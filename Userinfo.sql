CREATE TABLE "USERINFO"
(
      "NICKNAME" VARCHAR2(20 BYTE) NOT NULL 
    , "USERNUM" NUMBER NOT NULL 
    , "USERID" VARCHAR2(20 BYTE) NOT NULL 
    , "PW" VARCHAR2(20 BYTE) NOT NULL 
    , "EMAIL" VARCHAR2(20 BYTE) NOT NULL 
    , "BIRTH" DATE NOT NULL 
    , "JDATE" DATE NOT NULL 
    , "BOOKMARK" NUMBER 
    , "POINT" NUMBER NOT NULL 
    , CONSTRAINT "TABLE1_PK" PRIMARY KEY 
);

create SEQUENCE usernum_seq;

insert into userinfo(nickname,usernum,userid,pw,email,birth,jdate,bookmark,point) values('admin1',usernum_seq.nextval,'admin1','1111','tj1@gmail.com','1900-01-01','2024-06-19','','0');
insert into userinfo(nickname,usernum,userid,pw,email,birth,jdate,bookmark,point) values('admin2',usernum_seq.nextval,'admin2','2222','tj2@gmail.com','1900-01-02','2024-06-19','','0');
insert into userinfo(nickname,usernum,userid,pw,email,birth,jdate,bookmark,point) values('admin3',usernum_seq.nextval,'admin3','3333','tj3@gmail.com','1900-01-03','2024-06-19','','0');
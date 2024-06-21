--DELETE FROM trend;
--DROP SEQUENCE trend_tnum_seq;
--CREATE SEQUENCE trend_tnum_seq;

insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트1번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트2번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트3번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트1번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트2번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트3번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트1번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트2번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
insert into trend (title, maintext, tag, tnum, writer, usernum) 
VALUES ('테스트3번','테스트 데이터입니다', 'trend', TREND_TNUM_SEQ.nextval, '다미', 1);
select * from trend order by tnum desc;







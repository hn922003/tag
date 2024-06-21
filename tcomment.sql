--DELETE FROM tcomment;
--DROP SEQUENCE tcomment_cnum_seq;
--CREATE SEQUENCE tcomment_cnum_seq;

insert into tcomment (nickname, cnum, usernum, memo, tnum) 
VALUES ('다미', TCOMMENT_CNUM_SEQ.nextval, 1, '다미다미마다미다미다.', 8);
insert into tcomment (nickname, cnum, usernum, memo, tnum) 
VALUES ('다미', TCOMMENT_CNUM_SEQ.nextval, 1, '담담다맏마담담다마담', 7);
insert into tcomment (nickname, cnum, usernum, memo, tnum) 
VALUES ('화니', TCOMMENT_CNUM_SEQ.nextval, 2, '화노나호나환hwanhwan', 9);
insert into tcomment (nickname, cnum, usernum, memo, tnum) 
VALUES ('화니', TCOMMENT_CNUM_SEQ.nextval, 2, '하니하니하니화니', 6);
insert into tcomment (nickname, cnum, usernum, memo, tnum)
VALUES ('비니', TCOMMENT_CNUM_SEQ.nextval, 2, '바너비니비니빈이', 4);
insert into tcomment (nickname, cnum, usernum, memo, tnum) 
VALUES ('숨숨', TCOMMENT_CNUM_SEQ.nextval, 2, '숨숨숨숨~~~', 5);
insert into tcomment (nickname, cnum, usernum, memo, tnum) 
VALUES ('숨숨', TCOMMENT_CNUM_SEQ.nextval, 2, '상세구현수미파솔라도 숨~~~', 3);

select * from tcomment order by cnum desc;
select tnum, count(tnum) from tcomment group by tnum;
select * from usertable order by usernum desc;
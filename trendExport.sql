--------------------------------------------------------
--  파일이 생성됨 - 목요일-7월-04-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TREND
--------------------------------------------------------

  CREATE TABLE "SUMI"."TREND" 
   (	"USERNUM" NUMBER, 
	"TNUM" NUMBER, 
	"LNUM" NUMBER DEFAULT 0, 
	"TITLE" VARCHAR2(200 BYTE), 
	"MAINTEXT" VARCHAR2(200 BYTE), 
	"WRITER" VARCHAR2(20 BYTE), 
	"TDATE" TIMESTAMP (6), 
	"TAG" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SUMI.TREND
SET DEFINE OFF;
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,3,20,'미래의 농업, 스마트 농업과 도시 농업의 발전','미래의 농업, 스마트 농업과 도시 농업의 발전 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test3#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,4,18,'공유 경제의 현실, 공유 차량과 공유 오피스의 미래','공유 경제의 현실, 공유 차량과 공유 오피스의 미래 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test4#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,5,28,'건축의 미래, 3D 프린팅과 지속 가능한 건축 자재','건축의 미래, 3D 프린팅과 지속 가능한 건축 자재 maintext','거니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test5#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,6,34,'팬덤 문화의 진화, 커뮤니티와 소비의 새로운 형태','팬덤 문화의 진화, 커뮤니티와 소비의 새로운 형태 maintext','비니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test6#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,7,13,'미래의 교육, 가상 교실과 AI 교육 도구의 도입','미래의 교육, 가상 교실과 AI 교육 도구의 도입 maintext','숨이',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test7#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,8,2,'기후 변화와 도시 설계, 미래의 기후 회복력 있는 도시','기후 변화와 도시 설계, 미래의 기후 회복력 있는 도시 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test8#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,9,0,'웰니스 산업의 부상, 건강과 행복을 추구하는 새로운 트렌드','웰니스 산업의 부상, 건강과 행복을 추구하는 새로운 트렌드 maintext','다미',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test9#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,10,8,'디지털 노마드의 시대, 전 세계를 오피스로 삼는 사람들','디지털 노마드의 시대, 전 세계를 오피스로 삼는 사람들 maintext','거니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test10#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,11,19,'음식의 과학, 분자 요리와 새로운 맛의 탐구','음식의 과학, 분자 요리와 새로운 맛의 탐구 maintext','비니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test11#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,12,25,'크리에이터 경제, 개인 콘텐츠 제작자의 경제적 가능성','크리에이터 경제, 개인 콘텐츠 제작자의 경제적 가능성 maintext','숨이',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test12#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,13,39,'가상 인플루언서의 시대, 현실을 뛰어넘는 디지털 셀러브리티','가상 인플루언서의 시대, 현실을 뛰어넘는 디지털 셀러브리티 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test13#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,14,29,'문화적 혼종성, 다양한 문화의 융합과 새로운 트렌드','문화적 혼종성, 다양한 문화의 융합과 새로운 트렌드 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test14#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,15,78,'글로벌 팬데믹 이후의 여행, 안전과 모험의 균형','글로벌 팬데믹 이후의 여행, 안전과 모험의 균형 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test15#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,16,87,'서브스크립션 경제의 성장, 모든 것을 구독하는 시대','서브스크립션 경제의 성장, 모든 것을 구독하는 시대 maintext','다미',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test16#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,17,58,'저탄소 생활, 일상 속 탄소 발자국 줄이기','저탄소 생활, 일상 속 탄소 발자국 줄이기 maintext','거니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test17#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,18,38,'유전자 맞춤형 다이어트, 개인화된 영양 관리의 가능성','유전자 맞춤형 다이어트, 개인화된 영양 관리의 가능성 maintext','비니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test18#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,19,48,'미니멀리즘 vs 맥시멀리즘, 라이프스타일의 대격돌','미니멀리즘 vs 맥시멀리즘, 라이프스타일의 대격돌 maintext','숨이',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test19#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,20,29,'수면 경제, 잠을 팔고 사는 시대의 도래','수면 경제, 잠을 팔고 사는 시대의 도래 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test20#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,21,39,'인공지능 예술, AI가 창작하는 음악과 미술의 세계','인공지능 예술, AI가 창작하는 음악과 미술의 세계 maintext','비니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test21#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,22,19,'차세대 재생 에너지, 태양광과 풍력의 혁신','차세대 재생 에너지, 태양광과 풍력의 혁신 maintext','숨이',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test22#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,23,2,'고령화 사회의 도전, 실버 산업과 노인 친화적 기술','고령화 사회의 도전, 실버 산업과 노인 친화적 기술 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test23#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,24,0,'전통 음식의 현대적 재해석, 뉴트로 요리 트렌드','전통 음식의 현대적 재해석, 뉴트로 요리 트렌드 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test24#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,25,0,'디지털 프라이버시, 개인정보 보호와 빅데이터의 갈등','디지털 프라이버시, 개인정보 보호와 빅데이터의 갈등 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test25#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,1,37,'기후 인식 비교, 90년대와 현재의 환경 운동 변화','기후 인식 비교, 90년대와 현재의 환경 운동 변화 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test1#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,2,28,'게임화된 삶, 일상에 게임 요소를 도입하는 게이미피케이션','게임화된 삶, 일상에 게임 요소를 도입하는 게이미피케이션 maintext','다미',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test2#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,26,8,'로봇과 인간의 공존, 가정용 로봇의 발전과 윤리적 논쟁','로봇과 인간의 공존, 가정용 로봇의 발전과 윤리적 논쟁 maintext','다미',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test26#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,27,10,'미래 도시의 모습, 스마트 시티와 지속 가능한 인프라','미래 도시의 모습, 스마트 시티와 지속 가능한 인프라 maintext','거니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test27#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,28,28,'비건 라이프스타일, 식습관을 넘어서 생활 전반으로','비건 라이프스타일, 식습관을 넘어서 생활 전반으로 maintext','비니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test28#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,29,0,'플랜테리어 열풍, 식물로 꾸미는 실내 공간의 인기','플랜테리어 열풍, 식물로 꾸미는 실내 공간의 인기 maintext','숨이',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test29#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,30,3,'디지털 뱅킹의 확산, 전통 은행과의 경쟁','test디지털 뱅킹의 확산, 전통 은행과의 경쟁30 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test30#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,31,24,'글로벌화의 역설, 로컬리즘의 재부상','글로벌화의 역설, 로컬리즘의 재부상 maintext','비니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test31#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,32,18,'지속 가능한 여행, 에코 투어리즘의 매력','지속 가능한 여행, 에코 투어리즘의 매력 maintext','숨이',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test32#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,33,2,'제로 웨이스트 운동, 생활 속 쓰레기 줄이기 실천','제로 웨이스트 운동, 생활 속 쓰레기 줄이기 실천 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test33#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,34,0,'자율주행차의 도전과 과제, 안전과 법규의 균형','자율주행차의 도전과 과제, 안전과 법규의 균형 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test34#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,35,0,'젠더 이퀄리티의 진전, 기업 내 성평등의 현주소','젠더 이퀄리티의 진전, 기업 내 성평등의 현주소 maintext','화니',to_timestamp('24/07/04 01:07:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test35#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,36,34,'현대인의 스트레스 관리, 명상 앱과 디지털 디톡스','현대인의 스트레스 관리, 명상 앱과 디지털 디톡스 maintext','다미',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test36#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,37,25,'미래의 식량, 배양육과 곤충식의 가능성','미래의 식량, 배양육과 곤충식의 가능성 maintext','거니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test37#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,38,43,'크라우드펀딩의 힘, 아이디어가 현실이 되는 과정','크라우드펀딩의 힘, 아이디어가 현실이 되는 과정 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test38#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,39,24,'맞춤형 교육의 미래, AI 튜터와 온라인 학습 플랫폼','맞춤형 교육의 미래, AI 튜터와 온라인 학습 플랫폼 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test39#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,40,0,'우주여행의 상용화, 일반인 우주 관광의 시대','우주여행의 상용화, 일반인 우주 관광의 시대 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test40#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,41,0,'라이브 커머스의 성장, 실시간 쇼핑의 매력','라이브 커머스의 성장, 실시간 쇼핑의 매력 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test41#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,42,23,'디지털 아트의 부상, NFT와 예술의 새로운 형태','디지털 아트의 부상, NFT와 예술의 새로운 형태 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test42#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,43,12,'패션 리세일 시장의 급성장, 중고 명품의 인식 변화','패션 리세일 시장의 급성장, 중고 명품의 인식 변화 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test43#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,44,18,'AR과 VR의 시대, 가상 현실의 실제 응용 사례','AR과 VR의 시대, 가상 현실의 실제 응용 사례 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test44#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,45,16,'전기차 vs 수소차, 친환경 자동차의 승자는?','전기차 vs 수소차, 친환경 자동차의 승자는? maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test45#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,46,0,'모바일 결제 혁명, 현금 없는 사회의 도래','모바일 결제 혁명, 현금 없는 사회의 도래 maintext','다미',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test46#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,47,28,'홈 오피스의 급부상, 원격 근무의 장단점 분석','홈 오피스의 급부상, 원격 근무의 장단점 분석 maintext','거니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test47#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,48,30,'스트리밍 전쟁, 넷플릭스와 디즈니 플러스의 콘텐츠 전쟁','스트리밍 전쟁, 넷플릭스와 디즈니 플러스의 콘텐츠 전쟁 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test48#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,49,38,'이모티콘의 진화, 간단한 표정에서 애니메이션까지','이모티콘의 진화, 간단한 표정에서 애니메이션까지 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test49#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,50,30,'음악 스트리밍 서비스의 승자는? 스포티파이와 애플 뮤직의 대격돌','음악 스트리밍 서비스의 승자는? 스포티파이와 애플 뮤직의 대격돌 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test50#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,51,40,'패스트푸드 vs 슬로우푸드, 시대를 초월한 맛의 경쟁"','패스트푸드 vs 슬로우푸드, 시대를 초월한 맛의 경쟁" maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test51#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,52,42,'스킨케어 루틴 비교, 과거의 단순함과 현대의 복잡함','스킨케어 루틴 비교, 과거의 단순함과 현대의 복잡함 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test52#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,53,0,'스포츠 팬 문화, 과거의 열광과 현재의 참여 방식 비교','스포츠 팬 문화, 과거의 열광과 현재의 참여 방식 비교 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test53#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,54,13,'소셜 미디어 대격변, 싸이월드부터 인스타그램까지의 변화','소셜 미디어 대격변, 싸이월드부터 인스타그램까지의 변화 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test54#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,55,0,'영화 속 히어로의 변천사: 90년대와 현대의 슈퍼히어로 영화 비교','영화 속 히어로의 변천사: 90년대와 현대의 슈퍼히어로 영화 비교 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test55#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,56,20,'뉴스 소비 패턴의 변화: 신문에서 뉴스 앱으로','뉴스 소비 패턴의 변화: 신문에서 뉴스 앱으로 maintext','다미',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test56#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,57,23,'광고 카피의 혁신, 90년대 레트로와 현대의 디지털 감성 비교','광고 카피의 혁신, 90년대 레트로와 현대의 디지털 감성 비교 maintext','거니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test57#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,58,14,'직장 문화의 변화: 90년대 오피스 라이프 vs 현재의 원격 근무','직장 문화의 변화: 90년대 오피스 라이프 vs 현재의 원격 근무 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test58#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,59,0,'학교 생활의 변화: 90년대와 현재의 학교 환경 비교','학교 생활의 변화: 90년대와 현재의 학교 환경 비교 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test59#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,60,39,'영화 관람 방식의 변화: 비디오 대여점에서 스트리밍 서비스로','영화 관람 방식의 변화: 비디오 대여점에서 스트리밍 서비스로 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test60#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,61,55,'SNS가 세상을 움직인다: 소셜 미디어로 본 바이럴 트렌드의 모든 것','SNS가 세상을 움직인다: 소셜 미디어로 본 바이럴 트렌드의 모든 것 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test61#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,62,78,'음악 페스티벌의 변화: Woodstock부터 Coachella까지','음악 페스티벌의 변화: Woodstock부터 Coachella까지 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test62#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,63,0,'할리우드 블록버스터: 성공하는 영화의 비밀을 데이터로 파헤치다!','할리우드 블록버스터: 성공하는 영화의 비밀을 데이터로 파헤치다! maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test63#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,64,68,'헬스케어의 진화: 90년대와 오늘날의 건강 관리 비교','헬스케어의 진화: 90년대와 오늘날의 건강 관리 비교 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test64#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,65,14,'자전거의 진화: 90년대 MTB와 최신 전기 자전거의 대결','자전거의 진화: 90년대 MTB와 최신 전기 자전거의 대결 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test65#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,66,25,'건강 트렌드 비교: 90년대 피트니스 붐 vs 현재의 웰니스 열풍','건강 트렌드 비교: 90년대 피트니스 붐 vs 현재의 웰니스 열풍 maintext','다미',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test66#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,67,52,'유명 건축물의 변화: 전통과 현대의 만남','유명 건축물의 변화: 전통과 현대의 만남 maintext','거니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test67#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,68,0,'자동차 디자인의 변천사: 클래식 카 vs 최신 전기차','자동차 디자인의 변천사: 클래식 카 vs 최신 전기차 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test68#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,69,35,'청소년 문화의 변화: 90년대 청소년 vs 2020년대 청소년','청소년 문화의 변화: 90년대 청소년 vs 2020년대 청소년 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test69#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,70,14,'책 읽기의 변화: 종이책에서 전자책으로','책 읽기의 변화: 종이책에서 전자책으로 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test70#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,71,0,'쇼핑의 변신: 전통 시장에서 온라인 쇼핑몰로','쇼핑의 변신: 전통 시장에서 온라인 쇼핑몰로 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test71#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,72,0,'여행 트렌드의 진화: 배낭여행 vs 럭셔리 여행','여행 트렌드의 진화: 배낭여행 vs 럭셔리 여행 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test72#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,73,8,'패션 아이콘 비교: 90년대와 현대의 스타일리시 셀러브리티','패션 아이콘 비교: 90년대와 현대의 스타일리시 셀러브리티 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test73#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,74,23,'환경 인식의 변화: 90년대 환경 운동 vs 현대의 그린 테크','환경 인식의 변화: 90년대 환경 운동 vs 현대의 그린 테크 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test74#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,75,0,'IT 혁명의 중심: 90년대 컴퓨터와 오늘날의 슈퍼컴퓨터','IT 혁명의 중심: 90년대 컴퓨터와 오늘날의 슈퍼컴퓨터 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test75#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,76,4,'디지털 음악 혁명: CD에서 스트리밍까지','디지털 음악 혁명: CD에서 스트리밍까지 maintext','다미',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test76#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,77,34,'취업 준비의 변화: 90년대 vs 2020년대 취업전쟁','취업 준비의 변화: 90년대 vs 2020년대 취업전쟁 maintext','거니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test77#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,78,2,'데이팅 앱의 시대: 전통 소개팅과 현대 매칭의 차이','데이팅 앱의 시대: 전통 소개팅과 현대 매칭의 차이 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test78#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,79,25,'커피 문화의 변신: 다방에서 스페셜티 카페까지','커피 문화의 변신: 다방에서 스페셜티 카페까지 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test79#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,80,19,'사회적 트렌드 속의 광고: 80년대와 오늘날의 메시지 차이','사회적 트렌드 속의 광고: 80년대와 오늘날의 메시지 차이 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test80#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,81,49,'인기 애니메이션의 변천사: 옛날 vs 요즘','인기 애니메이션의 변천사: 옛날 vs 요즘 maintext','비니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test81#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,82,2,'90년대 vs 현재: 인기 TV 드라마의 스토리텔링 변화','90년대 vs 현재: 인기 TV 드라마의 스토리텔링 변화 maintext','숨이',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test82#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,83,45,'유튜브 스타의 진화: 초기 vs 현대 크리에이터','유튜브 스타의 진화: 초기 vs 현대 크리에이터 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test83#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,84,34,'힙합 가사의 변화: 반항의 시에서 자아 찾기까지','힙합 가사의 변화: 반항의 시에서 자아 찾기까지 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test84#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,85,2,'아이돌 메이크업 변천사: 90년대 글리터부터 오늘날의 글로우까지','아이돌 메이크업 변천사: 90년대 글리터부터 오늘날의 글로우까지 maintext','화니',to_timestamp('24/07/04 01:07:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test85#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,86,34,'20년간의 스마트폰 진화: 첫 모델과 최신 모델의 격돌','20년간의 스마트폰 진화: 첫 모델과 최신 모델의 격돌 maintext','다미',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test86#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,87,0,'아이돌 팬덤의 변천사: 90년대와 지금, 누가 더 열정적일까?','아이돌 팬덤의 변천사: 90년대와 지금, 누가 더 열정적일까? maintext','거니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test87#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,88,29,'비디오 게임 그래픽의 레볼루션: 90년대 픽셀에서 2020년대 리얼리티로','비디오 게임 그래픽의 레볼루션: 90년대 픽셀에서 2020년대 리얼리티로 maintext','비니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test88#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,89,13,'소셜 미디어 대격변: 당신의 콘텐츠는 몇 년대 스타일?','소셜 미디어 대격변: 당신의 콘텐츠는 몇 년대 스타일? maintext','숨이',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test89#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,90,78,'배달의 민족: 음식 배달 서비스의 혁명','배달의 민족: 음식 배달 서비스의 혁명 maintext','화니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test90#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,91,0,'스마트폰 카메라, 얼마나 진화했나? 2007 vs 2024','스마트폰 카메라, 얼마나 진화했나? 2007 vs 2024 maintext','비니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test91#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,92,30,'인터넷 밈의 진화: 웃음 코드의 대변신','인터넷 밈의 진화: 웃음 코드의 대변신 maintext','숨이',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test92#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,93,24,'네이버 웹툰 트렌드 쇼크: 20년 동안 뭐가 달라졌나?','네이버 웹툰 트렌드 쇼크: 20년 동안 뭐가 달라졌나? maintext','화니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test93#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,94,8,'아이돌 가사 대격돌: 데뷔곡과 히트곡의 숨은 의미','아이돌 가사 대격돌: 데뷔곡과 히트곡의 숨은 의미 maintext','화니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test94#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,95,20,'90년대 vs 2020년대: 패션 전쟁의 승자는?','90년대 vs 2020년대: 패션 전쟁의 승자는? maintext','화니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test95#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (2,96,33,'레트로에서 현대까지: 영화 포스터 디자인의 대변혁','레트로에서 현대까지: 영화 포스터 디자인의 대변혁 maintext','다미',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#test96#hash#tag');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (3,97,67,'서울특별시 미세먼지 정보 타당성 분석',null,'화니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#서울 #미세먼지 #타당성');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (4,98,48,'멜론차트_가사분석',null,'화니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#멜론인기차트 #MZvs.88가사 #한영비율');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (5,99,57,'저축은행 건전성 분석',null,'화니',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#저축은행건전성 #연체율 #부도.폐업');
Insert into SUMI.TREND (USERNUM,TNUM,LNUM,TITLE,MAINTEXT,WRITER,TDATE,TAG) values (1,100,49,'10컷 웹툰으로 보는 트렌트(화산귀환)',null,'다미',to_timestamp('24/07/04 01:07:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'#네이버웹툰 #20-30대인기 #10컷웨툰 #2030트렌드 #화산귀환 #쳥명 #회귀빙의환생 #매화 #소설화산귀환 #꿀잼웹툰 #무협 #마교');
--------------------------------------------------------
--  DDL for Index TREND_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUMI"."TREND_PK" ON "SUMI"."TREND" ("TNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TREND
--------------------------------------------------------

  ALTER TABLE "SUMI"."TREND" ADD CONSTRAINT "TREND_PK" PRIMARY KEY ("TNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SUMI"."TREND" MODIFY ("TNUM" NOT NULL ENABLE);

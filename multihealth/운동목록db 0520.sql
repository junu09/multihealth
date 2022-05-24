
use healthdb;

INSERT INTO exercisecategory_table (ec_num, ec_name)VALUE(1,"맨몸 운동");
INSERT INTO exercisecategory_table (ec_num, ec_name)VALUE(2,"바벨/덤벨/기구");

INSERT INTO exercisetype_table (et_name,et_ename,et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("스탠딩사이드크런치","standing_side_crunch",5,3,2,'복근','standing_side_crunch1','standing_side_crunch2','standing_side_crunch3',
'1. 정면을 보고 서서 양손을 귀옆으로 가져옵니다.
 2. 무릎을 한쪽을 올려 팔꿈치에 붙입니다.
 3. 반대 발도 2번과 동일하게 진행합니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("스탠딩니업","standing_knee_up",5,3,2,'복근','standing_knee_up1','standing_knee_up2','standing_knee_up3',
'1. 정면을 보고  자세를 편안하게 합니다. 
2. 다리가 직각이 될때까지 올립니다.
3. 반대 편도 동일하게 진행합니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("라잉레그레이즈","lying_leg_raise",5,3,2,'복근','lying_leg_raise1','lying_leg_raise2','lying_leg_raise3',
'1. 몸이 일자가 되도록 위를 보고 눕습니다.
2. 90도가 될때까지 다리를 들어올립니다.
3. 천천히 다리를 내립니다.
4. 해당동작을 반복합니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("크런치","crunch",5,3,2,'복근','crunch1','crunch2','crunch3',
'1. 바닥에 등을 대고 눕고 다리는 의자위에 올리거나 무릎을 굽혀서 발바닥을 바닥에 댑니다.
2. 두손을 가슴에 올리거나 머리뒤에 둡니다.
3. 등의 아랫부분을 바닥에서 떼지 말고 견갑골을 바닥에서 들어올린다는 느낌으로 복부를 강하게 쥐어짭니다.
4. 상체를 일으키기 전 숨을 들이마시고, 일으키면서 숨을 내쉬고 최고점에서 완전히 숨을 다 뱉습니다.
5. 시작 자세로 내려오면서 숨을 들이 마십니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("바이서클크런치","bicycle_crunch",5,3,2,'복근','bicycle_crunch1','bicycle_crunch2','bicycle_crunch3',
'1. 매트에 누워 양손으로 머리를 받쳐줍니다.
2. 몸통을 좌우로 비틀며 오른쪽 무릎이 왼쪽 팔꿈치에 닿게 해줍니다.
3. 다시 원상태로 돌아옵니다. 
4. 왼쪽무릎이 오른쪽 팔꿈치에 닿게 해줍니다.
5.해당동작을 반복합니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("시저크로스","caesar_cross",3,3,1,'허벅지','caesar_cross1','caesar_cross2','caesar_cross3',
'1. 등을 바닥에 대고 눕습니다.
2. 상체를 살짝 들어올립니다.
3. 양발을  들어 좌우로 교차시킵니다. 
4. 해당 동작을 반복합니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("힘쓰러스크","himsseu_rusk",3,3,1,'엉덩이','himsseu_rusk1','himsseu_rusk2','himsseu_rusk3',
'1. 등을 바닥에 대고 눕습니다.
2. 발뒤꿈치에 힘을 주고 엉덩이를 밀어준다는 느낌으로 몸을 들어올립니다.
3. 다시 힘을 빼고 등을 바닥에 닿도록 합니다.
4. 해당 동작을 반복합니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("플랭크","frank",4,3,2,'복근','frank1','frank2','frank3',
'1. 엎드린 자세에서 팔뚝으로 중심으로 잡고 다리는 야간 벌린 상태로 일자를 유지합니다.
2. 팔꿈치와 어깨가 일자가 유지되도록 합니다.
3. 복부에 힘을 주고 몸을 앞으로 들어올립니다. 고개를 너무 떨구는 일이 없도록 주의합니다.
4. 해당 자세를 최소 15초동안 유지합니다.', 1);


INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("푸쉬업","push_up",5,3,2,'전신','push_up1','push_up2','push_up3',
'1. 엎드린 자세에서 팔을  어깨넓이 로 벌립니다.
2. 팔꿈치를 굽혔다 폈다가를 반복합니다.', 1);


INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("니푸쉬업","nipples_up",3,3,1,'가슴','nipples_up1','nipples_up2','nipples_up3',
'1. 두팔을 어깨보다 넓게 벌리고 바닥에 양손을 위치 합니다.
2. 무릎을 구부리고 종아리 부분은 펴준 채 엎드립니다.
3. 팔꿈치를 구부리면서 상체를 내립니다.
4. 상체를 내리면서 자연스럽게 발뒤꿈치를 올리도록 합니다.
5. 다시 팔꿈치를 펴면서 상채를 들어 올립니다.', 1);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("Y-exercise","y_exercise",3,3,1,'어깨','y_exercise1','y_exercise2','y_exercise3',
'1. 배를 바닥에 두고 눕습니다.
2. 엄지손가락 모양을 한후 두손을 앞을 뻗습니다.
3. 배에 힘을 주고 상체와 다리를 들어올렸다 내렸다를 반복해 줍니다.', 1);


#바벨운동
INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("바벨로우","barbell_row",5,5,2,'등','barbell_row1','barbell_row2','barbell_row3',
'1. 바벨을 들고 있는 상태에서 배에 힘을 주고 엉덩이는 뒤로 빼 몸의 각도가 45도가 되도록 합니다.
2. 숨을 뱉으면서 바벨을 당겨주고 숨을 내쉬면서 바벨을 내려줍니다.
3. 해당도작을 반복합니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("바벨데드리프트","barbell_deadlift",6,5,3,'허벅지','barbell_deadlift1','barbell_deadlift2','barbell_deadlift3',
'1. 어깨 너비 정도로 보폭을 잡고 바로 섭니다. 가슴을 펴고 등과 허리 코어, 엉덩이에 힘을 줍니다.
2. 손을 다리에 붙이고 엉덩이를 위로 빼면서 천천히 상체를 숙입니다. 동시에 자연스러운 움직임을 위해 무릎을 살짝 굽혀줍니다.
3. 손이 무릎아래 정도에 왔으면 다시 처음 자세로 돌아갑니다.
4. 해당 동작을 반복합니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("덤벨벤트오버로우","bumbbell_bent_over_rows",6,5,3,'등','bumbbell_bent_over_rows1','bumbbell_bent_over_rows2','bumbbell_bent_over_rows3',
'1. 다리를 어깨 너비 만큼 벌리고 서줍니다.
2. 손등이 보이도록 덤벨을 양손에 잡아줍니다.
3. 무릎을 살짝 굽힌 후 시선은 정면 허리를 아치형을 만들어 줍니다,
3. 두 손바닥이 마주보게끔 덤벨을 천천히 배꼽쪽으로 당겨줍니다.
4. 팔꿈치가 벌어지지 않도록 유의하면서 천천히 돌아옵니다.
6. 해당 동작을 반복합니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("바벨스쿼트","barbell_squat",6,5,3,'허벅지','barbell_squat1','barbell_squat2','barbell_squat3',
'1. 다리를 어깨 너비와 같이 벌려줍니다.
2. 바를 손을 위에 얹는다는 느낌으로 살짝잡고 팔꿈치는 수직방향으로 향하게 합니다.
3. 허벅지가 지면과 평행을 이루도록 힙을 뒤로 빼면서  무릎을 굽혀 천천히 앉아 줍니다
4. 뒤꿈치로 바닥을 밀며 힘을 주어 일어납니다.
5. 해당동작을 반복합니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("바벨런지","barbell_lunge",6,5,3,'허벅지','barbell_lunge1','barbell_lunge2','barbell_lunge3',
'1. 양손으로 바벨을 잡아 어깨 뒤쪽 승모근에 걸치고 허리를 펴고 섭니다.
2. 한쪽 다리를 앞으로 내민 후 구부립니다
3. 뒤로 다시 물러서서 반대쪽 다리도 내밀어 실시합니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("오버헤드프레스","overhead_press",5,5,2,'어깨','overhead_press1','overhead_press2','overhead_press3',
'1. 그립을 오버핸드로 잡고 어깨보다 더 넓게 다리를 벌립니다.
2. 목아래의 쇄골에 바벨을 두고 준비동작을 합니다.
3. 팔꿈치가 양쪽으로 벌어지지 않고 앞쪽으로 곧게 향하도록 하고 팔을 위로 들어서 바벨을 듭니다.
4. 해당 동작을 반복합니다. ', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("사이드레터럴레이즈","side_lateral_raise",5,5,2,'어깨','side_lateral_raise1','side_lateral_raise2','side_lateral_raise3',
'1. 양발을 어깨넓이 보다 좁게 벌리고 양팔로 덤벨을 모아서 잡습니다.
2. 가슴을 펴고 시선을 정면을 향한 상태에서 빠르고 손을 들어 올리면서 호흡을 깊이 들이 마십니다.
3. 0.5초 정도 멈췄다가 천천히 내리면서 호흡을 밷어 줍니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("바벨컬","barbell_curl",5,5,2,'팔','barbell_curl1','barbell_curl2','barbell_curl3',
'1. 다리를 어깨넓이 11자로 위치시키고 허리를 곧게 펴고 서서 언더그립으로 바벨을 잡아줍니다.
2. 호흡을 내쉬면서 팔꿈치를 구부려주세요.
3. 호흡을 들이 마시면서 시작자세로 돌아가주세요.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("덤벨컬","dumbbell_curl",4,5,2,'팔','dumbbell_curl1','dumbbell_curl2','dumbbell_curl3',
'1. 어깨는 내리고 팔꿈치는 몸통에 밀착하듯이 붙인 후 덤벨을 듭니다. 
2. 이두근을 올린다는 생각으로 천천히 덤벨을 올려줍니다
3. 해당동작을 반복합니다.', 2);

INSERT INTO exercisetype_table (et_name, et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("딥스","dips",6,5,3,'가슴','dips1','dips2','dips3',
'1. 평행봉을 두손으로 단단히 주어 잡는다. 
2. 상체는 앞으로 조금 숙이고 숨을 들이 쉬면서 천천히 몸을 내린다
3. 다시 상체를 위로 올린다.
4. 해당 동작을 반복한다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("풀업","pull_up",5,5,2,'등','pull_up1','pull_up2','pull_up3',
'1. 철봉을 어깨 넓이 만큼 잡습니다.
2. 가슴을 들어줍니다.
3. 들어놓은 가슴이 죽지 않도록 살리면서 광배근으로 몸을 당겨줍니다.
4. 가슴을 찍는다는 생각으로 올라간 뒤 내려올때 천천히 광배에 자극을 느끼며 내려옵니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("행잉레그레이즈","hanging_leg_raises",6,5,3,'복근','hanging_leg_raises1','hanging_leg_raises2','hanging_leg_raises3',
'1. 철봉을 어깨 넓이 만큰 잡습니다.
2. 다리를 구부리고 철봉에 매달리는 자세를 취합니다.
3. 다리를 들어올려 상체에 붙힙니다. 
4. 힘을 풀지 말고 천천히 다리를 내립니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("렛폴다운","let_fall_down",6,5,3,'등','let_fall_down1','let_fall_down2','let_fall_down3',
'1. 와이드그립으로 넓게 바를 잡습니다.
2. 숨을 내쉬며 턱과 수평이 될때까지 바를 아래로 당깁니다.
3. 발을 바닥에 평평하게 유지하고 복근에도 힘을 줍니다
4. 어깨는 직각상태를 유지하고 약1초정도 어깨뼈를 힘껏누릅니다.
5. 바를 턱에서 부터 천천히 위로 올립니다.', 2);

INSERT INTO exercisetype_table (et_name,et_ename, et_met,et_time,et_lv,et_part,et_img1,et_img2,et_img3,et_description, ec_num) 
VALUE("페이스 풀","face_pull",6,5,3,'어깨','face_pull1','face_pull2','face_pull3',
'1. 로프의 위치를 어깨 높이로 맞춰 잡습니다.
2. 케이블에서 뒤로 떨어져 케이블을 마주보고 무릎을 살짝 구부린 상태에서 로프를 당겨 줍니다.
3. 동작을 반복합니다.', 2);


INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(19,19,"female",11.23,65.35,16.61,6.35,0.46);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(20,24,"female",13.33,68.58,12.82,4.96,0.30);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(25,29,"female",11.47,71.58,12.00,4.66,0.28);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(30,34,"female",9.44,70.40,14.36,5.49,0.30);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(35,39,"female",7.33,69.90,16.72,5.78,0.27);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(40,44,"female",5.70,70.02,18.60,5.49,0.19);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(45,49,"female",4.03,69.52,21.33,5.00,0.12);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(50,54,"female",2.89,67.43,24.75,4.84,0.08);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(55,59,"female",2.34,65.47,27.55,4.58,0.06);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(60,64,"female",1.97,61.85,31.11,5.01,0.05);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(65,69,"female",1.71,56.99,35.42,5.83,0.06);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(70,74,"female",1.84,54.40,37.52,6.17,0.07);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(75,79,"female",2.43,53.72,37.73,6.08,0.05);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(80,84,"female",4.12,55.72,34.68,5.45,0.03);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(85,85,"female",11.95,60.55,24.12,3.35,0.03);





INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(19,19,"male",7.34,56.58,23.87,11.67,0.54);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(20,24,"male",4.71,57.20,27.45,10.10,0.54);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(25,29,"male",1.89,52.87,34.37,10.47,0.41);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(30,34,"male",1.16,45.81,39.84,12.73,0.46);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(35,39,"male",0.96,43.14,43.35,12.24,0.30);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(40,44,"male",0.97,44.84,43.66,10.34,0.19);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(45,49,"male",0.99,47.34,43.67,7.90,0.10);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(50,54,"male",1.00,49.69,43.13,6.13,0.05);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(55,59,"male",1.15,52.81,41.50,4.52,0.02);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(60,64,"male",1.30,54.54,40.26,3.90,0.01);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(65,69,"male",1.54,55.86,39.16,3.43,0.01);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(70,74,"male",1.99,57.77,37.22,3.01,0.01);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(75,79,"male",2.86,61.06,33.58,2.48,0.01);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(80,84,"male",4.34,64.07,29.49,2.09,0.01);

INSERT INTO bmi_table(bmi_startage,bmi_endage,bmi_gender,bmi_lv1,bmi_lv2,bmi_lv3,bmi_lv4,bmi_lv5) 
VALUE(85,85,"male",7.57,68.22,22.80,1.39,0.01);



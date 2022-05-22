

CREATE DATABASE IF NOT EXISTS healthdb /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE healthdb;

##DDL
CREATE TABLE IF NOT EXISTS member_table (
    m_num INT NOT NULL AUTO_INCREMENT,
    m_mail VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    m_pw VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    isAccountNonExpired TINYINT(1) DEFAULT NULL,
    isAccountNonLocked TINYINT(1) DEFAULT NULL,
    isCredentialsNonExpired TINYINT(1) DEFAULT NULL,
    isEnabled TINYINT(1) DEFAULT NULL,    
    m_name VARCHAR(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    m_hp VARCHAR(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    m_post int NOT NULL,
    m_add1 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,    
    m_add2 VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,    
    m_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (m_num)    
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `healthdb`.`member_table`
ADD UNIQUE INDEX `m_num_UNIQUE` (`m_num` ASC) VISIBLE, 
ADD UNIQUE INDEX `m_mail_UNIQUE` (`m_mail` ASC) VISIBLE;

##DML
INSERT INTO `healthdb`.`member_table` (`m_num`, `m_mail`, `m_pw`, `isAccountNonExpired`, `isAccountNonLocked`, `isCredentialsNonExpired`, `isEnabled`, `m_name`, `m_hp`, `m_post`, `m_add1`, `m_add2`, `m_date`)
	VALUES ('1', 'admin@admin.com', '$2a$12$MGJHhZC.19mii32RoTKfle0ACB6Ps18qO9ZCH0Ps7XRzZhzCsi8tu', '1', '1', '1', '1', '관리자', '01234567890', '12345', '서울특별시 강남구 언주로 508', '14층(역삼동, 서울상록빌딩)', '2022-04-13 00:00:00');
INSERT INTO `healthdb`.`member_table` (`m_num`, `m_mail`, `m_pw`, `isAccountNonExpired`, `isAccountNonLocked`, `isCredentialsNonExpired`, `isEnabled`, `m_name`, `m_hp`, `m_post`, `m_add1`, `m_add2`, `m_date`)
	VALUES ('2', 'user@user.com', '$2a$12$ABzjZUeacVmZD.2bYx5SrODfp8fAWr3Mf/Nwb85FyiAAYRlQLrULu', '1', '1', '1', '1', '유저', '01234567890', '54321', '서울특별시 강남구 언주로 508', '14층(역삼동, 서울상록빌딩)', '2022-04-13 00:00:00');

##DDL
CREATE TABLE IF NOT EXISTS authority (	
	m_mail VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	authority_name VARCHAR(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    FOREIGN KEY (m_mail) REFERENCES member_table(m_mail) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DML
INSERT INTO `authority` (`m_mail`, `authority_name`) VALUES ('admin@admin.com','ADMIN');
INSERT INTO `authority` (`m_mail`, `authority_name`) VALUES ('user@user.com', 'USER');

##DDL
CREATE TABLE IF NOT EXISTS ptuser_table (
	pu_num int NOT NULL AUTO_INCREMENT,
    pu_img  VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT "userbasic.jpg",
	pu_birthday int DEFAULT 0,
	pu_cm int NOT NULL ,
    pu_kg int NOT NULL ,
    pu_target int NOT NULL DEFAULT 0,
    pu_point int NOT NULL DEFAULT 0,
	m_num INT NOT NULL,
	PRIMARY KEY (pu_num), 
	FOREIGN KEY (m_num) REFERENCES member_table(m_num) ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE KEY uk_name (m_num)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS exercisecategory_table (
    ec_num int NOT NULL primary key AUTO_INCREMENT,
    ec_name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS exercisetype_table (
	et_num int NOT NULL AUTO_INCREMENT,
	et_name VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    et_ename VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    et_met int NOT NULL,
    et_time int NOT NULL,
    et_lv int not NULL,
	et_part VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	et_img1 VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    et_img2 VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	et_img3 VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    et_description VARCHAR(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	ec_num int NOT NULL,
    PRIMARY KEY (et_num),
    UNIQUE KEY uk_name (et_ename),
	foreign key(ec_num) references exercisecategory_table (ec_num) on update cascade on delete cascade
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS ptroutine_table (
	pr_num int NOT NULL AUTO_INCREMENT,#루틴일렬변호
	pr_info VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,#루틴명 
    pu_num int NOT NULL,
    pr_allkcal int not null,
    pr_alltime int not null,
    pr_delete int NOT NULL DEFAULT 1,
	PRIMARY KEY (pr_num),
    FOREIGN KEY (pu_num) REFERENCES ptuser_table(pu_num) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS ptroutineone_table (
	po_num int NOT NULL AUTO_INCREMENT,#루틴일렬변호
	pr_num int NOT NULL,
	et_ename  VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,#운동영어이름
    pr_count int not null,
	PRIMARY KEY (po_num),
    FOREIGN KEY (pr_num) REFERENCES ptroutine_table(pr_num) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (et_ename) REFERENCES exercisetype_table(et_ename) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS workout_table(
    workout_num int NOT NULL AUTO_INCREMENT,
    pr_num int NOT NULL,
    pr_info VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    workout_point int NOT NULL DEFAULT 0,
    workout_time  datetime,
    pu_num int,
    PRIMARY KEY (workout_num),
    FOREIGN KEY (pu_num) REFERENCES ptuser_table(pu_num) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (pr_num) REFERENCES ptroutine_table(pr_num) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

##DDL
CREATE TABLE IF NOT EXISTS specialpt_table(
    specialpt_num int NOT NULL AUTO_INCREMENT,
    specialpt_score int NOT NULL,
    m_name VARCHAR(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    pu_num int,
    PRIMARY KEY (specialpt_num ),
    FOREIGN KEY (pu_num) REFERENCES ptuser_table(pu_num) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

##DDL
CREATE TABLE IF NOT EXISTS category_table (
    category_num int NOT NULL primary key,
    category_name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS bmi_table (
	bmi_num int NOT NULL AUTO_INCREMENT,
	bmi_startage int NOT NULL,
    bmi_endage int NOT NULL,
	bmi_gender VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    bmi_lv1 double not null,
    bmi_lv2 double not null,
    bmi_lv3 double not null,
    bmi_lv4 double not null,
    bmi_lv5 double not null,
    PRIMARY KEY (bmi_num)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS healthdb.product_table (
  prod_num INT NOT NULL auto_increment,
  category_num INT NOT NULL,
  prod_title VARCHAR(45) NULL,
  prod_price  int NOT NULL,
  prod_inventory INT NOT NULL,
  prod_img_name VARCHAR(1000) NOT NULL,
  prod_description_name VARCHAR(10000) NOT NULL,
  view_count INT NOT NULL default 0,
  prod_point DOUBLE NOT NULL default 0,
  PRIMARY KEY (prod_num),
  INDEX category_num_idx (category_num ASC) VISIBLE,
  CONSTRAINT category_num
    FOREIGN KEY (category_num)
    REFERENCES healthdb.category_table (category_num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

##DDL
CREATE TABLE IF NOT EXISTS healthdb.cart_table (
  cart_num INT NOT NULL auto_increment,
  m_num INT NOT NULL,
  prod_num INT NOT NULL,
  product_count INT NOT NULL,
  PRIMARY KEY (cart_num),
  INDEX m_num_idx (m_num ASC) VISIBLE,
  INDEX prod_num_idx (prod_num ASC) VISIBLE,
  CONSTRAINT m_num
    FOREIGN KEY (m_num)
    REFERENCES healthdb.member_table (m_num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT prod_num
    FOREIGN KEY (prod_num)
    REFERENCES healthdb.product_table (prod_num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
ENGINE = InnoDB
AUTO_INCREMENT=1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE cart_table AUTO_INCREMENT = 1;


##DDL
CREATE TABLE IF NOT EXISTS healthdb.order_table(
    o_num int not null auto_increment primary key,
    prod_num int not null,
    m_num int not null,
    o_count int not null,
    o_date datetime not null,
    o_address varchar(50) not null,
    o_state varchar(30) not null,
    foreign key (m_num) references member_table (m_num) on update cascade on delete cascade,
    foreign key (prod_num) references product_table (prod_num) on update cascade on delete cascade
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


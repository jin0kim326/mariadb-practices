drop table pet;

create table pet (
	 name varchar(20),
     owner varchar(20),
     species varchar(20),
     gender char(1),
     birth DATE,
     death DATE
);

-- scheme 확인
desc pet;

-- 조회
select name, owner, species, gender, birth, death from pet;

-- 데이터 넣기 (생성, create)
INSERT 
  INTO pet
 VALUE ('짱이', '김진영', 'dog', 'm' , '2008-03-26', null);
 
 -- 데이터 삭제 
 DELETE
   FROM pet
  WHERE name='짱이';
  
  -- load data local infile
  load data local infile "/Users/jinyoung/Desktop/douzone/eclipse-workspace/mariadb-practices/pet.txt" into table pet;
create database file;
use file;

drop table if exists file;

create table file(
   fileName varchar(200),
   fileRealName varchar(200)
);

alter table file add(downloadCount int);

desc file;

select * from file;

-- sql_safe_updates를 1로 설정하면 delete에 where절 없이는 실행이 안된다.
set sql_safe_updates=1;
delete from file;
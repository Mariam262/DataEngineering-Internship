
/* STEP 1 database table -- target table */
create table emp
(
	empid int not null,
	empname varchar (255),
	salary int, 
	deptno int,
	activeindicator int

);
select * from emp;  

insert into emp values(101, 'Ravi' , 5000 , 10 , 1), 
					 (102, 'krish' , 4000 , 20 , 1), 
					 (103, 'mohan' , 6000 , 10 , 1), 
					 (104, 'Aml' , 3000 , 30 , 1);

////////////////////////////////////////////////////////////

/*STEP 2 staging table -- source table */

create table stageemp
(
	empid int not null,
	empname varchar (255),
	salary int, 
	deptno int
);
	
	insert into stageemp values
					 (102, 'krish' , 7000 , 20), 
					 (103, 'mohan' , 6000 , 10);

select * from emp;	  /*target*/		 
select * FROM stageemp ;  /*source*/

////////////////////////////////////////////////////////////

/*STEP 3 merge query*/

merge emp as target
using stageemp as source
on target.empid=source.empid
when matched and activeindicator=1
		then update
		set activeindicator=0;

insert into emp(empid,empname, salary,deptno,activeindicator)
select empid,empname, salary,deptno,1 from stageemp

////////////////////////////////////////////////////////////

/*STEP 4 final result*/
select * from emp;






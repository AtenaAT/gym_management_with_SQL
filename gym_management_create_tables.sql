-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------- gym management tables -------------------------------------------------------------
----------------------------creating database---------------------------------------
create database gym_management
------------------------------------------------------------------------------------
---------------gym branches table --------------------------------------------------
create table gym_branch (
	gym_ID int IDENTITY(1,1)  PRIMARY KEY  NOT NULL ,
    gym_name varchar(30) NOT NULL,
    gym_address varchar(150) NOT NULL,
    gym_type varchar(20)NOT NULL,
	city	varchar(50)	NOT NULL,
	country	varchar(50)	NOT NULL,
    created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	
)
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------- instructor------------------------------------------------------
create table instructor (
	instructor_ID int IDENTITY(1,1)  NOT NULL,
	instructor_FirstName varchar(50) NOT NULL,
	instructor_LastName varchar(50) NOT NULL,
	instructor_PhoneNumber varchar(20) NOT NULL,
	instructor_Address varchar(100) NOT NULL,
	instructor_Email varchar(50) NOT NULL,
	instructor_gender varchar(10),
	instructor_dateOfBirth date  NOT NULL,
	instructor_age AS  (datediff(year,[instructor_dateOfBirth],getdate())),
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	gymID int NOT NULL,
	PRIMARY KEY (instructor_ID),
	FOREIGN KEY (gymID) REFERENCES gym_branch(gym_ID)
		
)
-------------------------------------------------------------------------------------
---- memberInfo table  ,  member information ----------------------------------------

create table memberInfo (
	member_ID int IDENTITY(1,1) NOT NULL,
	member_FirstName varchar(50) NOT NULL,
	member_LastName varchar(50) NOT NULL,
	member_PhoneNumber varchar(20) NOT NULL,
	member_Address varchar(100) NOT NULL,
	member_Email varchar(50) NOT NULL,
	member_gender varchar(10),
	member_dateOfBirth date NOT NULL,
	member_age  AS  (datediff(year,member_dateOfBirth,getdate())),
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	gymID int NOT NULL,
	PRIMARY KEY (member_ID),
	FOREIGN KEY (gymID) REFERENCES gym_branch(gym_ID)
)
----------------------------------------------------------------------------------
----------member Days table , days which any member register for------------------

create table members_Day (
	memberDays_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	member_day int NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime  NOT NULL

)
-----------------------------------------------------------------------------------
----user gym staff---------------------------------------------------------------
create table userInfo (
	userID int IDENTITY(1,1) NOT NULL,
	gymID  int	NOT NULL,
	user_FirstName varchar(50) NOT NULL,
	user_LastName varchar(50) NOT NULL,
	user_PhoneNumber varchar(20) NOT NULL,
	user_Address varchar(100) NOT NULL,
	user_Email varchar(50) NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	PRIMARY KEY (userID),
	FOREIGN KEY (gymID) REFERENCES gym_branch(gym_ID)
)
-----------------------------------------------------------------------------------
---- payment table , payment information ------------------------------------------
create table paymentList (
	paymentList_ID int IDENTITY(1,1) NOT NULL,
	ref_ID  uniqueidentifier ROWGUIDCOL  NOT NULL,
	member_ID	int NOT NULL,
	instructorID int NOT NULL,
	userID	int	 NOT NULL,
	amount int NOT NULL,
	member_day int NOT NULL,
	offer varchar(10) ,
	statusPay varchar(10) NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	PRIMARY KEY (paymentList_ID,ref_ID),
	FOREIGN KEY (member_ID) REFERENCES memberInfo(member_ID),
	FOREIGN KEY (instructorID) REFERENCES instructor(instructor_ID), 
	FOREIGN KEY (userID) REFERENCES userInfo (userID)
)

-----------------------------------------------------------------------------------
---- membersDayCome table , the days which members come to gym --------------------
create table membersDayCome (
	membersDayCome_ID int IDENTITY(1,1) NOT NULL,
	member_day int NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	memberDays_ID	int	NOT NULL,
	PRIMARY KEY (membersDayCome_ID),
	FOREIGN KEY (member_day) REFERENCES members_Day(memberDays_ID)

)
-----------------------------------------------------------------------------------
---- offer table , amount of offer given to members--------------------------------
create table offer (
	offer_ID int IDENTITY(1,1) NOT NULL,
	member_ID	int	NOT NULL,
	offer_GID	uniqueidentifier NOT NULL,
	offer_amount int NOT NULL,
	active bit NOT NULL,
	offer_description varchar(70) sparse ,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	PRIMARY KEY (offer_ID),
	FOREIGN KEY (member_ID) REFERENCES memberInfo(member_ID)
)
-----------------------------------------------------------------------------------
------- workout table , different field -------------------------------------------
create table workout (
	workout_ID int IDENTITY(1,1) NOT NULL,
	workout_name varchar(50) NOT NULL,
	workout_description varchar(100) sparse,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	PRIMARY KEY (workout_ID),
)

alter table workout
alter column workout_description varchar(500) ;
------------------------------------------------------------------------------------
------ workout plan , specific days for different workout --------------------------
create table workoutPlan (
	workoutPlan_ID int  IDENTITY(1,1) NOT NULL,
	member_id int  NOT NULL,
	workout_id int NOT NULL,
	work_out_time datetime NOT NULL ,
	work_out_date date NOT NULL,
	instructor_id int  NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	PRIMARY KEY (workoutPlan_ID),
	FOREIGN KEY (member_id) REFERENCES memberInfo(member_ID),
	FOREIGN KEY (workout_id) REFERENCES workout(workout_ID),
	FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_ID)
	
)
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
------------bridge table for memberInfo & member_days tbl-------------------------------
create table bridge_member_days (
	memberDays_ID int NOT NULL,
	member_ID int NOT NULL,
	PRIMARY KEY (memberDays_ID, member_ID),
	FOREIGN KEY (memberDays_ID) REFERENCES members_Day(memberDays_ID),
	FOREIGN KEY (member_ID) REFERENCES memberInfo(member_ID)

)
----------------------------------------------------------------------------------------
------------bridge table for memberInfo & offer tbl-----------------------------------
create table bridge_memberInfo_offer (
	offer_ID int NOT NULL,
	member_ID int NOT NULL,
	PRIMARY KEY (offer_ID, member_ID),
	FOREIGN KEY (member_ID) REFERENCES memberInfo(member_ID),
	FOREIGN KEY (offer_ID) REFERENCES offer(offer_ID),

)
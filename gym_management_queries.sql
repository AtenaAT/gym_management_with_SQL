-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------queries-----------------------------------------------------------------------------
------------------adding email constraint------------------------------
------------------------instructor tbl---------------------------------
SELECT instructor_Email 
FROM instructor 
WHERE instructor_Email like '%@%.%';
-----------------------------------------------------------------------
------------------------memberInfo tbl---------------------------------
SELECT member_Email 
FROM memberInfo 
WHERE member_Email like '%@%.%';
-----------------------------------------------------------------------
------------------------userInfo tbl-----------------------------------
SELECT user_Email 
FROM userInfo 
WHERE user_Email like '%@%.%';
-----------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
---------payment hayi k successful hastan--------------------------------------------------------------------------------------
select *
from [dbo].[paymentList]
where statusPay='successful'
-------------------------------------------------------------------------------------------------------------------------------
---------instructor hayi k khanum hastan---------------------------------------------------------------------------------------
select [instructor_FirstName] as 'first name', [instructor_LastName] as 'last name'
from [dbo].[instructor]
where [instructor_gender]= 'Female'
------------------------------------------------------------------------------------------------------------------------------
---------instructor hayi k az 20 ta 30 sal darand-----------------------------------------------------------------------------
select [instructor_FirstName] as 'first name', [instructor_LastName] as 'last name', [instructor_age] as age
from [dbo].[instructor]
where [instructor_age] > 20 and [instructor_age] <30
-----------------------------------------------------------------------------------------------------------------------------
---------instructor hayi k dar Green-Hills va Beahan Group hastan------------------------------------------------------------
select [instructor_FirstName] as 'first name', [instructor_LastName] as 'last name',gym_name, [country]
from instructor
inner join gym_branch
on instructor.gymID = instructor.gymID
where gym_branch.[gym_name] ='Green-Hills' 
or
gym_branch.[gym_name] ='Beahan Group'
--------------------------------------------------------------------------------------------------------------------------------
---------esm member hayi k offer balaye 30 gereftan-----------------------------------------------------------------------------
select [member_FirstName] as 'first name', [member_LastName] as 'last name', [offer_amount]
from [dbo].[memberInfo]
inner join [dbo].[offer]
on offer.member_ID = memberInfo.member_ID
where [offer_amount] >= 30
-------------------------------------------------------------------------------------------------------------------------------------
---------offer hayi k active hastan b hamrahe gheymat va esm member------------------------------------------------------------------
select active as 'status',[offer_amount], [member_FirstName] as 'first name', [member_LastName] as 'last name'
from [dbo].[memberInfo]
inner join [dbo].[offer]
on offer.member_ID = memberInfo.member_ID
where active =1
------------------------------------------------------------------------------------------------------------------------------------
---------har kasi ch workout pan dare /ham ba esme workout----------------------------------------------------------------------------
select distinct [member_FirstName] as 'first name', [member_LastName] as 'last name',[workout_name]
from [memberInfo], [workout]
order by member_FirstName asc
----------------------------------------------------------------------------------------------------------------------
---------esme staff ba esm branch gym va keshvar-----------------------------------------------------------------------
select distinct [user_FirstName], [user_LastName], [gym_name],[country]
from [dbo].[userInfo], [dbo].[gym_branch]
-------------------------------------------------------------------------------------------------------------------------

---------sort member ha az a va az female va az javantarin-------------------------------------------------------------
select [member_FirstName] as 'first name', [member_LastName] as 'last name',[member_age], [member_gender]
from [dbo].[memberInfo]
where member_gender='Female'
order by member_FirstName ,[member_age] asc 
-------------------------------------------------------------------------------------------------------------------------
---------top 3 workout---------------------------------------------------------------------------------------------------
select top 3 workout_name, workout_description
from [dbo].[workout]

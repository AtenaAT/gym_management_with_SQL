# gym_management_with_SQL
**gym management database with sql**

Here we have a gym management database using an SQL server.<br />
It contains 12 tables.<br />
In the following, I'm going to explain each of them:<br />


- Gym_branch table:<br />
&nbsp; &nbsp;    As it's clear from its name, it's about the different branches of the gym in a country in a different city. <br />
&nbsp; &nbsp;    It contains the following information: ID, gym_name, address, type, created_at, and updated_at. <br />
&nbsp; &nbsp;    **Note**: I'll add these two fields (created_at and updated_at ) to restore data in the future and when we come back to know when we added each piece of data.

- Instructor table: <br />
&nbsp; &nbsp;    This table is about trainers. <br />
&nbsp; &nbsp;    It consists of an ID, first name, last name, phone number, address, email, gender, date of birth, age, created at, updated at, gymID(as a foreign key) <br />

- UserInfo table : <br />
&nbsp; &nbsp;    It's about the gym staff's personal information.<br />
&nbsp; &nbsp;    ID, first name, last name, phone number, address, email, created at, updated at, gymID(foreign key)<br />

- Workout table: <br />
&nbsp; &nbsp;   About the different workouts that each gym has.<br />
&nbsp; &nbsp;   ID, name, description, created at, updated at<br />


- member info table : <br />
&nbsp; &nbsp;   Personal information of gym members who register.<br />
&nbsp; &nbsp;   ID, first name, last name, phone number, address, email, gender, date of birth, created at, updated at,gymID(foreign key) <br />

- Member Day Table: <br />
&nbsp; &nbsp;   The specific days each member goes to the gym. <br />
&nbsp; &nbsp;   ID, member day, created at, updated at. <br />
&nbsp; &nbsp;   The table that connects member day and member info: <br />
&nbsp; &nbsp;    Member day ID and member ID as a primary key and foreign key.


- Offer table:<br />
&nbsp; &nbsp;   About the offers which gyms give to members as marketing issues. <br />
&nbsp; &nbsp;   (Like registering for the first time or a special occasion. ) <br />
&nbsp; &nbsp;   offer ID, offer amount, active/deactivate, offer description, created at, updated at, member ID as a foreign key. <br />

- Bridge table for members Info and offer table: <br />
&nbsp; &nbsp;   Offer ID, member ID as primary key, and foreign key. <br />



- Payment list table: <br />
&nbsp; &nbsp;   History of payment with details <br />
&nbsp; &nbsp;   ID, amount, member day, ref ID, offer, status pay, created at, updated at <br />
&nbsp; &nbsp;   Member ID(foreign key). <br />

- Members Day come table: <br />
&nbsp; &nbsp;   It gives us information about the days on which members come to check and makes less from the number of days that members register for. <br />
&nbsp; &nbsp;   ID, member day, created at, updated at, member day ID(foreign key). <br />

- workout plan table:<br />
&nbsp; &nbsp;   Each workout has a plan, and each member has a specific plan. <br />
&nbsp; &nbsp;   ID, member ID, workout ID, workout time, workout date, instructor ID, created at, updated at. <br />

--------------------------------------------------------------------------------------------

- Constraint:<br />
&nbsp; &nbsp;   &nbsp; &nbsp;   Email constraint: I used ([emailField] like '%@%.%') constraint.<br />
&nbsp; &nbsp;   &nbsp; &nbsp;   Allow/null: for something like descriptions, offer in payment table, gender.<br />
&nbsp; &nbsp;   &nbsp; &nbsp;   Sparse column: offer description, workout description.<br />
&nbsp; &nbsp;   &nbsp; &nbsp;   Identity: for almost all IDs in the table.<br />

- Relations, Data type, and keys: <br />
&nbsp; &nbsp;   &nbsp; &nbsp;   I’ll specify them in the diagram pic and TSQL.<br />
&nbsp; &nbsp;   &nbsp; &nbsp;    I’ll add two types of diagrams, one of them is with more detail and the other is more understandable.<br />
&nbsp; &nbsp;   Take a look at:<br />
gym_management_queries.sql <br />
gym_management_insert_fake_data.sql<br />
gym_management_create_tables.sql.<br />

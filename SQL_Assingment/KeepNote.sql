
Create Table Users
(
User_Id int primary key,
User_Name varchar(20),
User_Added_Date Date,
User_Password varchar(10),
User_Mobile int
)

Create Table Note
(
Note_Id int primary key,
Note_title varchar(20),
Note_content varchar(20),
Note_status varchar(20),
Note_creation_date Date,
User_Id int references Users(User_Id)
)

Create Table Category
(
Category_Id int primary key,
Category_name varchar(20),
Category_descr varchar(20),
Category_creation_date Date,
Category_creator int references Users(User_Id)
)

Create Table Reminder
(
Reminder_Id int primary key,
Reminder_name varchar(20),
Reminder_descr varchar(20),
Reminder_type varchar(20),
Reminder_creation_date Date,
Reminder_Creator int references Users(User_Id)
)

Create Table NoteCategory
(
NoteCategory_Id int primary key,
Note_Id int references Note(Note_Id),
Category_Id int references Category(Category_Id)
)

Create Table NoteReminder
(
NoteReminder_Id int primary key,
Note_Id int references Note(Note_Id),
Reminder_Id int references Reminder(Reminder_Id)
)

Insert into users values
(112233,'Maya','2019-01-02','Maya1214',8012345679),
(112244,'Nair','2019-01-11','Welcome',9023778467)

insert into Note values 
(1,'Today Tasks', '1.Check emails and reply to them 2. start the pro','InProgress','2019-01-21',112233),
(2,'Traning to plan', '1.Application related 2.Technical related','Yet To Start','2019-01-31',112244),
(3,'Things to have today', '1.Fruits 2.More water','InProgress','2019-01-25',112244)

Insert into Category values
(1,'offical','office related nots','2019-01-21',112233),
(2,'diet','health related notes','2019-01-24',112244)

insert into Reminder values 
(1,'KT reminder', 'Session on technical queries','Office Reminders','2019-01-12',112233),
(2,'Personal reminder', 'Pick children','Personal Reminders','2019-01-14',112244)

Insert into NoteCategory values(1,1,1),
                                (2,2,1),
                                (3,3,2) 

Insert into NoteReminder values(1,3,2),
                                (2,2,1)

select * from users
select * from Category
select * from Note
select * from Reminder
select * from NoteReminder
select * from NoteCategory

--Query1
--Fetch the row from User table with Id=112233 and Password=’Maya1214’.
select * from users where user_id = 112233 and user_password = 'Maya1214'

--Query2
--Fetch all the rows from Note table with note_creation_date=’01/31/2019’.
select * from Note where note_creation_date = '01/31/2019'

--Query3
--Fetch all the Categories created after ‘01/22/2019’.
select * from Category where category_creation_date > '01/22/2019'

--Query4
--Fetch all category details which belongs to note with note id=1.
SELECT * FROM category WHERE category_creator = (SELECT user_id FROM note WHERE note_id = 1);

--Query5
--Fetch all the Notes from the Note table with userId=112244.
select * from Note where user_id = 112244

--Query6
--Fetch all the Notes from the Note table for category_id=1.
select * from Note where user_id = (select category_creator from Category where category_id =1)

--Query7
--Fetch all the reminder details for note id=2.
select * from Reminder where reminder_creator = (select user_id from Note where note_id =2)

--Query8
--Write a query to change the note_status to ‘Completed’ with note Id=3.
update Note set note_status = 'Completed' where  note_id = 3

--Query9
--Write a query to set a reminder of type ‘Personal Reminders’ for Note with note id=1. [Find reminder id based upon reminder_type]
update reminder
set reminder_type = 'Personal Reminders'
where reminder_creator = (select user_id from Note where note_id = 1)

--Query10
--Write a query to remove all reminders from Note with note_id=2.
delete from Reminder where reminder_creator = (select user_id from Note where note_id = 2)
delete from NoteReminder where note_id=2


create database [Digital Churn Analysis]

use [Digital Churn Analysis]

--Users table store the information of users
create table users(
user_id int PRIMARY KEY,
user_name nvarchar(256),
contact_info varchar(256) NOT NULL UNIQUE,
sign_up_date date,
subscription_type varchar(256) check (subscription_type in ('Anually','Monthly','Weekly')),
country varchar(256))

--Features table stores the Application's Features information
create table features(
feature_id int primary key,
feature_name varchar(256) NOT NULL,
feature_date_time datetime)

--Subscription table helps us to know which user subscribed and to what amount of plan 
create table subscription(
subscription_id int PRIMARY KEY,
user_id int foreign key references users(user_id),
subscription_time datetime,
plan_name varchar(256) NOT NULL,
amount int)

--Feature usage table tells us the time engagement of features within users 
create table feature_usage(
usage_id int PRIMARY KEY,
feature_id int foreign key references features(feature_id),
user_id int foreign key references users(user_id),
usage_time time)

--Sessions table tells us about each users log in and log out time
create table sessions(
session_id int PRIMARY KEY,
user_id int foreign key references users(user_id),
log_in_time datetime,
log_out_time datetime)

--Churn_status table tracks whether a user became inactive or left the platform
create table churn_status(
user_id int PRIMARY KEY foreign key references users(user_id),
churn_status tinyint check(churn_status in (1,0)),
churn_date date,
user_rating decimal(2,1))


--Misclleanous:
EXEC sp_helpconstraint users

alter table users drop constraint CK__users__subscript__4BAC3F29
alter table users drop constraint CK__users__subscript__5BE2A6F2

alter table feature_usage alter column usage_time time


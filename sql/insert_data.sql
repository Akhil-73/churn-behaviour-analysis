insert into users values 
(101,'Akhilesh Kumar Shukla','shuklaakhilesh31310@gmail.com','2020-05-03','Annually','India'),
(102,'John Devis','devisjohn@yahoo.in','2022-06-03','Monthly','USA'),
(103,'Chen pao','paochen@gmail.com','2024-07-04','Weekly','Japan'),
(105,'Xi Jingping','jinpingxi@yahoo.in','2023-04-04','Monthly','China'),
(106,'Kim Jong Un','kimkimki@gmail.com','2025-02-04','Weekly','North Korea'),
(107,'Guy Parmelin','parmelin@yahoo.in','2026-01-04','Weekly','Switzerland'),
(108,'Giorgia Meloni','melody@gmail.com','2022-06-04','Annually','Italy'),
(109,'Satakshi Anand Srivastava','satakshianand28@gmail.com','2022-03-28','Monthly','India'),
(110,'Aman','aman@yahoo.in','2024-04-04','Annually','India'),
(111,'Rohan','rohan@gmail.com','2026-04-04','Weekly','India'),
(112,'John Doe','johndoe@yahoo.in','2025-04-04','Annually','USA'),
(113,'Elon Musk','musk@gmail.com','2026-05-08','Weekly','USA'),
(114,'Souta','souta@gmail.com','2017-04-04','Annually','Japan'),
(115,'Chinchan','chinchanxi@yahoo.in','2025-03-04','Annually','China'),
(116,'Chin chaw','chinchaw@gmail.com','2020-07-06','Weekly','China'),
(117,'Uchisaki','uchisaki@yahoo.in','2026-02-08','Monthly','Japan'),
(118,'Jaron','jaron@gmail.com','2024-07-02','Monthly','Switzerland')

select * from users

insert into features (feature_id,feature_name,feature_date_time) values 
(1,'AI Assistant','2022-03-12 14:30:00'),
(2,'AI Transcript','2023-01-01 00:05:00'),
(3,'AI Test Paper Analyzer','2024-03-03 16:30:00'),
(4,'Previous Year Questions','2017-03-12 12:30:00'),
(5,'Captions','2017-03-12 12:30:00'),
(6,'Weekly Assesment','2021-06-02 06:00:00'),
(7,'Playback speed','2017-03-12 12:30:00'),
(8,'Quality control','2017-03-12 12:00:00'),
(9,'Tina AI','2025-06-12 14:30:00'),
(10,'Daily Streaks','2023-07-02 16:30:00'),
(11,'Create Notes','2022-04-03 11:00:00')

select * from features

insert into subscription
(subscription_id,user_id,subscription_time,plan_name,amount)
values
(1,101,'2020-05-03 09:00:00','Premium',999),
(2,102,'2022-06-03 10:30:00','Basic',199),
(3,103,'2024-07-04 12:00:00','Weekly',99),
(4,105,'2023-04-04 11:00:00','Basic',199),
(5,106,'2025-02-04 08:30:00','Weekly',99),
(6,107,'2026-01-04 09:30:00','Weekly',99),
(7,108,'2022-06-04 10:00:00','Premium',999),
(8,109,'2022-03-28 13:30:00','Basic',199),
(9,110,'2024-04-04 09:00:00','Premium',999),
(10,111,'2026-04-04 10:00:00','Weekly',99),
(11,112,'2025-04-04 14:00:00','Premium',999),
(12,113,'2026-05-08 15:00:00','Weekly',99),
(13,114,'2017-04-04 08:00:00','Premium',999),
(14,115,'2025-03-04 10:30:00','Premium',999),
(15,116,'2020-07-06 09:30:00','Weekly',99),
(16,117,'2026-02-08 13:00:00','Basic',199),
(17,118,'2024-07-02 15:30:00','Basic',199)

select * from subscription

insert into feature_usage
(usage_id,feature_id,user_id,usage_time)
values
(1,10,101,'09:20:00'),
(2,1,101,'10:15:00'),
(3,11,101,'10:40:00'),
(4,10,108,'08:45:00'),
(5,3,108,'09:10:00'),
(6,1,109,'10:00:00'),
(7,10,109,'10:45:00'),
(8,1,112,'07:30:00'),
(9,2,112,'08:20:00'),
(10,10,114,'09:00:00'),
(11,11,114,'09:30:00'),
(12,5,106,'10:05:00'),
(13,7,110,'09:03:00'),
(14,8,111,'08:02:00'),
(15,2,113,'12:02:00'),
(16,5,116,'09:03:00'),
(17,7,117,'11:05:00')
select * from feature_usage

insert into sessions
(session_id,user_id,log_in_time,log_out_time)
values
(1,101,'2026-05-20 09:00:00','2026-05-20 11:00:00'),
(2,101,'2026-05-21 10:00:00','2026-05-21 12:30:00'),
(3,108,'2026-05-20 08:00:00','2026-05-20 10:30:00'),
(4,109,'2026-05-21 09:30:00','2026-05-21 11:00:00'),
(5,112,'2026-05-22 07:00:00','2026-05-22 09:00:00'),
(6,114,'2026-05-22 08:30:00','2026-05-22 12:00:00'),

(7,106,'2025-04-01 10:00:00','2025-04-01 10:15:00'),
(8,110,'2024-09-20 09:00:00','2024-09-20 09:10:00'),
(9,111,'2026-04-28 08:00:00','2026-04-28 08:05:00'),
(10,113,'2026-05-10 12:00:00','2026-05-10 12:08:00'),
(11,116,'2021-01-10 09:00:00','2021-01-10 09:12:00'),
(12,117,'2026-03-01 11:00:00','2026-03-01 11:15:00')

select * from sessions

insert into churn_status
(user_id,churn_status,churn_date,user_rating)
values
(101,0,NULL,4.9),
(102,0,NULL,4.0),
(103,0,NULL,4.2),
(105,0,NULL,3.9),
(106,1,'2025-05-02',2.0),
(107,0,NULL,3.8),
(108,0,NULL,4.7),
(109,0,NULL,4.8),
(110,1,'2024-10-01',2.5),
(111,1,'2026-05-01',1.8),
(112,0,NULL,4.6),
(113,1,'2026-05-20',2.2),
(114,0,NULL,5.0),
(115,0,NULL,4.1),
(116,1,'2021-02-02',2.1),
(117,1,'2026-03-15',2.7),
(118,0,NULL,3.9)

select * from churn_status


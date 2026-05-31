select * from users
--Total number of users:
select count(*)[Total number of users] from users

--Total users with different subscription type/Which plan is most popular among users:
select subscription_type,count(user_id) [Number of user] from users group by subscription_type order by subscription_type

--Observation 1:The user base is fairly evenly distributed across subscription types, with Annual and Weekly subscriptions having 6 users each, while Monthly subscriptions have 5 users.

--Highest population of user is from which country?
select top 1 country,count(user_id)[Highest Number of users] from users group by country order by [Highest Number of users] desc

--Observation 2:India has the highest number of registered users in the current dataset, accounting for 4 users

--Frequency of using application of each user
select u.user_id,count(s.user_id)[Frequency of sessions] from users u left join sessions s on u.user_id=s.user_id group by s.user_id,u.user_id

--Observation 3:User 101 recorded the highest login frequency, indicating relatively higher platform engagement compared to other users.

--Maximum session time of each user
select u.user_id,max(DATEDIFF(MINUTE,s.log_in_time,s.log_out_time))[Max hours spent] from users u left join sessions s on u.user_id=s.user_id group by s.user_id,u.user_id 

--Observation 4: User 114 recorded the longest individual session duration among all users in the dataset.

--Number of users using different plans
select distinct amount from subscription
select plan_name,amount,count(user_id)[Number of users] from subscription group by plan_name,amount order by amount desc

--Observation 5: Premium and Weekly plans each have 6 subscribers, while the Basic plan has 5 subscribers

select * from features
select * from feature_usage
--Number of times the features was used
select f.feature_id,count(fu.feature_id)[Number of times feature used] from features f left join feature_usage fu on f.feature_id=fu.feature_id group by f.feature_id

--Observation 6: Daily Streaks (Feature ID 10) emerged as the most frequently used feature, indicating strong user adoption.

--Users engagement with features
select u.user_id,count(fu.feature_id)[Number of features used by users] from users u left join feature_usage fu on u.user_id=fu.user_id group by u.user_id 

--Observation 7: User 101 interacted with the highest number of platform features, demonstrating strong engagement with the product.

select * from users
select * from features
select * from feature_usage
select * from sessions
select * from subscription
select * from churn_status

--Do the old users churns?
with older_users as (
select * from users where sign_up_date<'2023-01-01')
select ou.user_id,cs.churn_status from older_users ou left join churn_status cs on ou.user_id=cs.user_id

--Observation 8: Only 1 out of 6 users who joined before 2023 churned, suggesting that long-term users tend to have higher retention rates than newer users.

--Do the users from the most popular country churns?
with country_users as(
select user_id from users where country in (select top 1 country from users group by country order by COUNT(user_id) desc))
select cu.user_id,cs.churn_status from country_users cu left join churn_status cs on cu.user_id=cs.user_id

--Observation 9: Among users from India, the most represented country in the dataset, only one user churned. This suggests that churn is not concentrated within a specific country.

--Which subscription type churns more?
select distinct subscription_type from users

with annual_subs as(
select user_id from users where subscription_type like 'Annually')
select au.user_id,cs.churn_status from annual_subs au left join churn_status cs on au.user_id=cs.user_id

with Monthly_subs as(
select user_id from users where subscription_type like 'Monthly')
select mu.user_id,cs.churn_status from Monthly_subs mu left join churn_status cs on mu.user_id=cs.user_id

with weekly_subs as(
select user_id from users where subscription_type like 'Weekly')
select wu.user_id,cs.churn_status from weekly_subs wu left join churn_status cs on wu.user_id=cs.user_id

--Observation 10: Weekly subscribers exhibited the highest churn rate (66.7%), while Monthly and Annual subscribers showed significantly lower churn rates (20%). This indicates that shorter subscription commitments may be associated with higher churn risk.

--Which feature churns more?
with highly_used_features_users as (
select user_id from feature_usage where feature_id=(select top 1 feature_id from feature_usage group by feature_id order by count(user_id) desc))
select hufu.user_id,cs.churn_status from churn_status cs join highly_used_features_users hufu on hufu.user_id=cs.user_id

--Observation 11: None of the users who adopted the Daily Streak feature churned in the current dataset, suggesting a potential relationship between Daily Streak usage and user retention.

--Do users with less session time churns?
with less_session_time_users as(
select user_id from sessions group by user_id having min(datediff(MINUTE,log_in_time,log_out_time))<30)
select lstu.user_id,cs.churn_status from churn_status cs join less_session_time_users lstu on lstu.user_id=cs.user_id 

--Observation 12: Users with session durations below 30 minutes exhibited a churn rate of 100%, indicating a strong relationship between low engagement and churn.

--Which plan tends to churning of users?
select distinct plan_name from subscription

with premium_plan as(
select user_id from subscription where plan_name like 'Premium')
select pp.user_id,cs.churn_status from premium_plan pp left join churn_status cs on pp.user_id=cs.user_id

with Basic_plan as(
select user_id from subscription where plan_name like 'Basic')
select bp.user_id,cs.churn_status from Basic_plan bp left join churn_status cs on bp.user_id=cs.user_id

with Weekly_plan as(
select user_id from subscription where plan_name like 'Weekly')
select wp.user_id,cs.churn_status from Weekly_plan wp left join churn_status cs on wp.user_id=cs.user_id

--Observation 13: Users on the Weekly plan demonstrated substantially higher churn levels than those on Basic and Premium plans, highlighting plan type as a potential factor influencing retention.

--Which user uses a combo of subscription type and plan churned?
with users_annual_sub_type as (
select u.user_id from users u join subscription s on u.user_id=s.user_id where u.subscription_type like 'Annually' and s.plan_name in ('Premium','Basic','Weekly')
)
select uast.user_id,cs.churn_status from users_annual_sub_type uast left join churn_status cs on uast.user_id=cs.user_id 

with users_monthly_sub_type as (
select u.user_id from users u join subscription s on u.user_id=s.user_id where u.subscription_type like 'Monthly' and s.plan_name in ('Premium','Basic','Weekly')
)
select umst.user_id,cs.churn_status from users_monthly_sub_type umst left join churn_status cs on umst.user_id=cs.user_id 

with users_weekly_sub_type as (
select u.user_id from users u join subscription s on u.user_id=s.user_id where u.subscription_type like 'Weekly' and s.plan_name in ('Premium','Basic','Weekly')
)
select uwst.user_id,cs.churn_status from users_weekly_sub_type uwst left join churn_status cs on uwst.user_id=cs.user_id 

--Observation 14: Across multiple subscription analyses, Weekly-plan users consistently exhibited higher churn rates than users on other plans, making them the segment most vulnerable to churn in the current dataset.

--Which feature is used only by active users?
select distinct fu.feature_id,f.feature_name from feature_usage fu join features f on f.feature_id=fu.feature_id where user_id in (select distinct user_id from churn_status where churn_status=0 and not churn_status=1)

--Observation 15:Five features were observed among active users, suggesting that these features may be associated with continued platform engagement and retention.

--Which feature is used only by churned users?
select distinct fu.feature_id,f.feature_name from feature_usage fu join features f on f.feature_id=fu.feature_id where user_id in (select distinct user_id from churn_status where churn_status=1 and not churn_status=0)

--Observation 16: Four features were observed among churned users, highlighting potential areas for further investigation into feature effectiveness and user retention.

--Which feature has highest retention rate?
select f.feature_name,count(case when cs.churn_status = 0 then 1 end) * 100.0/ count(*) as retention_rate from feature_usage fu join churn_status cs on fu.user_id = cs.user_id
join features f on fu.feature_id = f.feature_id group by f.feature_name
order by retention_rate desc

--Observation 17: Daily Streaks, AI Assistant, AI Test Paper Analyzer, and Create Notes achieved the highest retention rates, with all users who adopted these features remaining active in the current dataset.

--Users with rating > 4.5 — how many churned?
select count(user_id) from churn_status where user_rating>4.5 and churn_status=1

--Observation 18:No users with ratings above 4.5 churned, suggesting a strong relationship between user satisfaction and retention

--Users with rating < 3 — how many churned?
select count(user_id) from churn_status where user_rating<3 and churn_status=1

--Observation 19: Users with ratings below 3 demonstrated significantly higher churn levels, indicating that low satisfaction may be a major contributor to churn.

--Which country has highest average rating?
with country_wise_users as (
select user_id,country from users group by country,user_id)
select avg(cs.user_rating)[Average rating],cwu.country from country_wise_users cwu join churn_status cs on cwu.user_id=cs.user_id group by cwu.country order by [Average rating] desc

--Observation 20: Italy recorded the highest average user rating among all countries represented in the dataset.

--Average session duration by churn status(for churned user and for active user)
select avg(datediff(MINUTE,log_in_time,log_out_time)) from sessions where user_id in (select user_id from churn_status where churn_status=0)
select avg(datediff(MINUTE,log_in_time,log_out_time)) from sessions where user_id in (select user_id from churn_status where churn_status=1)

--Observation 21:Active users exhibited substantially longer average session durations than churned users, reinforcing the relationship between engagement and retention.

--Total session duration by user
select user_id,sum(datediff(SECOND,log_in_time,log_out_time))/60 [Total session duration(in mins)] from sessions group by user_id order by [Total session duration(in mins)] desc

--Observation 22: User 101 accumulated the highest total session duration, while User 111 recorded the lowest overall engagement time.

--Top 5 most engaged users
select top 5 s.user_id,u.user_name,sum(datediff(SECOND,s.log_in_time,s.log_out_time))/60 [Total session duration(in mins)] from users u join sessions s on u.user_id=s.user_id group by s.user_id,u.user_name order by [Total session duration(in mins)] desc

--Average rating by subscription type
select distinct subscription_type from users
select avg(user_rating)[Average Rating by Annual Type] from churn_status where user_id in (select user_id from users where subscription_type like 'Annually')

select avg(user_rating)[Average Rating by Monthly Type] from churn_status where user_id in (select user_id from users where subscription_type like 'Monthly')

select avg(user_rating)[Average Rating by Weekly Type] from churn_status where user_id in (select user_id from users where subscription_type like 'Weekly')

--Observation 23: Annual subscribers reported the highest average ratings, followed by Monthly and Weekly subscribers. This suggests that long-term subscribers may be more satisfied with the platform.

--Average session duration by subscription type
select avg(datediff(second,log_in_time,log_out_time))/60 [Average session duration by Annual Type] from sessions where user_id in (select user_id from users where subscription_type like 'Annually')

select avg(datediff(second,log_in_time,log_out_time))/60 [Average session duration by Monthly Type] from sessions where user_id in (select user_id from users where subscription_type like 'Monthly')

select avg(datediff(second,log_in_time,log_out_time))/60 [Average session duration by Weekly Type] from sessions where user_id in (select user_id from users where subscription_type like 'Weekly')

--Observation 24:Annual subscribers demonstrated the longest average session durations, followed by Monthly and Weekly subscribers, indicating stronger engagement among long-term subscribers.

--Which plan has highest retention rate?
select top 1 plan_name [Plan with highest retention rate] from subscription where user_id in (select user_id from churn_status where churn_status=0) group by plan_name,user_id order by count(user_id) desc

--Observation 25: Premium plans recorded the highest number of retained users in the dataset. Further analysis would be required to accurately determine the highest retention rate.

--Do users who use more features churn less?
select churn_status from churn_status where user_id in (select user_id from feature_usage group by user_id having count(feature_id)>1)

--Observation 26: Users who engaged with multiple features exhibited no observed churn in the current dataset, suggesting that broader feature adoption may contribute to retention.

--Do users with more sessions churn less?
select churn_status from churn_status where user_id in (select user_id from sessions group by user_id having sum(datediff(second,log_in_time,log_out_time))/60>100)

--Observation 27: Users with higher cumulative session durations exhibited no observed churn, indicating a strong relationship between engagement and retention.

--Do premium users use more features?
select user_id,count(feature_id) [Number of features used] from feature_usage where user_id in (select user_id from subscription where plan_name like 'Premium') group by user_id

--Observation 28: Most Premium subscribers interacted with multiple platform features, indicating deeper product engagement among premium users. One exception was observed where a Premium user interacted with only a single feature
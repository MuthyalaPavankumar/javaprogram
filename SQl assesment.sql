create database Muthyala;
use muthyala;


-- creating table named Users

create table users(
user_id int primary key,
email_domain varchar(255),
country varchar(255),
postal varchar(29),
mobile_app varchar(255),
sign_up_at timestamp);
     select * from users;
     
	-- inserting recordsinto the users 
    INSERT INTO users (user_id, email_domain, country, postal, mobile_app, sign_up_at)
VALUES
  (1, 'example1.com', 'USA', '12345', 'App1', NOW()),
  (2, 'example2.com', 'Canada', 'A1A 1A1', 'App2', NOW()),
  (3, 'example3.com', 'Germany', '123456', 'App3', NOW()),
  (4, 'example4.com', 'Australia', '2000', 'App4', NOW()),
  (5, 'example5.com', 'France', '75001', 'App5', NOW()),
  (6, 'example6.com', 'UK', 'SW1A 1AA', 'App6', NOW()),
  (7, 'example7.com', 'Japan', '100-0001', 'App7', NOW()),
  (8, 'example8.com', 'Spain', '28001', 'App8', NOW()),
  (9, 'example9.com', 'Brazil', '20000-000', 'App9', NOW()),
  (10, 'example10.com', 'India', '110001', 'App10', NOW()),
  (11, 'example11.com', 'Mexico', '06000', 'App11', NOW());
   INSERT INTO users values (12, 'example12.com', 'new york', '87886', 'App12', NOW());
    
    




-- creating table named progress

CREATE TABLE progress (
  user_id int PRIMARY KEY,
  learn_cpp BOOLEAN,
  learn_sql BOOLEAN,
  learn_html BOOLEAN,
  learn_javascript BOOLEAN,
  learn_java BOOLEAN,
  FOREIGN KEY (user_id) REFERENCES users(user_id));
  alter table progress
  modify column learn_cpp int,
  modify column learn_sql int,
  modify column learn_html int,
  modify column learn_javascript int,
  modify column learn_java int;
  
  select * from progress;
       select * from users;
  
  -- inserting rows in table  progress 
  INSERT INTO progress (user_id, learn_cpp, learn_sql, learn_html, learn_javascript, learn_java)
VALUES
 (1, 0, 2, 3, 2, 1),
  (2, 3, 3, 5, 5, 7),
  (3, 4, 9, 7, 6, 7),
  (4, 3, 3, 7, 2, 0),
  (5, 1, 5, 6, 7, 2),
  (6, 3, 3, 1, 5, 2),
  (7, 0, 2, 3, 2, 1),
  (8, 1, 5, 6, 7, 2),
  (9,  3, 3, 7, 2, 0),
  (10, 3, 3, 1, 5, 2),
  (11, 1, 5, 6, 7, 2);
  SELECT * FROM progress;
      INSERT INTO progress values(12, 1, 5, 6, 7, 2);
 
 
 
  
  
  





  
  
-- using inner join selecting (*)
SELECT *
FROM users
INNER JOIN progress ON users.user_id = progress.user_id;

-- we can also select some particular rows instead of using (*)

SELECT users.user_id, users.email_domain, progress.learn_cpp, progress.learn_sql
FROM users
INNER JOIN progress ON users.user_id = progress.user_id;

-- using right join with (*)
SELECT *
FROM users
RIGHT JOIN progress ON users.user_id = progress.user_id;

-- we can also select some particular rows instead of using (*)

SELECT users.user_id, users.country, progress.learn_sql, progress.learn_html
FROM users
RIGHT JOIN progress ON users.user_id = progress.user_id;

-- using left join 
SELECT *
FROM progress
LEFT JOIN users ON users.user_id = progress.user_id;


SELECT COUNT(*) AS mobile_app_users
FROM users
WHERE mobile_app = 'mobile-user';

SELECT *
FROM users LIMIT 5;
SELECT timestamp('%Y-%m-%d %H:00:00', sign_up_at) AS signup_hour, COUNT(*)
 AS signups_count
FROM users
GROUP BY signup_hour
order by signup_hour;


SELECT sign_up_at,
   timestamp('%S', sign_up_at)
FROM users
GROUP BY 1
LIMIT 20;



Select country from users where user_id= 1;



-- no of mobile learners 
SELECT COUNT(*) AS mobile_app_learners
FROM users
WHERE mobile_app IS NOT NULL;


SELECT email_domain, COUNT(*) AS learner_count
FROM users
WHERE email_domain LIKE '%.edu'
GROUP BY email_domain
ORDER BY learner_count DESC
LIMIT 10;

select learn_sql from progress where user_id=10;

select learn_sql from progress where learn_sql>(SELECT AVG(learn_sql) FROM progress);

-- sum of the total 

SELECT user_id,
       SUM(learn_cpp) AS cpp_total,
       SUM(learn_sql) AS sql_total,
       SUM(learn_html) AS html_total,
       SUM(learn_javascript) AS javascript_total,
       SUM(learn_java) AS java_total
FROM progress
WHERE user_id = 1;







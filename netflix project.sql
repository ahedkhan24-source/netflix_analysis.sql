-- netflix project 
-- creating my database 
create database if not exists netflix_db;
use netflix_db;

-- creating my table 
CREATE TABLE netflix ( show_id VARCHAR(10) PRIMARY KEY, 
type VARCHAR(10), 
title VARCHAR(255), director VARCHAR(550), 
cast_members TEXT, country VARCHAR(250), 
date_added VARCHAR(50), release_year INT, 
rating VARCHAR(20), duration VARCHAR(20), 
listed_in VARCHAR(255), description TEXT );

-- count movie and tv shows 
select type, count(*) as tv_and_movie from netflix group by type;

-- List all movies released in a specific year (e.g., 2020).
select type,count(*) from netflix where type='Movie' and release_year= '2020';




-- Identify the longest movie on Netflix. 
select *,cast(substring_index(duration,' ',1) as unsigned ) as duration_movie

 from netflix where type='Movie'
 order by duration_movie desc
 limit 1 ;

-- Find content added in the last 10 years.
use netflix_db;
select * from netflix 
where str_to_date(date_added,'%M %d, %y') > date_sub(curdate(), interval 10 year);


-- List all TV shows with more than 5 seasons.

select type , cast(substring_index(duration,' ',1)as unsigned) as seasons 
from netflix where type = 'TV Show'and Duration > 5 ;


-- Find all movies/TV shows by director 'S. Shankar'.

select * from netflix 
where TRIM(upper(director)) like '%S. SHANKAR%';


-- Find each year and the average numbers of content release in India, return top 5 years.

with my_cte as (SELECT release_year,count(*) as total_release,dense_rank() over 
(order by count(*) desc)
as my_rank 
from netflix
where trim(upper(country)) like '%INDIA%'
group by release_year)
select * from my_cte 
where my_rank<=5;


use netflix_db ;


-- list all moveis that are documentaries.

select * from netflix where type= 'Movie'
and trim(upper(listed_in)) like '%DOCUMENTARIES%';


-- Find all content without a director.
select * from netflix where director='';


-- Find how many movies actor 'Joe' appeared in in the last 10 years.


select * from netflix where trim(upper(cast_members)) like '%JOE%';


-- Categorize content as 'Bad' if description contains 'kill'/'violence', else 'Good'. Count items.

with my_cte as (select *,
case when description like '%kill%' or description like '%violence%' then 'Bad'
else 'Good' end as category_type from netflix)
select category_type ,count(*) as Counting 
from my_cte group by category_type;



-- Find the most frequent rating for movies and TV shows.
with my_cte as (select type , rating, count(*) as frequent_type,
dense_rank() over (partition by type order by count(*) desc) as my_rank
from netflix group by type,rating)

select * from my_cte where my_rank=1;


-- Find how many movies actor 'Salman Khan' appeared in in the last 10 years.
-- postgre sql query
SELECT * FROM "netflix_copy" where
trim(upper(casting)) like '%SALMAN KHAN%'
and release_year>=extract(year from current_date)-10;




-- number of content for each actor 
-- runs only in postgresql
with my_cte as (select 
unnest(string_to_array(casting,',')) as casting 
from netflix_copy)

select casting,count(*) from my_cte 
group by casting order by count(*) desc;

-- Count the number of items in each genre.
-- in post gre sql
with my_cte as (select 
trim(unnest(string_to_array(listed_in,','))) as genre
from netflix)
select genre ,count(*) as counted_genre from my_cte 
group by genre 
order by count(*) desc;

-- Find the top 5 countries with the most content.

-- runs only in postgresql

with my_cte as (select trim(unnest(string_to_array(country,','))) as countries

from netflix_copy)

select countries, count(*)

from my_cte

group by countries

order by count(*) desc

limit 5;




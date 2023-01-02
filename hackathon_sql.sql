use sakila ;



-- task 1

select concat(first_name, last_name)as fullname, last_update from actor;


-- task 2
-- task 2a
select  concat(a.first_name ,' ', a.last_name) as fullname  from actor a join actor_info ai on a.actor_id=ai.actor_id
where a.first_name<> ai.first_name or a.last_name<>ai.last_name;

-- task 2b
select  concat(a.first_name ,' ', a.last_name) as fullname  from actor a join actor_info ai on a.actor_id=ai.actor_id
where a.first_name<> ai.first_name or a.last_name<>ai.last_name;

-- task 2c

select count(distinct(concat(first_name ,' ',last_name) ) ) from actor;



-- task 3

select concat(first_name ,' ',last_name) as fullname from actor group by fullname 
having count(fullname) > 1 ;

select distinct(concat(first_name ,' ',last_name) ) from actor;

-- task 4

select fullname , category , max( no_of_films) from
(select actor_id, concat(first_name,' ',last_name)as fullname,category, count(category) as no_of_films from actor join film_actor using (actor_id) 
join film_list on film_actor.film_id = film_list.fid 
group by fullname, category order by actor_id , no_of_films desc) as table1
group by fullname ;
 
 -- or
 
 
select first_name , category , max( no_of_films) from
(select actor_id, first_name,  category, count(category) as no_of_films from actor join film_actor using (actor_id) 
join film_list on film_actor.film_id=film_list.fid 
group by first_name, category order by actor_id , no_of_films desc) as table1
group by first_name ;

-- task 5

select * from film_list;

-- task 5 a 
select count(category), category from film_list group by category order by count(category) desc ;

 -- task 5 b
 
-- movies suitable for kid

select * from film_list where rating in ('G',
-- restricted fro all under 16
    'R',
-- restricted fro all under 18
 'Nc-17');

-- TASK 6 a
select title,replacement_cost from film where replacement_cost <=9 order by replacement_cost ;

-- task 6 b 
select title,replacement_cost from film where replacement_cost between 15 and 20 order by replacement_cost ;

-- task 6 c

select title,replacement_cost, rental_rate from film  order by replacement_cost desc , rental_rate asc;

-- task 7 
select * from film_list;


select title, count(actor_id) as no_of_actors from film join film_actor using(film_id) group by title order by no_of_actors desc;

-- task 8


select title from film where title  like 'k%' or title like 'q%';


-- task 9 

select title, actors from film_list where title='agent truman';

-- task 10

select title, category from film_list where category ='family';

-- task 11 



select film_id, title, count(inventory_id) from payment p join rental r using(rental_id) right join inventory i using (inventory_id) 
join film using(film_id)
group by film_id order by count(inventory_id) desc;

-- task 12
 
 select name,avg (replacement_cost - rental_rate) as diff from film join film_category using(film_id)
join category using(category_id)
 group by name having avg(replacement_cost - rental_rate) >15 order by diff desc ;
 
 
-- task 13
 
 select name , count(film_id) from film join film_category using(film_id) join category using(category_id) 
 group by name having count(film_id) between 60 and 70 order by count(film_id) ;












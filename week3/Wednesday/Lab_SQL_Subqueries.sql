use sakila;

## 1. List all films whose length is longer than the average of all the films.
select title from film 
where length > (select avg(length) from film);

## 2. How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) from inventory 
where film_id = (select film_id from film where title like "Hunchback Impossible");

## 3. Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor 
where actor_id in (select actor_id from film_actor
                          where film_id = (select film_id from film where title like "Alone Trip"));
                          
 ## 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
 select title from film
 where film_id in (select film_id from film_category
						  where category_id = (select category_id from category where name like "Family"));
 
 ## 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
 ##    Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

# using subqueries
select concat(customer.first_name, '', customer.last_name) 'Name', '', email 'Email' from customer
where address_id in (select address_id from address
       where city_id in (select city_id from city
               where country_id in (select country_id from country where country like "Canada")));
 
# using join
select email from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id
where country.country like "Canada"; 
  
## 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
##    First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.  
select title FROM film
WHERE film_id in (SELECT film_id FROM film_actor
WHERE actor_id LIKE (select actor_id from actor
join film_actor
using(actor_id)
group by actor.actor_id
order by count(actor.actor_id) desc limit 1));
                
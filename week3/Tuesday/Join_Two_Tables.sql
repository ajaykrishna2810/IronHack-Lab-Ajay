use sakila;
## 1. Which actor has appeared in the most films?
select distinct first_name, last_name, count(actor.actor_id) from actor
join film_actor 
on actor.actor_ID = film_actor.actor_ID
group by actor.actor_id
order by count(actor.actor_id) desc limit 1;

## 2. Most active customer (the customer that has rented the most number of films)
select first_name, last_name from customer
join rental  
on customer.customer_id = rental.customer_id
group by customer.customer_id
order by count(customer.customer_id) desc limit 1;

## 3. List number of films per category.
select `name`, count(category_id) from category
left join film_category
using(category_id)
group by category_id;	

## 4. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff
join address
using(address_id)
group by address, first_name, last_name; 

## 5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
select title, language.name from film
join `language` 
using(language_id)
where title like "M%" and language.name = 'English' or language.name = 'Italian'
order by language.name;

## 6. Display the total amount rung up by each staff member in August of 2005.
select distinct first_name, last_name, sum(payment.amount)  from staff
join payment
using (staff_id)
where payment_date like '2005-08%'
group by staff_id;

## 7. List each film and the number of actors who are listed for that film.
select distinct title, film_actor.film_id from film
join film_actor
using (film_id);

## 8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select last_name, sum(payment.amount) from customer
join payment
using (customer_id)
group by last_name
order by last_name asc;

## 9. Write sql statement to check if you can find any actor who never particiapted in any film.
select first_name, last_name, sum(film_actor.actor_id) from actor
left join film_actor
using (actor_id)
group by actor_id;

## 10. get the addresses that have NO customers, and ends with the letter "e"
select address from address
left outer join customer
using (address_id)
where address like '%e' and customer.customer_id is Null;

## Optional:  what is the most rented film?
select distinct title, count(film_id) from film
join inventory
using (film_id)
join rental
using (inventory_id)
group by film_id
order by count(film_id) desc limit 1;
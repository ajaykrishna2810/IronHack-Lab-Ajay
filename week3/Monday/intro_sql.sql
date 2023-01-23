select * from sakila.actor, sakila.address, sakila.category, sakila.city, sakila.country, sakila.customer, sakila.film, sakila.film_actor, sakila.film_category, sakila.film_text, sakila.inventory, sakila.language, sakila.payment, sakila.rental, sakila.staff, sakila.store; 
# all the columns from all the tables

select language_id	as lan_ID from sakila.language;	# selected the column 'language_id' as 'lan_ID' from the table 'sakila.language'name
select distinct(name) from sakila.language; # selecting unique/distinct entries in the column 'name' in the table 'sakila.language'

select address_id from sakila.address; # getting the column 'address_id' from the table 'address'
select title from sakila.film; # getting the column 'title' from the table 'film'

select count(*) as store_count from sakila.store; # counts the number of rows from the table 'sakila_store' and saves as 'store_count'
select count(*) as employee_count from sakila.staff; # counts the number of employees from the table 'sakila.staff' and saving as 'employee_count'
select first_name from sakila.staff; # getting the column 'first_name' from the table 'sakila.staff'
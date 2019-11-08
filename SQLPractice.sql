/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */



/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */
select * 
from Facilities
where
	membercost > 0

/* Q2: How many facilities do not charge a fee to members? */
select count(name) from Facilities
where
	membercost = 0

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */
select *
from Facilities
where
	membercost > 0
	and
	(membercost/monthlymaintenance)*100 < 20


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */
select *
from Facilities
where
	facid in (1,5)


/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */
select
	name,
	monthlymaintenance,
	CASE
		WHEN monthlymaintenance > 100 THEN 'expensive'
		ELSE 'cheap'
	END 'cheapOrNot'
from Facilities

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */
select top 1 firstname, surname from members
order by joindate desc


/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */
select 
	name as 'Court',
	firstname + ' ' + surname as 'Name'
from 
	members m inner join 
	bookings b on m.memid = b.memid inner join
	Facilities f on b.facid = f.facid
where
	name like 'Tennis Court%'
group by
	name,
	firstname + ' ' + surname
order by
	2

/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */
select 
	name as 'Facility',
	CASE
		WHEN  m.memid = 0 then firstname
		ELSE firstname + ' ' + surname 
	END as 'Name',
	CASE
		WHEN m.memid = 0 then guestcost * slots
		ELSE membercost * slots
	END as 'Cost'
from 
	members m inner join 
	bookings b on m.memid = b.memid inner join
	Facilities f on b.facid = f.facid
where
	cast(starttime as date) = '2012-09-14'
	and
	(membercost > 30 or guestcost > 30)
Order by cost desc
	


/* Q9: This time, produce the same result as in Q8, but using a subquery. */

select 
	name as 'Facility',
	CASE
		WHEN  m.memid = 0 then firstname
		ELSE firstname + ' ' + surname 
	END as 'Name',
	CASE
		WHEN m.memid = 0 then guestcost * slots
		ELSE membercost * slots
	END as 'Cost'
from 
	members m inner join 
	bookings b on m.memid = b.memid inner join
	Facilities f on b.facid = f.facid
where
	bookid in 
		(select 
			bookid from bookings bo inner join 
			Facilities fa on bo.facid = fa.facid
		where 
			cast(starttime as date) = '2012-09-14'
			and
			(membercost > 30 or guestcost > 30))
Order by cost desc

/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */
SELECT 
	name,
	SUM(CASE
		WHEN m.memid = 0 then guestcost * slots
		ELSE membercost * slots
	END) as 'TotalRevenue'
FROM 
	members m inner join 
	bookings b on m.memid = b.memid inner join
	Facilities f on b.facid = f.facid
GROUP BY
	name
HAVING
	SUM(CASE
		WHEN m.memid = 0 then guestcost * slots
		ELSE membercost * slots
	END) < 1000
ORDER BY
	TotalRevenue desc

/*
Using Transact-SQL : Exercises
------------------------------------------------------------
Exercises for section 6 Subqueries

e6.1	List the paper with the lowest average enrolment per instance. Ignore all papers with no enrolments.
	Display the paper ID, paper name and average enrolment count.
*/
	select top 1 pa.PaperID, PaperName, average from Paper as pa
	join (select PaperID, avg([Enrolment Count]) as average from
	(select PaperID, SemesterID, cast(count(*) as decimal(9,4)) as [Enrolment Count] from Enrolment group by PaperID, SemesterID) as e
	group by PaperID) as p on pa.PaperID = p.PaperID order by average

	select p.PaperID, PaperName, avg(Average) as  [Enrolment Count] 
	from (select PaperID, SemesterID, cast(count(*) as decimal(9,4)) as [Average] from Enrolment
	group by PaperID, SemesterID) ec
	join Paper p on p.PaperID = ec.PaperID
	group by p.PaperID, PaperName
	order by [Enrolment Count] asc
/*
e6.2	List the paper with the highest average enrolment per instance. 
	Display the paper ID, paper name and average enrolment count.
*/
	select top 1 pa.PaperID, PaperName, average from Paper as pa
	join (select PaperID, avg([Enrolment Count]) as average from
	(select PaperID, SemesterID, cast(count(*) as decimal(9,4)) as [Enrolment Count] from Enrolment group by PaperID, SemesterID) as e
	group by PaperID) as p on pa.PaperID = p.PaperID order by average desc

/*
e6.3	For each paper that has a paper instance: list the paper ID, paper name, 
	starting date of the earliest instance, starting date of the most recent instance, 
	the minimum number of enrolments in the instances,
	maximum number of enrolments in the instances and 
	average number of enrolments across all	the instances.
*/

select p.PaperID, p.PaperName, s.SemesterID, s.StartDate from Paper p
join PaperInstance i on p.PaperID = i.PaperID
join Semester s on i.SemesterID = s.SemesterID
order by s.StartDate

select PaperID, SemesterID, cast(count(*) as decimal(9,4)) as [Enrolment Count] from Enrolment group by PaperID, SemesterID

/*
e6.4	Which paper attracts people with long names? Find the background statistics 
	to support a hypothesis test: for each paper with enrolments calculate the mean full name length, 
	sample standard deviation full name length & sample size (that is: number of enrolments).
*/

/*
e6.5	Rank the semesters from the most loaded (that is: the highest number of enrolments) to
	the least loaded. Calculate the ordinal position (1 for first, 2 for second...) of the semester
	in this ranking.

Exercises for section 7

--Use UNION to solve these tasks. 
--Note that these tasks could possibly be solved by another non-UNION statement.
--Can you also write a non-UNION statement that produces the same result?   

e7.1	In one result, list all the people who enrolled in a paper delivered during 2019 and
	all the people who have enrolled in IN605. 
	The result should have three columns: PersonID, Full Name and the reason the person
	is on the list - either 'enrolled in 2019' or 'enrolled in IN605'

e7.2	Produce one resultset with two columns. List the all Paper Names and all the Person Full Names in one column.
	In the other column calculate the number of characters in the name.
	Sort the result with the longest name first.

*/
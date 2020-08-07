/*
Using Transact-SQL : Exercises
------------------------------------------------------------

/*
Exercises for section 8 : INSERT

*In all exercises, write the answer statement and then execute it.


e8.1	Write a statement to create 2 new papers: IN338 and IN238 Extraspecial Topic 

		insert Paper(PaperID, PaperName)
		values ('IN338', 'Web4'), ('IN238', 'DB4')

e8.2	Create a new user (yourself)
		Write statements that will add three enrolments for you
		in papers you have completed (Add extra papers if required).

		select * from person
		select * from Paper
		select * from Enrolment where PaperID = 'IN605'
		select * from PaperInstance where SemesterID = '2021S1'
		select * from Semester
		
		insert PaperInstance (PaperID, SemesterID)
		values ('IN610', '2019S2')

		insert Person (PersonID, GivenName, FamilyName, FullName )
		values ( '112', 'Rubandass', 'Jhondass', 'Rubandass Jhondass')

		insert Enrolment (PaperID, SemesterID, PersonID)
		values ('IN605', '2019S2', '112'), ('IN610', '2019S2', '112'), ('IN612', '2019S2', '112')


e8.3	Imagine that every paper on the database will run in 2021.
		Write the statements that will create all the necessary paper instances. You will need to add the Semester
		This can be done using a subselect or a left outer join.

		insert Semester (SemesterID, StartDate, EndDate)
		values ('2021S1', '02-feb-2021', '02-jun-2021')

		insert PaperInstance (PaperID, SemesterID)
		select distinct pa.PaperID, '2021S1' from Paper pa
		left join PaperInstance i on pa.PaperId = i.PaperID
		

e8.4	Imagine a strange path-of-study requirement: in semester 2020S2
		Find all people who are currently enrolled in IN605 and not enrolled in IN612 and enrol them in IN238.
		Write a statement to create the correct paper instance for IN238.
		Write a statement that will find all people enrolled in IN605 (semester 2019S2)
		but	not enrolled in IN612 (semester 2019S2) and 
		will create IN238 (semester 2020S1) enrolments for them. Build it up one step at a time.
		
		1. create paper, semester and paper instance data
		2. Find IN605/2019S2 enrolments that are not in IN612
		3. insert new enrolments

		insert Enrolment (PaperID, SemesterID, PersonID)

		select * from Enrolment
		where PersonID NOT IN
		(select PersonID from Enrolment
		where PaperID = 'IN612') and PaperID = 'IN605'

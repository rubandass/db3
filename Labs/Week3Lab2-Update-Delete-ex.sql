/*
Using Transact-SQL : Exercises
------------------------------------------------------------
Note: I will be marking off the first lab from the second week on Friday, make sure you have committed your work to GitHub.
		


Exercises for section 9 : UPDATE

*In all exercises, write the answer statement and then execute it.


e9.1	Change the name of IN628 to 'Object-Oriented Software Development (discontinued after 2020)'

		update paper set PaperName = 'Object-Oriented Software Development (discontinued after 2020)'
		where PaperID = 'IN628'

e9.2	For all the semesters that start after 01-June-2018, alter the end date
		to be 14 days later than currently recorded.

		update Semester set EndDate = EndDate + 14
		from Semester
		where StartDate > '01-Jun-2018'

e9.3	Imagine a strange enrolment requirement regarding the students
		enrolled in IN238 for 2020S1 [Ensure your database has all the records
		created by exercise e8.4]: all students with short names [length of FullName
		is less than 12 characters] must have their enrolment moved 
		from 2020S1 to 2019S2. Write a statement that will perform this enrolment change.

		select * from Paper

Exercises for section 10 : DELETE

*In all exercises, write the answer statement and then execute it.

e10.1	Write a statement to delete all enrolments for IN238 Extraspecial Topic in semester 2020S11.

		

e10.2	Delete all PaperInstances that have no enrolments.

		
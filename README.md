# Pewlett_Hackard_Analysis

## Purpose
The purpose of this project is to helps prepare Pewlett-Hackard for the “silver tsunami” as many current employees reach retirement age. This analysis focuses on: 
  1. Identifying the retiring employees by their title.
  2. Determing the sum of retiring employees grouped by title.
  3. Identifying the employees eligible for participation in the mentorship program.
  4. Followed by creating a report that summarizes this analysis.

## Resources
Data Source:
-	[Six csv files](Data/)

Software:
-	PostreSQL
-	pgAdmin 4
-	Quick DBD

## Results
### 1. The list of retiring employees

The table includes employee number, first name, last name, title, from-date and to-date.
The query returns 133,776 rows.
The table displays a list of employees who are going to retire in the next few years.
The list is very extensive, bu the snapshot below gives us some insights about the query. Some employees appear more than once due to change of title during their career at Pewlett-Hackard.
![retirement_titles](Queries/retirement_titles.png)

Overview of the code

To retrieve the data, two tables were merged together - employees and titles - with the inner join and filtered by birth date, that indicates who is about to retire in the next few years with the command WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31').

Drawback: this query contains all the titles that employees acquired while working at Pewlett-Hackard over the years. This resulted in duplicates, some employees appear two times or more; therefore, the number of retiring employees is incorrect.

### 2. The list of retiring employees without duplicates

The table includes employee number, first name, last name, title, from-date and to-date.
The query returns 90,398 rows.
The table displays a list of employees who are going to retire in the next few years.
In the table each employee is listed only once, by her or his most recent title.

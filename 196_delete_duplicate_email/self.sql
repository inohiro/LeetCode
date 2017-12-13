-- 196. Delete Duplicate Emails
-- https://leetcode.com/problems/delete-duplicate-emails/

/*
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
*/

delete from Person
where Id in (
    select
        Id
    from (
        select
    	    p2.Id
	from
            Person p1
	    inner join Person p2
	    on p1.Email = p2.Email and p1.Id < p2.Id
    ) as tmp  -- avoid Error 1093
)
;

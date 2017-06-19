#Exercise 1
# connecting to the database
USE fe513data;

SHOW databases;
SHOW tables;

# describing the column information for the accounting table
DESCRIBE accounting;

# Using the SELECT query to show the number of records with NULL value in commonequity column.
SELECT COUNT(*) FROM accounting WHERE commonequity IS NULL;
SELECT COUNT(row_names) FROM accounting WHERE commonequity IS NULL;


# Use SELECT query to show all records from ticker GOOGL.
SELECT * FROM accounting WHERE ticker = 'GOOGL';

#Example testing
#SELECT * FROM accounting WHERE year >= 2015;

# Use SELECT query to show total number of commonequity of GOOGL records. The result should only have 1 row.
SELECT SUM(commonequity) FROM accounting WHERE ticker = 'GOOGL';

#Exercise 2
#Use both component and accounting table. Write only one SELECT query to return the results. 
#The results should include all records in accounting table whose ticker is included in component table.
#Created two different SELECT statements for this as a RIGHT JOIN seemed needed in order to match the records from the accounting table to the alues in the component table. 
DESCRIBE accounting;
DESCRIBE component; 

SELECT * FROM accounting, component
WHERE accounting.ticker = component.ticker;

SELECT * FROM accounting
RIGHT JOIN component ON accounting.ticker = component.ticker;

# Write only one SELECT query with JOIN syntax to return the results. 
#The results should include all records from accounting table whose ticker is included in component table and the year of the record is 2016.
SELECT * FROM accounting
RIGHT JOIN component ON accounting.ticker = component.ticker
WHERE year = 2016;


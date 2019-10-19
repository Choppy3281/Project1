USE Normalization1;
DROP TABLE IF EXISTS location;

ALTER TABLE my_contacts
    ADD COLUMN city VARCHAR (30);

UPDATE my_contacts
    SET city = SUBSTRING_INDEX(location, ',', 1)
    WHERE my_contacts.city IS NULL
    ORDER BY city;

ALTER TABLE my_contacts
    ADD COLUMN state VARCHAR(30);

UPDATE my_contacts
    SET state = RIGHT(location, 2)
    WHERE my_contacts.state IS NULL
    ORDER BY state;

# ALTER TABLE my_contacts
#   DROP COLUMN location;

#Create two columns being state and city in the main table and then create the seperate tables using the temporary columns.



USE Normalization1;
#DROP TABLE IF EXISTS seeking_copy;

ALTER TABLE my_contacts
    ADD COLUMN seeking_copy VARCHAR (30);

UPDATE my_contacts
    SET my_contacts.seeking_copy = SUBSTRING_INDEX(seeking, ',', 1)
    WHERE my_contacts.seeking_copy IS NULL
    ORDER BY seeking_copy;

ALTER TABLE my_contacts
    ADD COLUMN seeking_copy2 VARCHAR(30);

UPDATE my_contacts
    SET my_contacts.seeking_copy2 = SUBSTRING_INDEX(seeking, ',', -1)
    WHERE my_contacts.seeking_copy2 IS NULL
    ORDER BY seeking_copy2;

# ALTER TABLE my_contacts
#   DROP COLUMN seeking_copy;
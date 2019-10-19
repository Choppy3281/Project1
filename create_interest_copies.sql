USE Normalization1;
DROP TABLE IF EXISTS interests_list;

# ALTER TABLE my_contacts
#     ADD COLUMN interest_copy VARCHAR (30);
#
# UPDATE my_contacts
#     SET my_contacts.interest_copy = SUBSTRING_INDEX(interests, ',', 1)
#     WHERE my_contacts.interest_copy IS NULL
#     ORDER BY interest_copy;

ALTER TABLE my_contacts
    ADD COLUMN interest_copy2 VARCHAR (30);

UPDATE my_contacts
    SET my_contacts.interest_copy2 = SUBSTRING_INDEX(interests, ',', -1)
    WHERE my_contacts.interest_copy2 IS NULL
    ORDER BY interest_copy2;

# ALTER TABLE my_contacts
#   DROP COLUMN interest_copy2;
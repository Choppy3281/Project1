USE Normalization1;
DROP TABLE IF EXISTS interests;

CREATE TABLE interests(
    interests_ID int(11) NOT NULL auto_increment,
    interests VARCHAR(252) NOT NULL,
    PRIMARY KEY (interests_ID)
)AS
    SELECT DISTINCT interests
    FROM my_contacts
    WHERE interests IS NOT NULL
    ORDER BY interests;

ALTER  TABLE my_contacts
    ADD COLUMN interests_ID INT(11);

UPDATE my_contacts
    INNER JOIN interests
    ON interests.interests = my_contacts.interests
    SET my_contacts.interests_ID = interests.interests_ID
    WHERE interests.interests IS NOT NULL;

SELECT mc.first_name, mc.last_name, mc.seeking, mc.interests_ID, it.interests
    FROM interests AS it
        INNER JOIN my_contacts AS mc
    ON it.interests_ID = mc.interests_ID;

# ALTER TABLE my_contacts
#    DROP COLUMN interests;
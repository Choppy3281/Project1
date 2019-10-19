USE Normalization1;
DROP TABLE IF EXISTS seeking;

CREATE TABLE seeking(
    seeking_ID int(11) NOT NULL auto_increment,
    seeking VARCHAR(252) NOT NULL,
    PRIMARY KEY (seeking_ID)
)AS
    SELECT DISTINCT seeking
    FROM my_contacts
    WHERE seeking IS NOT NULL
    ORDER BY seeking;

ALTER  TABLE my_contacts
    ADD COLUMN seeking_ID INT(11);

UPDATE my_contacts
    INNER JOIN seeking
    ON seeking.seeking = my_contacts.seeking
    SET my_contacts.seeking_ID = seeking.seeking_ID
    WHERE seeking.seeking IS NOT NULL;

SELECT mc.first_name, mc.last_name, mc.seeking, mc.seeking_ID, sk.seeking
    FROM seeking AS sk
        INNER JOIN my_contacts AS mc
    ON sk.seeking_ID = mc.seeking_ID;

# ALTER TABLE my_contacts
#    DROP COLUMN seeking;

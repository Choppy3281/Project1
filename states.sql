USE Normalization1;
DROP TABLE IF EXISTS state;

CREATE TABLE state(
    state_ID int(11) NOT NULL auto_increment,
    state VARCHAR(25) NOT NULL,
    PRIMARY KEY (state_ID)
)AS
    SELECT DISTINCT state
    FROM my_contacts
    WHERE state IS NOT NULL
    ORDER BY state;

ALTER  TABLE my_contacts
    ADD COLUMN state_ID INT(11);

UPDATE my_contacts
    INNER JOIN state
    ON state.state = my_contacts.state
    SET my_contacts.state_ID = state.state_ID
    WHERE state.state IS NOT NULL;

SELECT mc.first_name, mc.last_name, mc.gender, mc.state_ID, st.state
    FROM state AS st
        INNER JOIN my_contacts AS mc
    ON st.state_ID = mc.state_ID;

# ALTER TABLE my_contacts
#     DROP COLUMN state;
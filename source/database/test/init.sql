CREATE SCHEMA codemonkey;

CREATE TABLE codemonkey.logins (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);

INSERT INTO codemonkey.logins (username, password) VALUES ('user1', 'pass1');
INSERT INTO codemonkey.logins (username, password) VALUES ('user2', 'pass2');
INSERT INTO codemonkey.logins (username, password) VALUES ('user3', 'pass3');
INSERT INTO codemonkey.logins (username, password) VALUES ('user4', 'pass4');

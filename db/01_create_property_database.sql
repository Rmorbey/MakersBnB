CREATE TABLE properties(id SERIAL PRIMARY KEY, description VARCHAR(200), contact VARCHAR(600), picture_url VARCHAR(200));
ALTER TABLE properties ADD COLUMN picture_url VARCHAR(200);

-- Altering properties database to have user_id foreign key. (Made test user database in 02).

ALTER TABLE properties ADD COLUMN user_id INTEGER REFERENCES users (id);
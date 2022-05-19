CREATE TABLE properties(id SERIAL PRIMARY KEY, description VARCHAR(200), contact VARCHAR(600), picture_url VARCHAR(200));
-- ALTER TABLE properties ADD COLUMN picture_url VARCHAR(200);

CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(140));

-- Adds column for foreign key so for every property, there is a user linked to it.
ALTER TABLE properties ADD COLUMN user_id INTEGER REFERENCES users (id);

-- Adds column for price_per_night for every property.
ALTER TABLE properties ADD COLUMN price_per_night VARCHAR(100);
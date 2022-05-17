CREATE TABLE properties(id SERIAL PRIMARY KEY, description VARCHAR(200), contact VARCHAR(600), picture_url VARCHAR(200));
-- ALTER TABLE properties ADD COLUMN picture_url VARCHAR(200);

CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(140));

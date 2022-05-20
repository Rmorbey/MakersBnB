ALTER TABLE properties ADD COLUMN user_id INTEGER REFERENCES users (id);

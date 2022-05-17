       
            .    !__________!    .    _______
           /_\   |____  ____|   /_\   |__*__|
          __|__  {____}{____}  __|__  |__*__|
        __|_*_|__%%%%%%%%%%%%__|_*_|__|__*__|__
          |   | %%%%%%%%%%%%%% |   |  |/   \|
               %%%%%%%%%%%%%%%%
              %%%%%%%%%%%%%%%%%%
             %%%%%%%%%%%%%%%%%%%%
            /||||||||||||||||||||\
            ||||||||||||||||||||||


# Makers BnB
### A 5-day Makers project by Anish, Archie, Luiza, Russell and Tim - Team Hybrid Heroes
---

## Database setup
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE makers_bnb;
3. Connect to the database using the pqsl command \c makers_bnb;
4. Run the query we have saved in the file 01_create_property_database.sql


For this Week 5 afternoons project, we were set the task of cloning the getaway monolith, AirBnB. Let's hope our own efforts aren't as detrimental to the London housing market :)

Our main specification was as follows:
- Any signed-up user can list a new space
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space
- Nights for which a space has already been booked should not be available for users to book that space
- Until a user has confirmed a booking request, that space can be booked for that night.

Along with these specifications, wider goals were provided. With a view to implementing:
- Accepting/denying requests
- Text message and email notification
- Chat functionality between host and guest, once booking is confirmed
- Basic payment processing through Stripe

Good luck to us.

## Day 1

Following the AGILE process we discerned the user stories of a Minimum Viable Product within the above specs.

```
As a user,
So that I can host my property,
I would like to list a space.`

As a user,
So that I can go on holiday,
I would like to view a space.

As a user,
So that I can make a booking,
I would like to contact the host.
```

This gave us a general idea of how we would begin to set up our first class - Property.

If we were to define our intended MVP right now, it would be:
```
A web app that displays all it's listings on the front page.
Users can follow a link to list a property. 
All properties hold minimal contact information.
With which a potential guest could manually contact a potential host.
```

### Property Object

| Responsibilities | method  |
| ----------- | ----------- |
| List the property table(descriptions) | .all |
| Contain Description/Contact/Location | .view_property |
| Add property to database | .add |

This enabled our initial thoughts on a database, table and respective schema.

```
makers_bnb=# CREATE TABLE properties(id SERIAL PRIMARY KEY, description VARCHAR(200), contact VARCHAR(600));
```
| table: Properties |   |   |
| ----------- | ----------- | ----------- |
| id | description  | contact_details
| 1 | 2 bed home | anish@makersbnb.com
| 2 | 4 bed flat | russell@makersbnb.com

Following these guidlines we split up into teams, one to set up an initial web app base, and the other to begin TDD'ing the initial class objects.

## Day 2

Having begun with some hiccups, and a few lessons in merging branches. We're approaching our MVP. Having merged the two pairs' independent work, the site is almost there. During this process the team decided to implement images into listings, in the interest of keeping the app recognisably a BnB app at this early stage. Adding a new column to our database...

| table: Properties |   |   |   |
| ----------- | ----------- | ----------- |  ----------- |
| id | description  | contact_details | picture_url |
| 1 | 2 bed home | anish@makersbnb.com | https://imgur.com/jFaSxym |
| 2 | 4 bed flat | russell@makersbnb.com| https://imgur.com/QsFxtm|

With the MVP fast approaching, further work has been done collating the User Stories of the headline specifications.

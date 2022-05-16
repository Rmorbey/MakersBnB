       
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
### A makers project by Anish, Archie, Luiza, Russell and Tim - Team Hybrid Heroes
---

For this Week 5 afternoons project, we were set the task of cloning the getaway monolith, AirBnB. 

Our main specification was as follows:
- Any signed-up user can list a new space
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space
- Nights for which a space has already been booked should not be available for users to book that space
- Until a user has confirmed a booking request, that space can be booked for that night.

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

### Property

| Responsibilities | Collaborators  |
| ----------- | ----------- |
| List the property (description) |  |
| Description/Contact/Location |  |
| Viewing properties (description) |  |

This enabled our initial thoughts on a database, table and respective schema.

```
makers_bnb=# CREATE TABLE properties(id SERIAL PRIMARY KEY, description VARCHAR(200), contact VARCHAR(600));
```
| table: Properties |   |   |
| ----------- | ----------- | ----------- |
| id | description  | contact_details
| 1 | 2 bed home | anish@makersbnb.com
| 2 | 4 bed flat | russell@makersbnb.com

Following these guide lines we'll be able to produce our MVP by Day 2, Day 3 at most. EAZY PEAZY

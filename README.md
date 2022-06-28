       
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

![MakersBnB full](https://user-images.githubusercontent.com/101583630/176161766-d6dcfe13-9813-4066-9e8f-afe76fb6929a.png)

## Contributors of Team Hybrid Heroes

* [Tim Graham](https://github.com/timbo-graham)
* [Anish Kakaiya](https://github.com/AKCDNG)
* [Luiza Gretzk](https://github.com/LGretzk)
* [Archie Martin](https://github.com/archiemartini)
* [Russell Morbey](https://github.com/Rmorbey)

## Description

This is a clone of AirBnB built using Ruby, Sinatra and PostgreSQL. It was a group project as part of Makers Academy and we named our Website MakersBnB.

It uses:

- [Ruby 3.0.2] As our coding language
- [Sinatra] Our DSL use for writing web apps
- [Capybara] For user testing
- [RSPEC] For unit testing
- [PostgreSQL] Our local database
- [CSS]
- [HTML]


## Card wall

<img width="1138" alt="Screenshot 2022-06-28 at 11 41 47" src="https://user-images.githubusercontent.com/101583630/176161823-8815c351-4260-49ed-b133-0f05cef80ade.png">


## MVP, design and planning

[Miro board. Planning, design and MVP](https://miro.com/app/board/uXjVO4UJVio=/?share_link_id=693010513648)

<img width="738" alt="Screenshot 2022-05-20 at 16 37 26" src="https://user-images.githubusercontent.com/101583630/176162034-c64b23a8-2626-4005-9828-f4e1c94c86c2.png">

## User Stories

### MVP User Stories

```
As a user,
So that I can host my property,
I would like to list a space.
```

```
As a user,
So that I can go on holiday,
I would like to view a space.
```

```
As a user,
So that I can make a booking,
I would like to contact the host.
```

### Headline Specs

```
As a user,
so I can keep track of my listings,
I would like to make an account for MakersBnB.
```

```
As a signed-up user,
so I can use the platform,
I would like to log in and log out of MakersBnB.
```

```
As a logged-in user,
so I can host my space,
I would like to list a space.
```

```
As a user,
so I can keep track of my listings,
I would like my acccount to keep track of multiple spaces.
```

```
As a user,
so I can accurately advertise my space,
I would like to add a name to my space.
```

```
As a user,
so I can accurately advertise my space,
I would like to provide a short description.
```

```
As a user,
so I can accurately advertise my space,
I would like to add a price per night.
```

```
As a host,
so I can keep track of availability,
I would like to have a range of dates where my space is unoccupied.
```

```
As a guest,
so that I can plan my booking,
I would like to see a range of dates where the space is available.
```

```
As a customer,
so I can stay in a BnB,
I would like to request to hire a space for one specific night.
```

```
As a host,
so I can confirm the listing,
I would like to approve the request made by the customer.
```

```
As a user,
so I don't get double bookings for the same night,
I would like to make approved occupied dates unavailable to book to other guests.
```

```
As a host,
So my space is fairly available,
I would like for the space to remain available with multiple requests.
```

## Team Approach

### Work hours

* Start time 10am
* Lunch 1pm - 2pm
* End day 5:30pm

### Pairing

* Breaks decided amongst pairs.

* Two pairing slots.

### Daily stand ups and retros.

* Stand ups. 10am-10:15am.
* Retro. 5:30pm.

## Demo Photos

### Sign up page

<img width="1278" alt="Screenshot 2022-06-28 at 12 18 36" src="https://user-images.githubusercontent.com/101583630/176166705-03709b6d-04b0-4d37-9f28-ee06e8b74a64.png">

### Log in page

<img width="1280" alt="Screenshot 2022-06-28 at 12 18 20" src="https://user-images.githubusercontent.com/101583630/176166759-8aa39279-bb6f-48bd-9315-0284a3714465.png">

### Home page / properties page

<img width="1280" alt="Screenshot 2022-06-28 at 12 19 11" src="https://user-images.githubusercontent.com/101583630/176166921-6956124d-88d9-4be0-9dca-2d240e08d9e4.png">

### List your property page

<img width="842" alt="Screenshot 2022-06-28 at 12 19 36" src="https://user-images.githubusercontent.com/101583630/176167001-4d044021-8981-4d59-bb3f-c2e8082af87e.png">

### My listing page

<img width="1280" alt="Screenshot 2022-06-28 at 12 20 06" src="https://user-images.githubusercontent.com/101583630/176166823-66d1c763-3ad3-4020-ae9a-db1ed5adb8e4.png">

## How to install and setup

### How to run locally

1. Fork this repository
2. Clone your fork to your local machine
3. Type `bundle install` to install dependencies

### Database setup
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE makers_bnb;
3. Connect to the database using the pqsl command \c makers_bnb;
4. Run the query we have saved in the file 01_create_property_database.sql

### Start local server

1. Type `ruby app.rb` in terminal to run local server
2. Browse to local address given in terminal


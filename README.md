# Simple News App - Rails Competency Test

## Steps to run the project.

- `$ git clone git@github.com:fcastellanos/fernando-ror-competency-test.git`
- `$ bundle install`
- `$ rails db:migrate && rails db:seed`

Check the `seeds.rb` file for already created users/roles

**For a better styled UI check `feature/tailwind-styling/` branch which also fixes admin access role.**

## User Personas
The project will have multiple roles that interact with each other.
- [x] Guest (No Login)
- [x] Vanilla Users (Logged in - No special role)
- [x] Editor Users
- [ ] Admin Users *(Extra Credit)*

## User Functionality
##### Guests (No Login)
- [x] Can see homepage with first 3 articles from each category.
- [x] Can see article index page.
- [x] Are sent to login/signup page if they want to see article show page.
  - [x] Signup form can be included on the login page or just linked to from the login page.
- [x] Can signup
- [x] Can Login

##### Vanilla Users
- [x] Can see everything a guest can
- [x] Can see article show pages. 
- [x] Can logout

##### Editor Users
- [x] Can do everything a vanilla User can.
- [x] Can create articles
- [x] Can delete articles that they created
- [x] Can edit articles that they created
- [x] Can NOT delete or edit articles created by others

##### Admin User *(Extra Credit)*
- [ ] Can create users and set roles.
- [ ] Can edit users and change roles.
- [ ] Can't edit/destroy/create articles.

## Article Table
- [x] Table will contain **title**, **content**, **category**, **user_id**.

## Roles
- [x] Using Petergate gem
###### Role Names
- [x] user
- [x] editor
- [x] admin *(Extra Credit)*

## Database
- [x] Use sqlite

## Testing
- [x] Use minitest as the test suite. 

## Authentication
- [x] Using Devise gem.

## Templating
- [x] Using slim

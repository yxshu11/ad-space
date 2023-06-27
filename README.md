# Sephora adSpace


## Ruby version
3.2.2


## Rails version
7.0.5

---
## Setup
1. Clone the repo
2. Manage the Database
   - rails db:create
   - rails db:migrate
   - rails db:seed
3. Start the Server
   - rails s
4. Create billboards and activate it in the billboard index page

---
## APIs available 
1. GET Billboards
    - /api/v1/billboards?category=<category_slug_url_you_set>
2. POST Billboard Impression
    - /api/v1/billboards/:id/update_impression

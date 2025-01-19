# Snowflake_DBT
Repository setting up snowflake and DBT for DEMO on data engineering practice.

## Tasks
### Setup
- [x] Setup Snowflake
    - Many questions that were targetted towards business users rather than experimenting / setting up a demo or test project.
- [x] Setup DBT Cloud
    - Attempting to follow linked guide for this and additional steps using provided [link](https://docs.getdbt.com/guides/snowflake?step=1)'
    - Picked 'Enterprise' when setting up snowflake - this a requirement for the dbt-snowflake setup guide (to have ACCOUNTADMIN role), so that wa slucky :D

### Load Data
- [x] Find an interesting dataset (something fun to present and nice to model) - scowering Snowflake Marketplace and kaggle, found following free datasets of interest:
    - US Real Estate (By Snowflake Data)
    - US Crime (By Snowflake Data)
    - US Healthcare & Insurance (By Snowflake Data)
    - Travel Pricing & Availability (Vertical Knowledge)
    - [Airplane Crashes Since 1908](https://www.kaggle.com/datasets/saurograndi/airplane-crashes-since-1908/data) or [API - 20 requests / hour](https://rapidapi.com/Berthje/api/flight-accidents-api-ntsb1) or [Directly from NTSB](https://www.ntsb.gov/safety/data/Pages/Data_Stats.aspx)
- [x] Load data into Snowflake
    - Go back to this [guide](https://docs.getdbt.com/guides/snowflake?step=3)
    - Ended up loading [this data](https://www.kaggle.com/datasets/saurograndi/airplane-crashes-since-1908?resource=download) by downloading and uploading into a table 'crashes_and_fatalities' under raw.flight_crashes database. 
- [ ] Possibly find additional supporting datasets
    - Data on plane types / manufacturers (f.ex. boeing has generally seen a lot of crashes, if we had some info on them it would be interesting)
    - Data on terrain of locations (or simply "difficulty raitings" of certain landings / takeoffs at certain airports)
    - Data on operators (i.e. to use for modelling if they are f.ex. low-budget)

### Data Model Design
- [ ] Design Data Model (Layer architecture, Data maturity etc.)
    - Enrich data 
        - fetch aircraft manufacturer from type
        - fetch something from descriptions classifying "type" of crash???
        - fetch country from location
        - split routes into source and destination
        - merge date and time into a timestamp + add date-dimension (marking holidays, weekdays etc.)
    - Index by Date
- [ ] Create Resources
    - Analytics Layer
    - DBT cloud over github repo

### Transform Data
- [ ] Use DBT to transform data (tables, views, load modes)
- [ ] Add relevant data tests
- [ ] Add documentation of models

### Prod. Architecture
- [ ] Consider design for scalability and robustness: 
    - [ ] data pipelines,
    - [ ] multiple developers / users,
    - [ ] concurrent workflows

### Prepare presentation (PPT + Code Snippets)
- [ ] Thought process
- [ ] Difficulties / Challengess
- [ ] "If I had had more time..."
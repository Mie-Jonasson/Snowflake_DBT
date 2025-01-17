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
- [ ] Find an interesting dataset (something fun to present and nice to model) - scowering Snowflake Marketplace and kaggle, found following free datasets of interest:
    - US Real Estate (By Snowflake Data)
    - US Crime (By Snowflake Data)
    - US Healthcare & Insurance (By Snowflake Data)
    - Travel Pricing & Availability (Vertical Knowledge)
    - [Airplane Crashes Since 1908](https://www.kaggle.com/datasets/saurograndi/airplane-crashes-since-1908/data) or [API - 20 requests / hour](https://rapidapi.com/Berthje/api/flight-accidents-api-ntsb1) or [Directly from NTSB](https://www.ntsb.gov/safety/data/Pages/Data_Stats.aspx)
- [ ] Load data into Snowflake
    - Go back to this [guide](https://docs.getdbt.com/guides/snowflake?step=3)
- [ ] Possibly find additional supporting datasets

### Data Model Design
- [ ] Design Data Model (Layer architecture, Data maturity etc.)
- [ ] Create Resources

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
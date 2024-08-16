# PedalShop: e-commerce Website
A website for a small-medium business owner to sell his bicycles.

### Objective 📌 
A growing business now wants to sell via the internet. Bicycles are the main product, but if the business continues to grow, the business willl surely start selling other sports-related items such as skis, surfboards, roller skates, etc. It would be a nice bonus if the same website allows to sell those things as well.

## Domain Requirements 📝
1. Customers can completely customize their bicycles. They can select many different options for the various parts of the bicycle.
Example list of parts and their possible choices

| Part             | Part Options            |
|------------------|-------------------------|
| **Frame type**   | _Full-suspension_, _diamond_, _step-through_     |
| **Frame finish** | _Matte_, _shiny_        |
| **Wheels** | _road wheels_, _mountain wheels_ _fat bike wheels_     |
| **Rim Color** | _Red_, _Blue_, _Black_    |
| **Chain** | _Single-speed chain_, _8-speed chain_    |

2. Some combinations that are prohibited because they are not possible in reality

| _If you select "mountain wheels", then the only frame available is the full suspension_             |
|---------------------------------------------|
| _If you select "fat bike wheels", then the red rim color is unavailable because the manufacturer doesn't provide it_ |

2. Sometimes all the possible variations of each part are not in stock, and can be marked as "temporarily out of stock" to avoid incoming orders that would not be  fulfilled

3. After customization, price is calculated by adding up the individual prices of each part that you selected. 

| Part                   | Price (EUR) |
|------------------------|-------------|
| **Full suspension**    | _130_ |
| **Shiny frame**        | _30_  |
| **Road wheels**        | _80_  |
| **Rim color blue**     | _20_  |
| **Single-speed chain** | _43_  |
|   Total                | _303_ |


4. Price of a specific part option (like the matte finish) can vary depending on other parts or options selected by the user. E.g

| _The price of the matte finish is not fixed but depends on the type of frame chosen._    |
|----------------------------------------|
| _The matte finish costs 50 EUR when applied to a full-suspension frame._ |
| _The matte finish costs 35 EUR when applied to a diamond frame._ |

This indicates that the price of one option (the matte finish) can be influenced by multiple other choices in the customization. These kinds of variations can always happen and they might depend on any of the other choices (not only two). So they must be considered otherwise, the business would be losing money.

## User Activity (Diagram) 
Please Refer to [User Activity Diagrams](user-activity.md)

## User Workflow & UI Description
Please Refer to [User Workflow & UI Descriptions](workflow-and-ui.md)

## Entity Modeling
Please Refer to [Entity Models & Relationships](model-summary.md)

## Database Specifications
Please Refer to [Database Specifications](schema.md)

## Trade-offs & System Architecture Decisions
Please Refer to [Trade-offs](trade-offs.md)

## Additional Considerations (Future enhancements)
Please Refer to [Additional Considerations](additional-considerations.md)


#### References
External Docs: [Google Docs](https://docs.google.com/document/d/1eHt-meEFR0RT5fYn_ZkV6Xir2xGv3pEIgjMF2tSoPDo/edit?usp=sharing)

Diagrams: [Draw.io](https://drive.google.com/file/d/1aZhMe5tZ7lft6Lw4LWvkbSwqRxQWcGQ_/view?usp=sharing)

ERD: [ERDLab.io](https://erdlab.page.link/incazTcpLfNqovYt9)
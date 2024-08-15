# Entity Modeling

[Back to Main Page](README.md) | [Next: Database Specifications](schema.md) |

### ERD
![](./diagrams/pedalshop_ERD.png)


## Model Associations

#### User
The *User* model has has_many *:orders* and has_many *:customizations*, which I used for tracking user activity.

#### Order and OrderItem
The *Order* model belongs to User and has many *OrderItems*. The OrderItem model, in turn, belongs to Order and Customization, establishing the relationship between the order and the specific customization a user has made.


#### Category and Product
The *Category* model has many *Products*, and *Product* belongs to *Category*.
The Product model’s relationship with *Part* through *ProductPart* gives me a flexible association between products and their parts.


#### Part and PartOption
The *Part* model belongs to *Product* and has many *PartOptions* through *ProductPartOptions*. This setup allows me to associate parts with specific products and their respective options, which is appropriate for business use case.


#### ProductPart and ProductPartOption
These models many-to-many relationships between Product and Part, and between Part and PartOption. I believe it is essential for the flexible configuration of product parts and options.


#### Customization
The *Customization* model belongs to both *User* and *Product*, with has_many *:order_items*. This structure will be used for tracking customizations and linking them to orders.


#### PartOptionCombination and PartOptionProhibition
These models are present but currently without associations. For now, they serve as standalone models for storing JSONB fields related to combinations and prohibitions.


## Model Description

### Order
- Purpose: Represents a customer's order.
- Fields:
    - Refer to: [Table Orders](schema.md#table-orders)
- Association
    - Belongs to a User
    - Has many OrderItems
- Example
    - A user can place an order that contains multiple items

### OrderItems
- Purpose: Represents items in an order
    - Traceability: This is crucial for auditing, customer support, and analyzing user preferences.
    - Consistency: It ensures that the specific configuration used to create each OrderItem is preserved.
    - Reproducibility: allows to reproduce the exact product configuration in case of returns, disputes, or if the customer wants to reorder the same configuration.
    - Simplified Queries: easier to query and generate reports based on specific customizations, such as how popular certain customizations are, or which customizations lead to more completed orders.
- Fields
    - Refer to: [Table OrderItems](schema.md#table-orderitems)
- Association
    - Belongs to Order
    - Belongs to Customization

### User (can be admin, or buyer)
- Purpose: Represents the user in the system (admin or buyer)
- Fields
    - Refer to: [Table User](schema.md#table-users)
- Associations
    - Has many Orders
    - Has many Customizations

### Category
- Purpose: Represents a category of products (e.g., bicycles, skis, surfboards).
- Fields:
    - Refer to: [Table Category](schema.md#table-categories)
- Association
    - Has many Products
- Example
    - Bicycle
    - Skis
    - Surfboards

### Product
- Purpose: Represents the main product being sold.
- Fields:
    - Refer to: [Table Products](schema.md#table-products)
- Association
    - Belongs to Category
    - Has many Parts through ProductPart
    - Has many Customizations
- Examples
    - A mountain wheel bicycle

### Part
- Purpose: Represents different parts of a product (e.g., frame type, wheels, rim color, chain, frame finish).
- Fields:
    - Refer to: [Table Parts](schema.md#table-parts)
- Association
    - Belongs to a Product
    - Has Many PartOptions, through ProductPartOptions
- Example
    - Frame type
    - Frame Finish
    - Wheels
    - Rim Color
    - Chain

### PartOptions
- Purpose: Represents option choices for a part
- Fields
    - Refer to: [Table PartOptions](schema.md#table-partoptions)
- Association
    - Belongs To Part
- Examples
    - Frame Type Part
        - Options - Full-suspension || diamond || step-through
    - Frame Finish part
        - Options - Matte || shiny
    - Wheel Part
        - Options - Road wheels || mountain wheels || fat bike wheels
    - Rim Color Part
        - Options - Red || Black || blue
    - Chain Type
        - Options - Single-speed chain || 8-speed chain

### PartOptionCombinations
- Purpose: Represents specific combinations of part options that have a unique price.
- Fields
    - Refer to: [Table PartOptionCombination](schema.md#table-partoptioncombinations)
- Association
    - N/A
- Example
    - matte finish over a full-suspension frame, price: 50 EUR, 
    - matte finish over a diamond frame, price: 35 EUR.

### PartOptionProhibition
- Purpose: Represents prohibited combinations of part options, ensuring that invalid combinations are not allowed.
- Fields
    - Refer to: [Table PartOptionProhibition](schema.md#table-partoptionprohibitions)
- Association
    - N/A
- Examples
    - Mountain wheels cannot be combined with diamond frame type
    - Mountain wheels cannot be combined with step through frame type

### Customization (metadata table)
- Purpose: metadata table that captures the exact combination of parts and part options selected by a buyer for a particular product.
    - It allows us to store the specific choices each buyer makes for their bicycle. 
    - It stores the total price of the customized product, which is calculated based on the individual prices of the selected parts and any combination-specific pricing rules.
    - We can use this metadata to evaluate completed orders
    - Allows for flexibility in handling different products and their unique parts and options.
- Fields
    - Refer to: [Table Customization](schema.md#table-customizations)
- Association
    - Belongs to a User
    - Belongs to a Product
    - Has many Order Items

### ProductPart
- Purpose: join table that associates a Product with its corresponding Part. This allows each Product to have multiple Parts associated with it, enabling customization based on the parts available for a particular product type.
- Fields
    - Refer to: [Table ProductPart](schema.md#table-productparts-join-table)
- Association
    - Belongs to Product
    - Belongs to Part

### ProductPartOptions
- Purpose:  designed to create associations between Parts and their specific PartOptions within the context of a particular Product. This means that for each Part of a product, there could be several PartOptions available for selection.
- Fields
    - Refer to: [Table ProductPartOption](schema.md#table-productpartoptions-join-table)
- Association
    - Belongs to ProductPart
    - Belongs to PartOption


[Back to Main Page](README.md) | [Next: Database Specifications](schema.md) |
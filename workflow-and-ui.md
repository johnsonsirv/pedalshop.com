# User Workflow & UI Description

| [Back to Main Page](README.md) | [Next: Entity Modeling](model-summary.md) |

---
## Main User Workflow & UI specifications
---
The description of the main user actions in this e-commerce website

### 1.0 Assumption (user is already authenticated)

### 1.1 User Action: View All Products Page
- A grid-like display that shows all the products (can be filtered by category:  Bicycle, Skis etc) - name, price, availability, CTA button view details)

### 1.2 User Action: Viewing and Customizing a Bicycle on the Product Page
The user navigates to the product page using a specific product_id. The system retrieves the default bicycle product details from the database

#### A. Displaying the Product Page UI:
- The UI displays the bicycle's default configuration parts, and the base price. Customization is presented as wizard UI

#### B. Determining Available Options:
- **Backend Process**: a single database call to retrieve all parts, part options, and potential combinations and prohibitions
- **Caching**: this data cached to avoid repeated database queries during the session.
- **UI Update**: The UI dynamically updates to reflect the available and unavailable options based on current selections.

#### C. Customizing Product: A Wizard UI for Product Customization
- **Concept:** The user is guided through a step-by-step process (wizard) to customize their product. This approach offers a clear and structured way for the user to select parts, view pricing impacts, and finalize their customization.

- **User Experience:** provides a focused and user-friendly environment prevents overwhelming the user with too many options at once.

> **Step 1: Select Part Type and Part Options**

- **Interaction**: The user selects a part type (e.g., frame, wheels) and then chooses from available options (e.g., "diamond" frame, "mountain" wheels).
- **Real-Time Price Updates**: As the user makes selections, the UI immediately reflects any price changes, providing instant feedback. The price calculation considers the selected PartOptions and any applicable PartOptionCombinations.
- **Prohibited Combinations**: The system prevents the user from selecting prohibited combinations by disabling incompatible options. For example, if the user selects "mountain wheels," the "road frame" option may be disabled.
- **Information on Price Implications:** A dedicated section in the UI informs the user about how their selections influence the final price. This transparency helps them understand the cost implications of their choices.

>> **Step 2:  Customization Summary**
- **Summary UI**: After making selections, it shows all chosen parts and options along with the total price.
- **Navigation Options**: user can either proceed to add to cart or go back to make further changes ensuring that users are fully satisfied with their choices before finalizing the order.
- **Caching:** During the customization process, the user's selections are cached to minimize the need for multiple database calls, improving performance, responsiveness and consistency.

>>> **Step 3:  Add Product to Cart**
- **CTA: Add to Cart Button:** UI will handle this action smoothly without disrupting the user's shopping experience by initiating a back-end request to process the user's customization and order creation asynchronously.

- **Back-end Processing:** a group of **Atomic Transactions**
    - > Persisting the user's customization
    - > A new order is created in the database with an initial status of "pending." 
    - >A new order item is persisted with the customization created and the quantity the user wants for that particular customization
- **Modifying or Empty Cart:**
    - The cart acts as a temporary holding area where the user can review or modify their selections before proceeding to checkout.
    - Will trigger actions to update Customization, Order and Order Items OR remove from database.

>>>> **Step 4:  Checkout**
- Calculates final price based on items on cart
- Updates the order status to "Completed" and total price

---
## Admin User Workflow & UI specifications
---
The description of the main workflows from the administration part of the website, where an admin configures the store such by creating a new product, adding new parts and part options, and setting up prices, combinations.

#### 1.0 Assumption admin is already authenticated & authorized as admin

### 1.1 Admin User Action: Creation of a New Product

> _What information is required to create a new product? What changes in the database after performing this action?_

- **Information Required:**
     * Product Name: The name of the product (e.g., "Mountain Bike").
     * Product Category: The category of product (e.g. "Bicycle").
     * Default Configuration: predefined parts and part options (e.g., default frame, default wheels) selected based on the product category.
    * Description: brief description of the product.
    * Base Price: The starting price of the product before customization.
- **Backend Processing  & Database Changes:**
    - Product Table:
       -  A new record is created in the Product table with basic details - name, description. base price
    - Part and PartOption Association:
        - The selected default parts and part options are associated with the new product in the `ProductPart` and `ProductPartOption` tables, establishing relationships between the product and its configurable components.
- **UI Design:**
    - **Create Product Form:** admin can enter the necessary product details. A dropdown or selection field allows the admin to choose a product category, which automatically fills in the default configuration for that product.
    - CTA save button triggers the creation of the product and its associated parts and options in the database.
- **Decision Trade-off:**
    - **Efficiency:** The default configuration reduces the time required to create a product by providing a predefined set of parts and options.
    - **No Complexity:** admin should spend less time customizing products. Customers will customize on demand
    - **Flexibility:** admin can override the default settings after the product is created.


### 1.2 Admin User Action: Addition of a New Part Choice

> _How can Marcus introduce a new rim color, for example? Can you describe the UI? What changes in the database after this action?_

- **Information Required:**
    - Name: The name of the part option (e.g., "Rim Color Red")
    - Price: price for this part option
    - In Stock: Whether this part is available to be purchased.
- **Backend Processing  & Database Changes:**
    - PartOption Table:
        - A new record is created in the PartOption table
        - This new part option is now available to be used for any product customization
- **UI Design:**
    - Create Part Option Form: select the part type (e.g., "Rim") and enter the new part option details. 
    - CTA button saves record to database.
- **Decision Trade-off:**
    - Independence from Specific Products: Part options can be created independently of any specific product, making them reusable across multiple products.
    - Naming Convention: adopt a simple naming convention to name part options. Names will be indexed for search purposes during customization or price update. Format:  `[Part_Name][Part Option Name]` _"Rim Color Blue”_  _"Frame Finish Matte”, “Chain Single-speed"_
    - Flexibility: add new options as needed without altering existing products

### 1.3 Admin User Action: Setting Up Prices and Combinations

> _How can Marcus change the price of a specific part (like the diamond frame type) or specify that some combinations of choices have particular prices? How does the UI look? How does the database change to store this information?_

#### A. Price Adjustment for individual parts
- Information Required: 
    - Name: The name of the part option (e.g., "Rim Color Red") will be used to retrieve the part option
    - New Price: price of this option
- Backend Processing  & Database Changes:
    - PartOption Table:
        - Record updated with new price

#### B. Setting up Part Option Combinations or Prohibitions
- Information Required:
    - Part options (e.g., "Diamond Frame + Carbon Wheels") that will be combined or prohibited
    - Combination Price: the price for this combination
    - Prohibited Combinations: choose prohibited combinations (e.g., "Mountain Wheels + Frame Diamond", "Mountain Wheels + Frame step-through").
- Backend Processing  & Database Changes:
    - PartOptionCombination Table:
        - A new record is added to table with combination price
        - IDs of selected part options are stored as JSONB
    - ProhibitedCombinations Table:
        - A new record is added to table
        - IDs of selected part options are stored as JSONB
- UI Design:
    - A price management to view and manage all part options. It interface allows for the selection of individual parts and adjust prices directly.
    - **Combination Setup Interface:** A dedicated interface enables the admin to define and manage part option combinations. This interface includes:
        - dropdowns for selecting Part Options
        - input fields for Price Update
        - CTA Button

- Decision Trade-offs:
    - Avoid Multiple Join Tables: Save options using JSONB
    - Single Page Interaction: Modifications are done on a single page without page reload.
    - Detail Control: Ensure granular control over pricing and combinations
    - Prohibition Management: By setting prohibited combinations, admin can ensure customers do not choose incompatible options


| [Back to Main Page](README.md) | [Next: Entity Modeling](model-summary.md) |
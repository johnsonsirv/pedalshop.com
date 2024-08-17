# Additional Considerations (Future Enhancements)

| [Back to Main Page](README.md) |

- Test for code quality using unit tests and e2e tests
- Use a feature flag to hide new features like the ones listed below

    > I believe it is important to consider Auditing and Tracking User Behavior within this website. Let me explain core areas I would consider integrating into this website:

- **Tracking Removals:** If the user removes the customized product from their cart, the system logs this action in an audit log. This log captures the details of the removed item, including customization options and prices. This data is essential for analyzing user behavior and understanding why certain products are frequently removed.

- **Behavior Analysis:** By monitoring the frequency of removals, the system can identify trends and potential issues with specific products or customization options. 

    >For example, if a particular part option is consistently removed, it may indicate a design flaw or pricing issue. When an item is removed from the cart, a "Remove from Cart" event can be published. This event can be visualized using tools like Prometheus to monitor and analyze user behavior on the platform in real time.

- **Replaying Orders:** The ability to replay orders will be crucial for auditing purposes. By storing the complete customization object, the system can regenerate the order details exactly as they were at the time of purchase. This functionality supports accountability and profitability analysis, ensuring that all orders align with the company’s pricing model. 
The customization model will be helpful here

- **E-Inventory Management** 
    - Part & Part Options  inventory
        - Auto-calculate if parts are still in-stock if they are still available in the Parts inventory


| [Back to Main Page](README.md) |
# Trade-offs & System Architecture Decisions

[Back to Main Page](README.md) | [Next: Additional Considerations (Future Enhancements)](additional-considerations.md) |

> What Software Architecture will you adopt?

- Adopt MVC
    - Simplicity and speed in managing application framework
    - small to medium sized application (with a small team)
    - can possibly scale into SOA
- Layered Architecture with Service-Oriented Components
    - manage complex business logic, providing a clear, maintainable, and scalable structure for your application.
    - Enforce separation of concerns
    - Enforce SOLID, DRY, OOP and maintain clean coding
    - Promote testability and maintainability
- Modularized codebase
    - group related classes under modules
    - start simple and small, monitor complexity for `Products` module and consider splitting as application grows

> How did you choose between Relational Model (Normalized schema) and Non-relational Model - NoSQL (De-normalized schema)

Approach
- I adopted a Relational Model
    - Maintain data consistency and transaction integrity crucial for an e-commerce website
- For issues with complex queries and joins:
    - Implement caching layer
    - Use JSONB columns for flexible configurations and de-normalization.
    - Optimize queries through:
        - proper indexing
        - materialized views for complex aggregations that do not change frequently
- Scaling for large volumes of transactional data
    - I will adopt database sharding and partitioning
    - I will use of read replicas for read-only traffic to serve queries, balance read-heavy operations and reduce load on the primary database
- Maintainability:
    - The relational model will be maintainable in the long run, especially as new features are added.

UI Design Trade-offs are contained in [Workflows & UI Description](workflow-and-ui.md)

[Back to Main Page](README.md) | [Next: Additional Considerations (Future Enhancements)](additional-considerations.md) |
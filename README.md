---

# Pine Valley Furniture Database Project

This project involves the design and implementation of a relational database for Pine Valley Furniture, a company that sells furniture products. The database stores information about products, orders, customers, raw materials, and vendors.

## Features

- Tables for storing information about customers, orders, products, product lines, order line items, raw materials, and vendors.
- Relationships between tables to maintain data integrity and consistency.
- Support for querying and retrieving order details, customer information, product information, and more.
- Use of helper tables to handle many-to-many relationships, such as the `Order Line Item` and `Used Quantity` tables.

## Database Schema

The database schema consists of the following tables:

1. Customer
2. Order
3. Product
4. Product Line
5. Order Line Item
6. Used Quantity
7. Raw Material
8. Vendor
9. Supply

## Setup

1. **Database Creation**: Use the provided SQL scripts to create the database schema in your preferred RDBMS (e.g., MySQL, PostgreSQL).
2. **Data Population**: Populate the database with sample data using the provided SQL scripts or by manually entering data.
3. **Queries**: Execute queries to retrieve and manipulate data as needed. Sample queries for common operations are included in the SQL scripts.

## Usage

- Use SQL queries to interact with the database and perform operations such as adding new customers, placing orders, updating product information, and more.
- Refer to the database schema documentation for information on table structure, relationships, and data types.

## Contributors

- [Farooque Sajjad]

## License

This project is licensed under the [MIT License](LICENSE).

---


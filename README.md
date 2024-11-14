Here's a `README.md` for setting up the `ProjectResourceDB` database:

# ProjectResourceDB Setup Guide

This repository contains the SQL scripts needed to set up the `ProjectResourceDB` database, including creating tables and loading sample data for testing.

## Prerequisites

- MySQL or a compatible SQL server
- Access to a MySQL client (e.g., MySQL Workbench or the MySQL command-line client)

## Database Setup

### Step 1: Clone the Repository

Begin by cloning the repository to your local environment:

```bash
git clone https://github.com/W4153WASMCoder/ProjectResourceDB.git
cd ProjectResourceDB/src
```

### Step 2: Create the Database

Log into your MySQL server and create a new database for the project resource data. Replace `db_project_resource` with your preferred database name if desired.

```sql
mysql -u root -p
CREATE DATABASE db_project_resource;
USE db_project_resource;
```

### Step 3: Run the SQL Scripts

With the `db_project_resource` database selected, run the provided SQL scripts to create tables and insert dummy data.

1. **Create Tables**: Execute `create-table.sql` to create the necessary tables.

   ```bash
   mysql -u root -p db_project_resource < create-table.sql
   ```

2. **Insert Dummy Data**: Run `dummy-data.sql` to populate the database with sample data for testing.

   ```bash
   mysql -u root -p db_project_resource < dummy-data.sql
   ```

### Step 4: Verify the Setup

To confirm that the tables and data were created successfully, you can run the following query to list the tables:

```sql
SHOW TABLES;
```

And to view the data in a specific table:

```sql
SELECT * FROM <table_name>;
```

Replace `<table_name>` with the actual table name you wish to inspect.

---

This guide provides a straightforward approach to setting up the `ProjectResourceDB` database.

![db_graph](./project_resource_db_graph.png)

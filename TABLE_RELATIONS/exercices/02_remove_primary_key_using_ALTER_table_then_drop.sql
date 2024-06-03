ALTER TABLE
	products
DROP CONSTRAINT
	products_pkey;

-- Note, if a name is not specified explicitly for the primary key constraint, 
-- PostgreSQL will assign a default name to it. 
-- The default name for the primary key constraint is "table-name_pkey".



-- We can give the PK custom name. Here is an example:

CREATE TABLE products(
    id SERIAL,
	product_name VARCHAR(100),

    CONSTRAINT products_custom_name_pkey PRIMARY KEY (id)
);

BEGIN;


CREATE TABLE IF NOT EXISTS public.products
(
    id_product integer NOT NULL,
    id_tax integer,
    id_offer integer,
    id_discount integer,
    name character varying,
    details character varying,
    minimum_stock integer,
    maximum_stock integer,
    price integer,
    price_with_tax integer,
    PRIMARY KEY (id_product)
);

CREATE TABLE IF NOT EXISTS public.taxes
(
    id_tax integer NOT NULL,
    percentage integer,
    PRIMARY KEY (id_tax)
);

CREATE TABLE IF NOT EXISTS public.roles
(
    id_role integer NOT NULL,
    name character varying,
    PRIMARY KEY (id_role)
);

CREATE TABLE IF NOT EXISTS public.customers
(
    id_customer integer,
    email character varying,
    id_country integer,
    age integer,
    password character varying,
    id_role integer,
    name character varying,
    PRIMARY KEY (id_customer)
);

CREATE TABLE IF NOT EXISTS public.countries
(
    id_country integer NOT NULL,
    name character varying,
    PRIMARY KEY (id_country)
);

CREATE TABLE IF NOT EXISTS public.invoice_status
(
    id_invoice_status integer NOT NULL,
    status character varying,
    PRIMARY KEY (id_invoice_status)
);

CREATE TABLE IF NOT EXISTS public.orders
(
    id_order integer NOT NULL,
    id_invoice integer,
    id_product integer,
    detail character varying,
    amount character varying,
    price integer,
    PRIMARY KEY (id_order)
);

CREATE TABLE IF NOT EXISTS public.discounts
(
    id_discount integer NOT NULL,
    status character varying,
    percentage integer,
    PRIMARY KEY (id_discount)
);

CREATE TABLE IF NOT EXISTS public.payments
(
    id_payment integer NOT NULL,
    type character varying,
    PRIMARY KEY (id_payment)
);

CREATE TABLE IF NOT EXISTS public.offers
(
    id_offer integer NOT NULL,
    status character varying,
    PRIMARY KEY (id_offer)
);

CREATE TABLE IF NOT EXISTS public.products_customers
(
    products_id_product integer NOT NULL,
    customers_id_customer integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.invoices
(
    id_invoice_status integer,
    id_invoice integer,
    id_customer integer,
    id_payment integer,
    date date,
    total_to_pay integer,
    PRIMARY KEY (id_invoice)
);

ALTER TABLE IF EXISTS public.products
    ADD FOREIGN KEY (id_tax)
    REFERENCES public.taxes (id_tax) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products
    ADD FOREIGN KEY (id_offer)
    REFERENCES public.offers (id_offer) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products
    ADD FOREIGN KEY (id_discount)
    REFERENCES public.discounts (id_discount) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.customers
    ADD FOREIGN KEY (id_country)
    REFERENCES public.countries (id_country) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.customers
    ADD FOREIGN KEY (id_role)
    REFERENCES public.roles (id_role) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD FOREIGN KEY (id_product)
    REFERENCES public.products (id_product) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD FOREIGN KEY (id_invoice)
    REFERENCES public.invoices (id_invoice) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products_customers
    ADD FOREIGN KEY (products_id_product)
    REFERENCES public.products (id_product) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products_customers
    ADD FOREIGN KEY (customers_id_customer)
    REFERENCES public.customers (id_customer) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.invoices
    ADD FOREIGN KEY (id_invoice_status)
    REFERENCES public.invoice_status (id_invoice_status) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.invoices
    ADD FOREIGN KEY (id_customer)
    REFERENCES public.customers (id_customer) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.invoices
    ADD FOREIGN KEY (id_payment)
    REFERENCES public.payments (id_payment) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;

/* ROLES */
INSERT INTO roles (id_role, NAME) VALUES (1, 'normal');
INSERT INTO roles (id_role, NAME) VALUES (2, 'vip');
INSERT INTO roles (id_role, NAME) VALUES (3, 'pro');

/* COUNTRIES */
INSERT INTO countries (id_country, NAME) VALUES (1, 'venezuela');
INSERT INTO countries (id_country, NAME) VALUES (2, 'Colombia');
INSERT INTO countries (id_country, NAME) VALUES (3, 'Brasil');

/* DISCOUNTS */
INSERT INTO discounts (id_discount, status, percentage) VALUES (1, 'normal', 10);
INSERT INTO discounts (id_discount, status, percentage) VALUES (2, 'offer', 25);
INSERT INTO discounts (id_discount, status, percentage) VALUES (3, 'special', 50);


/* CUSTOMERS */
INSERT INTO customers (id_customer, email, id_country, age, password, id_role, name) VALUES (1, 'prueba1@gmail.com',1, 18, 'passprueba1', 1, 'prueba1');
INSERT INTO customers (id_customer, email, id_country, age, password, id_role, name) VALUES (2, 'prueba2@gmail.com',2, 19, 'passprueba2', 2, 'prueba2');
INSERT INTO customers (id_customer, email, id_country, age, password, id_role, name) VALUES (3, 'prueba3@gmail.com',1, 20, 'passprueba3', 3, 'prueba3');

/* PAYMENTS */
INSERT INTO payments (id_payment, type) VALUES (1, 'Currency');
INSERT INTO payments (id_payment, type) VALUES (2, 'crypto');
INSERT INTO payments (id_payment, type) VALUES (3, 'Credit Card');

/* TAXES */
INSERT INTO taxes (id_tax, percentage) VALUES (1, 16);
INSERT INTO taxes (id_tax, percentage) VALUES (2, 12);
INSERT INTO taxes (id_tax, percentage) VALUES (3, 9);

/* OFFERS */
INSERT INTO offers (id_offer, status) VALUES (1,10);
INSERT INTO offers (id_offer, status) VALUES (2,25);
INSERT INTO offers (id_offer, status) VALUES (3,40);


/* PRODUCTS */
INSERT INTO products (id_product, id_tax, id_offer, id_discount, name, details, minimum_stock, maximum_stock, price, price_with_tax) VALUES 
(1, 1, 1, 1, 'playstation', 'sony', 5, 10, 500, 700);
INSERT INTO products (id_product, id_tax, id_offer, id_discount, name, details, minimum_stock, maximum_stock, price, price_with_tax) VALUES 
(2, 2, 2, 2, 'switch', 'nintendo', 6, 20, 400, 600);
INSERT INTO products (id_product, id_tax, id_offer, id_discount, name, details, minimum_stock, maximum_stock, price, price_with_tax) VALUES 
(3, 3, 3, 3, 'xbox', 'microsoft', 7, 30, 300, 500);

/* INVOICE_STATUS */
INSERT INTO invoice_status (id_invoice_status, status) VALUES 
(1, 'in process..');
INSERT INTO invoice_status (id_invoice_status, status) VALUES 
(2, 'Procesed');
INSERT INTO invoice_status (id_invoice_status, status) VALUES 
(3, 'Complete');


/* INVOICES */
INSERT INTO invoices (id_invoice_status, id_invoice, id_customer, id_payment, date, total_to_pay) VALUES 
(1, 1, 1, 1, '2024-01-01'::date, 700);
INSERT INTO invoices (id_invoice_status, id_invoice, id_customer, id_payment, date, total_to_pay) VALUES 
(2, 2, 2, 2, '2024-01-01'::date, 600);
INSERT INTO invoices (id_invoice_status, id_invoice, id_customer, id_payment, date, total_to_pay) VALUES 
(3, 3, 3, 3, '2024-01-01'::date, 500);

/* ORDERS */
INSERT INTO orders (id_order, id_invoice, id_product, detail, amount, price) VALUES 
(1, 1, 1, 'playstation', 1, 700);

INSERT INTO orders (id_order, id_invoice, id_product, detail, amount, price) VALUES 
(2, 2, 2, 'switch', 1, 600);

INSERT INTO orders (id_order, id_invoice, id_product, detail, amount, price) VALUES 
(3, 3, 3, 'xbox', 1, 500);


/* DELETE FIRST LAST ORDERS AND INVOICES PENDING AND BEFORE DELETE CUSTOMERS */
delete from orders
  where id_order=1;

delete from orders
  where id_order=3;

delete from invoices
  where id_invoice=1;
  
  delete from invoices
  where id_invoice=3;

/* DELETE CUSTOMESRS*/
delete from customers
  where name='prueba1';

delete from customers
  where name='prueba3';

/* UPDATE CUSTOMER*/
UPDATE customers
SET email = 'testfinal@gmail.com', age = 34
WHERE id_customer=2;

/* UPDATING TAXES*/
UPDATE taxes
SET percentage = 19
WHERE id_tax=1;

UPDATE taxes
SET percentage = 15
WHERE id_tax=2;

UPDATE taxes
SET percentage = 12
WHERE id_tax=3;

/* UPDATING PRICES*/

UPDATE products
SET price = 600
WHERE id_product=1;

UPDATE products
SET price = 500
WHERE id_product=2;

UPDATE products
SET price = 400
WHERE id_product=3;
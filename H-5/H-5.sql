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
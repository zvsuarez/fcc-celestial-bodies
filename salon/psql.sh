#! /bin/bash

# psql prompt
"""
CREATE DATABASE salon;
\c salon

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY
    phone VARCHAR(15) UNIQUE
    name VARCHAR(25)
);

CREATE TABLE appointments(
    appointment_id SERIAL PRIMARY KEY
    time VARCHAR(10)
    customer_id INT
    service_id INT
    FOREIGN KEY customer_id REFERENCES customers(customer_id)
    FOREIGN KEY service_id REFERENCES services(service_id)
);

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY
    name VARCHAR(10)
);

INSERT INTO services(name) VALUES('cut', 'color', 'perm', 'style', 'trim');
"""

# bash
"""
chmod +x salon.sh
"""

# numbered list of service format
# #) <service>  1) cut 1=service_id

# SERVICE_ID_SELECTED CUSTOMER_PHONE CUSTOMER_NAME SERVICE_TIME

# 1 555-555-5555 Fabio 10:30
# 2 555-555-5555 11am


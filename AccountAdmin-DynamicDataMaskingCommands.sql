USE FINANCE;

SELECT * FROM CUSTOMER;
Create user PII_USER password=piiuser default_role = masking_admin must_change_password = FALSE;


Create Role masking_admin;

grant role masking_admin to user PII_USER;

grant all privileges on database finance to role masking_admin;


grant all privileges on warehouse compute_wh to role masking_admin;

grant all privileges on database finance to role sysadmin;
grant all privileges on database finance to role accountadmin;
grant all on all schemas in database finance to role masking_admin;
grant all on all schemas in database finance to role SYSADMIN;
grant all on all TABLES in database finance to role SYSADMIN;


grant apply masking policy on account to role masking_admin;

grant create masking policy on schema STAGE to role masking_admin;


SELECT * FROM STAGE.CUSTOMER;


drop user PII_USER;



--Create a new policy

create or replace masking policy STAGE.SSN_Policy as (SSN  string) returns string ->
case when current_role() in ('MASKING_ADMIN') then
        SSN
    ELSE
        '**Masked SSN**'
END;


---Associate it
alter table customer modify column ssn set masking policy Stage.SSN_Policy;

SELECT * FROm stage.CUSTOMER;

create or replace masking policy STAGE.Email_Policy as (email  string) returns string ->
case when current_role() in ('MASKING_ADMIN') then  email
     when current_role() in ('ACCOUNTADMIN')  then  regexp_replace(email,'.+\@','*****@')
     else  '**Masked Email**'
END;


alter table customer modify column emailid set masking policy Stage.Email_Policy;

SELECT * FROm stage.CUSTOMER;

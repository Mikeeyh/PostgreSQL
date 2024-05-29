SELECT
    first_name,
    last_name,
    email,
    replace(email, substring(email, '@(.*)'), '***')
FROM person

SELECT
    first_name,
    last_name,
    email,
    replace(email, substring(email, '@(.*)'), repeat('*', length(substring(email, '@(.*)'))))
FROM person

SELECT
    first_name,
    last_name,
    email,
    regexp_replace(email, '@.*$', '@***') AS masked_email
FROM person;
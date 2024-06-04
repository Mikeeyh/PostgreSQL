INSERT INTO persons (id, first_name, last_name, country_id)
VALUES (
    1001,
    'Mike',
    'Biserov',
    (SELECT id from country WHERE country_name = 'Bulgaria'),
)
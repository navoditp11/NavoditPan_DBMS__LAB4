select * from customer;

SELECT 
    o.*, p.pro_name, p.pro_desc
FROM
    `order` o
        INNER JOIN
    supplier_pricing sp
        INNER JOIN
    product p ON (o.pricing_id = sp.pricing_id
        AND sp.PRO_ID = p.PRO_ID)
WHERE
    o.cus_id = 2;
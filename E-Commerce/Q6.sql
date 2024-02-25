select * from supplier;


SELECT 
    pricing_id, supp_id, pro_id, supp_price
FROM
    supplier_pricing
ORDER BY supp_id;

SELECT 
    s.*, NoOfProducts
FROM
    supplier s
        INNER JOIN
    (SELECT 
        supp_id, COUNT(pro_id) AS NoOfProducts
    FROM
        supplier_pricing
    GROUP BY SUPP_ID
    HAVING NoOfProducts > 1) AS sp ON s.SUPP_ID = sp.SUPP_ID;
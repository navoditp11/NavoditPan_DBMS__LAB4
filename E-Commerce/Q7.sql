select * from supplier_pricing;

SELECT 
    pro_id, MIN(supp_price) AS Minimum_PriceOf_Product
FROM
    supplier_pricing
GROUP BY pro_id;


SELECT 
    p.CAT_ID, p.PRO_NAME
FROM
    product p;
    
    
SELECT 
    p.CAT_ID, p.PRO_NAME, sp.PRO_ID, Minimum_PriceOf_Product
FROM
    product p
        INNER JOIN
    (SELECT 
        pro_id, MIN(supp_price) AS Minimum_PriceOf_Product
    FROM
        supplier_pricing
    GROUP BY pro_id) as SP on sp.pro_id = p.pro_id;
    
    
SELECT 
    c.cat_id, c.cat_name
FROM
    category c;
    

SELECT 
    c.cat_name AS Category_name,
    P_SP.CAT_ID AS Category_Id,
    MIN(Minimum_Price_Of_Product)
FROM
    category c
        INNER JOIN
    (SELECT 
        p.cat_id, p.pro_name, sp.pro_id, Minimum_Price_Of_Product
    FROM
        product p
    INNER JOIN (SELECT 
        pro_id, MIN(supp_price) AS Minimum_Price_Of_Product
    FROM
        supplier_pricing
    GROUP BY pro_id) AS SP ON sp.pro_id = p.pro_id) AS P_SP ON c.cat_id = P_SP.cat_id
GROUP BY c.cat_id; 

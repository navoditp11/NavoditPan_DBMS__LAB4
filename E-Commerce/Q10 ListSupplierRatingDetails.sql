CREATE PROCEDURE `ListSupplierRatingDetails` ()
BEGIN
SELECT 
    supp_id AS SUPPLIER_ID,
    supp_name AS SUPPLIER_NAME,
    AverageRating,
    CASE
        WHEN AverageRating = 5 THEN 'Excellent Service'
        WHEN AverageRating > 4 THEN 'Good Service'
        WHEN AverageRating > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
FROM
    (SELECT 
        s.SUPP_ID, s.SUPP_NAME, AVG(r.RAT_RATSTARS) AS AverageRating
    FROM
        rating r
    INNER JOIN `order` o
    INNER JOIN supplier_pricing sp
    INNER JOIN supplier s ON (r.ORD_ID = o.ORD_ID
        AND o.PRICING_ID = sp.PRICING_ID
        AND sp.SUPP_ID = s.SUPP_ID)
    GROUP BY SUPP_ID
    ORDER BY SUPP_ID) AS R_O_SP_S;
END

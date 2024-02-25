select * from customer;
select * from `order`
order by
CUS_ID;

SELECT 
    CO.CUS_GENDER AS 'Gender',
    COUNT(CO.CUS_GENDER) AS 'NoOfCustomers'
FROM
    (SELECT 
        c.CUS_ID, c.CUS_NAME, c.CUS_GENDER
    FROM
        customer c
    INNER JOIN `order` o ON c.CUS_ID = o.CUS_ID
    WHERE
        o.ORD_AMOUNT >= 3000
    GROUP BY c.CUS_ID) AS CO
GROUP BY CO.CUS_GENDER
;


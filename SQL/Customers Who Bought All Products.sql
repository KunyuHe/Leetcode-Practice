SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING
    COUNT(DISTINCT product_key) = (SELECT COUNT(*)
                                   FROM Product);
-- This works because "product_key" is a foreign key to `Product` table and every product in table `Customer` will be listed in table `Product`

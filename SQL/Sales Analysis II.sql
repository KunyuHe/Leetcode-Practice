SELECT DISTINCT buyer_id
FROM Sales
WHERE buyer_id NOT IN (SELECT DISTINCT buyer_id
                       FROM Sales
                       JOIN Product USING (product_id)
                       WHERE product_name = 'iPhone')
      AND buyer_id IN (SELECT DISTINCT buyer_id
                       FROM Sales
                       JOIN Product USING (product_id)
                       WHERE product_name = 'S8');

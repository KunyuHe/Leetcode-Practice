SELECT invoice_id, customer_name, price, contacts_cnt, trusted_contacts_cnt
FROM Invoices AS i
JOIN (SELECT customer_id, customer_name,
             COUNT(contact_name) AS contacts_cnt,
             SUM(IF(contact_email IN (SELECT email
                                      FROM Customers), 1, 0)) AS trusted_contacts_cnt
      FROM Customers AS cus
      LEFT JOIN Contacts AS con
      ON cus.customer_id = con.user_id
      GROUP BY customer_id) AS temp
ON i.user_id = temp.customer_id
ORDER BY invoice_id;

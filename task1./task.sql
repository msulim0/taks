
-- All orders by CM

SELECT cms.id AS user_id, orders.id AS order_id, cms.created_at AS user_created,
       orders.created_at AS ord_created, paid_at, category
FROM cms
LEFT JOIN orders
   ON cms.id = user_id
    

-- CMs that registered in 2020

SELECT id AS user_id, created_at AS user_created
FROM cms
WHERE EXTRACT(YEAR from created_at) = '2020'

-- CMs that made at least one paid order and what order it is
 
SELECT cms.id AS user_id, orders.id AS order_id,
       orders.created_at AS ord_created, paid_at, category
FROM cms
LEFT JOIN orders
   ON cms.id = user_id
WHERE paid_at IS NOT NULL

-- FINAL query.

SELECT cms.id, email, min(orders.created_at) AS first_order, category
FROM cms
INNER JOIN orders
        ON cms.id = orders.user_id
WHERE paid_at IS NOT NULL AND
      EXTRACT(YEAR from orders.created_at) = '2020'
GROUP BY cms.id, category

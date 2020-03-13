Find the total revenue and profit margin (in percent) per year for all orders and orderlines. Revenue per orderline is defined as (olquantity * partretailprice * (1 - oldiscount)). Profit margin is calculated as ((revenue - costs) / revenue) where cost per orderline is olquantity * supplypartcost. Sort the final result in ascending order of the year.

1)

``
SELECT
  orderyear,
  revenue,
  revenue - costs AS profit,
  ((revenue - costs) / revenue) * 100 AS profitmargin
FROM    (
          SELECT  EXTRACT(YEAR FROM orderdate) AS orderyear,
                          SUM((olquantity * partretailprice) * (1 - oldiscount)) AS revenue,
                          SUM(olquantity * supplypartcost) AS costs
          FROM    orderline, supplypart, part, orders
          WHERE   orderline.supplierid = supplypart.supplierid
                  AND orderline.partid = supplypart.partid
                  AND orderline.orderid = orders.orderid
                  AND supplypart.partid = part.partid
          GROUP   BY orderyear
          ORDER   BY orderyear ASC
) AS res;
``{{execute}}


-Order year, revenue, costs calculation as part of subquery

-High-level operations on placeholders in main query


Sub-query:

``
          SELECT  EXTRACT(YEAR FROM orderdate) AS orderyear,
                          SUM((olquantity * partretailprice) * (1 - oldiscount)) AS revenue,
                          SUM(olquantity * supplypartcost) AS costs
          FROM    orderline, supplypart, part, orders
          WHERE   orderline.supplierid = supplypart.supplierid
                  AND orderline.partid = supplypart.partid
                  AND orderline.orderid = orders.orderid
                  AND supplypart.partid = part.partid
          GROUP   BY orderyear
          ORDER   BY orderyear ASC;
``{{execute}}

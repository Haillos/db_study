--1
select 0 PRICE_GROUP, count(*) PRODEUCTS
from product_quiz
where price between 0 and 9999
UNION ALL
select 10000, count(*)
from product_quiz
where price between 10000 and 19999
UNION ALL
select 20000, count(*)
from product_quiz
where price between 20000 and 29999
UNION ALL
select 30000, count(*)
from product_quiz
where price between 30000 and 39999;

--2 
select TRUNC(price/10000), price/10000
from product_quiz;

select TRUNC(price/10000) price_group , count(*) products
from product_quiz
group by TRUNC(price/10000)
order by price_group;

select 
        CASE
            WHEN price BETWEEN 0 and 9999 then 0
            WHEN price BETWEEN 10000 and 19999 then 10000
            WHEN price BETWEEN 20000 and 29999 then 20000
            WHEN price BETWEEN 30000 and 39999 then 30000
            END price_group,
            COUNT(*) products
from product_quiz
group by CASE     
            WHEN price BETWEEN 0 and 9999 then 0
            WHEN price BETWEEN 10000 and 19999 then 10000
            WHEN price BETWEEN 20000 and 29999 then 20000
            WHEN price BETWEEN 30000 and 39999 then 30000
        END
        order by price_group;

---
select price price_group, count(*) products
from(
    select product_id, product_code, TRUNC(price/10000) * 10000 price
    from product_quiz)
group by price
order by price
;
---
select price price_group, count(*) products
from (
    select TRUNC(price/10000)*10000 price
    from product_quiz)
    group by price
    order by price
    ;
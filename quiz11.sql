select * from panmae;
select * from product;
select * from gift;

select 
to_char(to_date(p.p_date) , 'yyyy-mm-dd') 판매일자,
p.p_code 상품코드,
t.p_name 상품명,
t.p_price 상품가,
p.p_qty 구매수량,
to_char(p.p_total, '9,999') 총금액,
to_char(p.p_total*100, '999,999') 적립포인트,
case 
when p_date = 20110101 then to_char(p.p_total*200, '999,999')
else to_char(p.p_total*100, '999,999')
end as 새해2배적립포인트,
g.gname 사은품명,
to_char(g.g_start, '999,999') 포인트START,
to_char(g.g_end, '999,999') 포인트END
from panmae p, product t, gift g
where   p.p_code = t.p_code  
        and        
        case 
            when p_date = 20110101 then p.p_total*200
            else p.p_total*100
        end between g.g_start and g.g_end
order by p.p_date;
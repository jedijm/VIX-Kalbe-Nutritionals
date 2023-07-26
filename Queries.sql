--Age Average of each Marital Status
select "Marital Status", round(avg(age)) age_avg
from case_study_customer c
group by "Marital Status" 

--Age average of each gender
select  gender , round(avg(age)) as age_avg
from case_study_customer
group by gender

--Store with highest Quantity Sales 
select sum(qty) total_qty, css.storename  
from case_study_transaction cst  
join case_study_store css
on cst.storeid = css.storeid 
group by css.storename
order by 1 desc
limit 1

-- product with highest total amount sales
select sum(totalamount) total_amount_sum, csp."Product Name" 
from case_study_transaction cst 
join case_study_product csp 
on cst.productid = csp.productid 
group by 2
order by 1 desc
limit 1
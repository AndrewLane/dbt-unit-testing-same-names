with customer as (select * from {{ ref("customer") }})
select
    customer.customer_id,
    customer.customer_name,
    customer.customer_nation_id,
    customer.customer_account_balance,
    customer.customer_nation
from customer
where ceil(customer.customer_account_balance) % 2 = 1

with
    source_data_customer as (
        select * from {{ ref("stg_snowflakesampledata__customer") }}
    ),
    source_data_nation as (select * from {{ ref("stg_snowflakesampledata__nation") }})
select
    source_data_customer.c_custkey as customer_id,
    source_data_customer.c_name as customer_name,
    source_data_customer.c_nationkey as customer_nation_id,
    source_data_customer.c_acctbal as customer_account_balance,
    source_data_nation.n_name as customer_nation
from source_data_customer
inner join
    source_data_nation
    on source_data_customer.c_nationkey = source_data_nation.n_nationkey

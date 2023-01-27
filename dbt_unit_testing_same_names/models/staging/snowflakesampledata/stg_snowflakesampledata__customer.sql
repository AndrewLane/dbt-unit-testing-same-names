with source as (select * from {{ source("snowflakesampledata", "source_customer") }})
select *
from source
where source.c_acctbal > 9990

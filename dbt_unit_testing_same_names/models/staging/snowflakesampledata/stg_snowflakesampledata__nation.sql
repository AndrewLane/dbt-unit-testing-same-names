with source as (select * from {{ source("snowflakesampledata", "source_nation") }})
select *
from source

with source as (select * from {{ source("snowflakesampledata", "nation") }})
select *
from source

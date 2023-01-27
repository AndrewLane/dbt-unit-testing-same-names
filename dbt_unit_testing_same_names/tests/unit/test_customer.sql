{{ config(tags=["unit-test"]) }}

{% set options = {"include_missing_columns": true, "input_format": "csv"} %}

{% call dbt_unit_testing.test("customer", "test customer view") %}

{% call dbt_unit_testing.mock_ref("stg_snowflakesampledata__customer", options) %}
c_custkey | c_name | c_nationkey | c_acctbal
1234 | 'Bob' | 1 | 10000
5678 | 'Alice' | 2 | 20000
9102 | 'Mr. No Country' | null | 30000
{% endcall %}

{% call dbt_unit_testing.mock_ref("stg_snowflakesampledata__nation", options) %}
n_nationkey | n_name
1 | 'USA'
2 | 'Canada'
3 | 'Mexico'
{% endcall %}


{% call dbt_unit_testing.expect(options) %}
customer_id | customer_name | customer_nation_id | customer_account_balance | customer_nation
1234 | 'Bob' | 1 | 10000 | 'USA'
5678 | 'Alice' | 2 | 20000 | 'Canada'
{% endcall %}

{% endcall %}

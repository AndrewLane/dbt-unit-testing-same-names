{{ config(tags=["unit-test"]) }}

{% set options = {"include_missing_columns": true, "input_format": "csv"} %}

{% call dbt_unit_testing.test("odd_customer", "test odd_customer view") %}

{% call dbt_unit_testing.mock_ref("customer", options) %}
customer_id | customer_name | customer_nation_id | customer_account_balance | customer_nation
1234 | 'Bob' | 1 | 10000 | 'USA'
5678 | 'Alice' | 2 | 10001 | 'Canada'
{% endcall %}

{% call dbt_unit_testing.expect(options) %}
customer_id | customer_name | customer_nation_id | customer_account_balance | customer_nation
5678 | 'Alice' | 2 | 10001 | 'Canada'
{% endcall %}

{% endcall %}

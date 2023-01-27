# dbt-unit-testing-same-names
Testing the dbt-unit-testing package when your model names collide with your source table names

# Known Issue
Unbeknownst to be at the time of creating this repo, this is
a [known limitation](https://github.com/EqualExperts/dbt-unit-testing#known-limitations)!
There is a `use_qualified_sources` configuration that can be used to get around this! 

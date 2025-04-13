
  select *
  from "AwsDataCatalog"."jaffle_athena"."stg_orders"
  where status not in (placed, shipped, completed)

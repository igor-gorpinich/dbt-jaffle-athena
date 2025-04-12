-- macros/tests/accepted_statuses.sql
{% test accepted_statuses(model, column_name) %}
  select *
  from {{ model }}
  where {{ column_name }} not in ('placed', 'shipped', 'completed', 'returned')
{% endtest %}
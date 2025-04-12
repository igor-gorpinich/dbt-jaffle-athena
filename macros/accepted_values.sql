-- macros/tests/accepted_values.sql
{% test accepted_values(model, column_name, values) %}
  select *
  from {{ model }}
  where {{ column_name }} not in ({{ values | join(', ') }})
{% endtest %}
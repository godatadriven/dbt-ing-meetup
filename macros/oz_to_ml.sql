
{% macro oz_to_ml(column_name) %}
  {{ column_name }} * 29.5735296
{% endmacro %}

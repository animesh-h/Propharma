{% macro is_expired(expiry_date) %}
    {{ expiry_date }} < current_date
{% endmacro %}
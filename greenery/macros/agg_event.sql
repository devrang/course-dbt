{%- macro agg_event(event_type ) -%}
    MAX(CASE WHEN event_type='{{event_type}}' THEN 1.0 else 0 END)
{%- endmacro -%}
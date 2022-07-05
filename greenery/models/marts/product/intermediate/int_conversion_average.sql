{%- set event_types = dbt_utils.get_column_values(
    table=ref('stg_events__events'), 
    column='event_type'
    ) -%}

Select
    session_id,
    created_at_utc,
    user_id,
    product_id

{% for event_type in event_types %}
    ,{{events(event_type)}} as {{event_type}}
{ % endfor %}


from {{ ref('stg_events_events') }}
GROUP BY 1,2,3,4
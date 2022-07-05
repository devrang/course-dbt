WITH session_counts AS (
    SELECT session_id,
        {{agg_event('page_view')}} as pv,
        {{agg_event('add_to_cart')}} as atc,
        {{agg_event('checkout')}} as ckt
    from {{ ref('fct_events') }}
    GROUP BY session_id
)
SELECT
    SUM(ckt) / SUM(atc) as conversion_rate
FROM session_counts
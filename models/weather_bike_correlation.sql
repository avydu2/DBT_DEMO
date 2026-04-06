with CTE as(

    select 
    t.*,
    w.* 
    from {{ ref('trip_fact') }} t
    LEFT join {{ ref('daily_weather') }} w
    on t.TRIP_DATE = w.DAILY_WEATHER

    order by TRIP_DATE DESC
)

select 
*
from CTE
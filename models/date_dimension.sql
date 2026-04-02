WITH CTE AS(
    SELECT TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,
    DAYOFWEEK(TO_TIMESTAMP(STARTED_AT)) as DAY_STARTED_AT,
    {{get_daytype('STARTED_AT')}} AS DAY_TYPE,
    {{get_season('STARTED_AT')}} as SEASON_OF_YEAR
FROM {{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)

select * from CTE
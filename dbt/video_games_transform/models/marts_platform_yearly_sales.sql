{{ config(
    materialized='table',
    partition_by={
      "field": "release_year",
      "data_type": "int64",
      "range": {
        "start": 1980,
        "end": 2030,
        "interval": 1
      }
    },
    cluster_by=['platform']
) }}

with staging_data as (
    select * from {{ ref('stg_vgsales') }}
)

select
    platform,
    CAST(release_year AS INT64) as release_year,
    count(game_name) as total_games_released,
    sum(global_sales) as total_global_sales,
    ARRAY_AGG(genre ORDER BY global_sales DESC LIMIT 1)[OFFSET(0)] as top_selling_genre

from staging_data

group by 
    platform,
    release_year
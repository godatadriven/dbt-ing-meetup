

WITH beers_with_ml AS (
  SELECT
    *,
    ounces                   AS vol_in_ounces,
    {{ oz_to_ml('ounces') }} AS vol_in_mililiters
  FROM
    {{ ref('stg_beers') }}
)

SELECT
  *,
  COALESCE(
      vol_in_mililiters * abv > 25.4,
      FALSE
  ) AS allowed_to_drive
FROM beers_with_ml

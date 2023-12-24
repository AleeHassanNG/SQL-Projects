
And if you want to make it collapsible:

<details>
  <summary>Click to reveal SQL query</summary>
  
  ```sql
  SELECT 
    initcap(t1.sub_region) AS sub_region,
    count(*) AS city_count
  FROM
    cleaned_data.countries AS t1
  JOIN 
    cleaned_data.cities AS t2
  ON
    t1.country_code_2 = t2.country_code_2
  GROUP BY
    t1.sub_region
  ORDER BY 
    t1.sub_region;```
<details>

# SQL-Projects
<details>
  <summary>Click to reveal query</summary>
  
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
  t1.sub_region;.
</details>








<details>
  <summary>Click to reveal results</summary>
  
  Your results go here.
</details>


# Olympics Games Project

Email: alhassanaliyu55@gmail.com.

LinkedIn: https://www.linkedin.com/in/jaime-shaker/


#### Introduction

The "Olympic Games Project" aims to explore and derive insights from a dataset containing information about various Olympic Games, including details about athletes, countries, sports, and medals. This dataset serves as the foundation for a comprehensive analysis of historical Olympic events.

### Dataset
The data used was obtained from kaggle https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results  and are namely:
- athlete_events.xlsx: Olympic Games (1896 - 2016)
- noc_regions.xlsx : Name of Countries

### Getting Started
SQL Server was used to write all queries in this project but any SQL database may be used to give the exact solution or answers.

### Usage

#### 1. Count of Olympic Games
Objective: Determine the total number of Olympic Games held from the dataset.

<details>
  <summary>Click to reveal query</summary>

```sql
select count(distinct(Games)) as Olympic_Games
	from athlete_events;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Olympic_Games|
  |-------------|
  |51           |
</details>



2. Even or Odd Game Count
Objective: Classify each Olympic Game as Even or Odd based on the count.

<details>
  <summary>Click to reveal query</summary>

```sql
select *,
	case 
		when (a.Game_count % 2) = 0 
			then 'Even'
				else 'Odd'
					end As Even_or_Odd
from (select distinct games as Games, count(games) as Game_Count 
	from athlete_events group by Games ) as a
	group by a.Games,a.Game_count;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Games| Games_Count| Even or Odd|
  |-----|------------|------------|
  |1924 Summer	|5233	|Odd|
|1988 Winter	|2639	|Odd|
|1980 Winter	|1746	|Even|
|1906 Summer	|1733	|Odd
|2006 Winter	|4382	|Even
|1928 Summer	|4992	|Even
|1992 Summer	|12977	|Odd
|1960 Winter	|1116	|Even
|1984 Winter	|2134	|Even
|1968 Summer	|8588	|Even
|1900 Summer	|1936	|Even
|2016 Summer	|13688	|Even
|1932 Winter	|352	|Even
|1908 Summer	|3101	|Odd
|1912 Summer	|4040	|Even
|1936 Summer	|6506	|Even
|1976 Summer	|8641	|Odd
|1992 Winter	|3436	|Even
|1956 Winter	|1307	|Odd
|2008 Summer	|13602	|Even
|1984 Summer	|9454	|Even
|1964 Summer	|7702	|Even
|2014 Winter	|4891	|Odd
|1924 Winter	|460	|Even
|2004 Summer	|13443	|Odd
|2012 Summer	|12920	|Even
|1998 Winter	|3605	|Odd
|1972 Summer	|10304	|Even
|1936 Winter	|895	|Odd
|2000 Summer	|13821	|Odd
|1980 Summer	|7191	|Odd
|1988 Summer	|12037	|Odd
|1960 Summer	|8119	|Odd
|1904 Summer	|1301	|Odd
|2010 Winter	|4402	|Even
|1920 Summer	|4292	|Even
|1948 Winter	|1075	|Odd
|1948 Summer	|6405	|Odd
|1952 Summer	|8270	|Even
|1956 Summer	|5127	|Odd
|1952 Winter	|1088	|Even
|1964 Winter	|1778	|Even
|1996 Summer	|13780	|Even
|1972 Winter	|1655	|Odd
|1896 Summer	|380	|Even
|1994 Winter	|3160	|Even
|1932 Summer	|2969	|Odd
|1976 Winter	|1861	|Odd
|1968 Winter	|1891	|Odd
|2002 Winter	|4109	|Odd
|1928 Winter	|582	|Even|
</details>


3. Olympic Cities, Sports and Events Count
Objective: Identufy the cities where the Olympics Game took place and also count number sports and events.

<details>
  <summary>Click to reveal query</summary>

```sql
select distinct(City), Games, count(distinct sport) as Sport, count(distinct event) as Event 
	from athlete_events group by city, games
		order by Games;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |City| Games|  Sports| Events|
  |-----|--------|-----|----|
 |Athina|	1896 Summer|	9|	43|
|Paris	|1900 Summer	|20	|90|
|St. Louis	|1904 Summer	|18	|95|
|Athina	|1906 Summer	|13	|74|
|London	|1908 Summer	|24|	109|
|Stockholm|	1912 Summer	|17	|107|
|Antwerpen|	1920 Summer	|25	|158|
|Paris	|1924 Summer	|20	|131|
|Chamonix|	1924 Winter	|10	|17|
|Amsterdam|	1928 Summer	|17	|122|
|Sankt Moritz|	1928 Winter	|8	|14|
|Los Angeles|	1932 Summer	|18	|131
|Lake Placid|	1932 Winter	|7	|14|
|Berlin	|1936 Summer	|24|	150|
|Garmisch-Partenkirchen	|1936 Winter|	8|	17|
|London	|1948 Summer	|20	|153|
|Sankt Moritz|	1948 Winter|	9	|22|
|Helsinki	|1952 Summer	|19	|149|
|Oslo	|1952 Winter|	8	|22|
|Stockholm	|1956 Summer	|1	|6|
|Melbourne	|1956 Summer	|18	|145|
|Cortina d'Ampezzo|	1956 Winter|	8|	24|
|Roma	|1960 Summer	|19	|150|
|Squaw Valley|	1960 Winter|	8|	27|
|Tokyo	|1964 Summer	|21	|163|
|Innsbruck	|1964 Winter	|10|	34|
|Mexico City	|1968 Summer	|20	|172|
|Grenoble	|1968 Winter	|10	|35|
|Munich	|1972 Summer	|23	|193|
|Sapporo	|1972 Winter	|10	|35|
|Montreal	|1976 Summer	|23	|198|
|Innsbruck	|1976 Winter	|10|	37|
|Moskva	|1980 Summer	|23	|203|
|Lake Placid	|1980 Winter	|10|	38|
|Los Angeles	|1984 Summer	|25|	221|
|Sarajevo	|1984 Winter	|10	|39|
|Seoul	|1988 Summer	|27|	237|
|Calgary	|1988 Winter	|10	|46|
|Barcelona	|1992 Summer	|29	|257|
|Albertville	|1992 Winter|	12|	57|
|Lillehammer	|1994 Winter|	12|	61|
|Atlanta	|1996 Summer	|31	|271|
|Nagano	|1998 Winter	|14	|68|
|Sydney	|2000 Summer	|34|	300|
|Salt Lake City|	2002 Winter	|15	|78|
|Athina	|2004 Summer	|34	|301|
|Torino	||2006 Winter	|15|	84|
|Beijing	|2008 Summer	|34|	302|
|Vancouver	|2010 Winter	|15|	86|
|London	|2012 Summer	|32	|302|
|Sochi	|2014 Winter	|15	|98|
|Rio de Janeiro	|2016 Summer	|34	|306|

</details>


4. Top Country Each Year
Objective: Identify the top country each year with the most/highest participants.

<details>
  <summary>Click to reveal query</summary>

```sql
With cte as (select distinct concat(first_value(region) over (partition by games order by count(games) desc), ' - ', 
			first_value(games) over (partition by (games) order by count(games))) as Top_Country_Each_Year, Count(games) as Games
		from athlete_events as AE join noc_regions as NR on AE.NOC = NR.NOC
		where games in ('1896 Summer', '1900 Summer', '1904 Summer', '1906 Summer', '1908 Summer', '1912 Summer',
			'1920 Summer', '1924 Summer', '1924 Winter', '1928 Summer', '1928 Winter', '1932 Summer',
			'1932 Winter', '1936 Summer', '1936 Winter', '1948 Summer', '1948 Winter', '1952 Summer',
			'1952 Winter', '1956 Summer', '1956 Winter', '1960 Summer', '1960 Winter', '1964 Summer',
			'1964 Winter', '1968 Summer', '1968 Winter', '1972 Summer', '1972 Winter', '1976 Summer',
			'1976 Winter', '1980 Summer', '1980 Winter', '1984 Summer', '1984 Winter', '1988 Summer',
			'1988 Winter', '1992 Summer', '1992 Winter', '1994 Winter', '1996 Summer', '1998 Winter',
			'2000 Summer', '2002 Winter', '2004 Summer', '2006 Winter', '2008 Summer', '2008 Winter',
			'2010 Winter', '2012 Summer', '2014 Winter', '2016 Summer') 
		group by 
			region, games
		)
select 
		Top_Country_Each_Year, max(games) as Max_Games
from
		cte
	group by Top_Country_Each_Year 
	order by Top_Country_Each_Year ;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

 |Top_Country_Each_Year| Max_Games|  
  |-----|--------|
  |Australia - 2000 Summer|	788
Belgium - 1920 Summer	|518
China - 2008 Summer	|777
France - 1900 Summer|	1071
France - 1924 Summer|	636
France - 1924 Winter|	68
Germany - 1928 Winter|	51
Germany - 1936 Summer|	581
Germany - 1952 Summer|	458
Germany - 1960 Winter|	110
Germany - 1964 Winter|	144
Germany - 1968 Summer|	778
Germany - 1968 Winter|	222
Germany - 1972 Summer|	1041
Germany - 1972 Winter|	191
Germany - 1976 Summer|	859
Germany - 1976 Winter|	202
Germany - 1980 Winter|	205
Germany - 1984 Winter|	225
Germany - 1988 Summer|	918
Germany - 1988 Winter|	253
Greece - 1896 Summer|	148
Greece - 1906 Summer|	495
Italy - 1956 Winter	|93
Norway - 1952 Winter|	101
Russia - 1980 Summer|	660
Sweden - 1912 Summer|	714
Switzerland - 1948 Winter|	99
UK - 1908 Summer	|972
UK - 1948 Summer	|590
USA - 1904 Summer	|1109
USA - 1928 Summer	|426
USA - 1932 Summer	|743
USA - 1932 Winter	|70
USA - 1936 Winter	|74
USA - 1956 Summer	|443
USA - 1960 Summer	|428
USA - 1964 Summer	|492
USA - 1984 Summer	|693
USA - 1992 Summer	|734
USA - 1992 Winter	|234
USA - 1994 Winter	|237
USA - 1996 Summer	|839
USA - 1998 Winter	|284
USA - 2002 Winter	|313
USA - 2004 Summer	|726
USA - 2006 Winter	|325
USA - 2010 Winter	|341
USA - 2012 Summer	|689
USA - 2014 Winter	|367
USA - 2016 Summer	|719

</details>


5. Nations Participated in All Olympic Games
Objective: Identify nations that participated in all Olympic Games.

<details>
  <summary>Click to reveal query</summary>

```sql
select 
	Region as Nation, count(distinct(games)) as Game_Played
from 
	athlete_events join noc_regions on athlete_events.noc = noc_regions.noc
group by 
	region
having count(distinct(games)) = 51;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Nation|Game_Played|
  |-------------|---|
  |France	|51
Italy	|51
Switzerland	|51
UK	|51

</details>


6. Count of Vowels and Counsonants Letters
Objective: Highlight the count of vowels and consonants alphabets in each distinct region's name and give the percentage of the count of vowels and consonants in each of the names

<details>
  <summary>Click to reveal query</summary>

```sql
with cte1 as
		(select distinct region, len(region) as reg_len,
		len(replace(replace(replace(replace(replace(region, 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')) as Consonant_Count
		from noc_regions ),

	cte2 as
		(select region, Consonant_Count,
		reg_len - consonant_Count as Vowel_Count,
		round( 100 * (reg_len - consonant_Count) / reg_len, 2) as vowel_perc, 
		round( 100 * Consonant_Count / reg_len, 2) as Consonant_Perc
		from cte1)
	select 
		Region, concat(vowel_Count, ' (', vowel_perc, '%)') as Vowel_Count_Perc,
		concat(Consonant_Count, ' (', Consonant_Perc, '%)') as Consonant_Count_Perc
	from cte2;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Region|Vowel_Count_Perc|Consonant_Count_Perc|
  |-------------|--|--|
  |Afghanistan	|4 (36%)|	7 (63%)
Albania	|4 (57%)	|3 (42%)
Algeria	|4 (57%)	|3 (42%)
American Samoa	|7 (50%)	|7 (50%)
Andorra	|3 (42%)	|4 (57%)
Angola	|3 (50%)	|3 (50%)
Antigua	|4 (57%)	|3 (42%)
Argentina|	4 (44%)	|5 (55%)
Armenia	|4 (57%)	|3 (42%)
Aruba	|3 (60%)	|2 (40%)
Australia|	5 (55%)	|4 (44%)
Austria	|4 (57%)	|3 (42%)
Azerbaijan|	5 (50%)	|5 (50%)
Bahamas|	3 (42%)	|4 (57%)
Bahrain	|3 (42%)	|4 (57%)
Bangladesh|	3 (30%)	|7 (70%)
Barbados	|3 (37%)	|5 (62%)
Belarus	|3 (42%)	|4 (57%)
Belgium	|3 (42%)	|4 (57%)
Belize	|3 (50%)	|3 (50%)
Benin	|2 (40%)	|3 (60%)
Bermuda	|3 (42%)	|4 (57%)
Bhutan	|2 (33%)	|4 (66%)
Boliva	|3 (50%)	|3 (50%)
Bosnia and Herzegovina	|9 (40%)|	13 (59%)
Botswana|	3 (37%)	|5 (62%)
Brazil	|2 (33%)	|4 (66%)
Brunei	|3 (50%)	|3 (50%)
Bulgaria	|4 (50%)	|4 (50%)
Burkina Faso	|5 (41%)|	7 (58%)
Burundi	|3 (42%)|	4 (57%)
Cambodia|	4 (50%)|	4 (50%)
Cameroon|	4 (50%)	|4 (50%)
Canada	|3 (50%)	|3 (50%)
Cape Verde	|4 (40%)|	6 (60%)
Cayman Islands	|4 (28%)	|10 (71%)
Central African Republic|	8 (33%)	|16 (66%)
Chad	|1 (25%)	|3 (75%)
Chile	|2 (40%)	|3 (60%)
China	|2 (40%)	|3 (60%)
Colombia|	4 (50%)	|4 (50%)
Comoros	|3 (42%)	|4 (57%)
Cook Islands|	4 (33%)	|8 (66%)
Costa Rica	|4 (40%)	|6 (60%)
Croatia|	4 (57%)	|3 (42%)
Cuba|	2 (50%)	|2 (50%)
Curacao|	4 (57%)	|3 (42%)
Cyprus|	1 (16%)	|5 (83%)
Czech Republic|	4 (28%)	|10 (71%)
Democratic Republic of the Congo|	11 (34%)	|21 (65%)
Denmark	|2 (28%)	|5 (71%)
Djibouti|	4 (50%)	|4 (50%)
Dominica|	4 (50%)|	4 (50%)
Dominican Republic|	7 (38%)|	11 (61%)
Ecuador|	4 (57%)|	3 (42%)
Egypt	|1 (20%)|	4 (80%)
El Salvador|	4 (36%)	|7 (63%)
Equatorial Guinea|	10 (58%)|	7 (41%)
Eritrea |4 (57%)	|3 (42%)
Estonia	|4 (57%)	|3 (42%)
Ethiopia|	5 (62%)|	3 (37%)
Fiji	|2 (50%)	|2 (50%)
Finland	|2 (28%)	|5 (71%)
France	|2 (33%)	|4 (66%)
Gabon	|2 (40%)	|3 (60%)
Gambia	|3 (50%)	|3 (50%)
Georgia	|4 (57%)	|3 (42%)
Germany	|2 (28%)	|5 (71%)
Ghana	|2 (40%)	|3 (60%)
Greece	|3 (50%)	|3 (50%)
Grenada	|3 (42%)	|4 (57%)
Guam	|2 (50%)	|2 (50%)
Guatemala|	5 (55%)|	4 (44%)
Guinea	|4 (66%)	|2 (33%)
Guinea-Bissau	|7 (53%)	|6 (46%)
Guyana	|3 (50%)	|3 (50%)
Haiti	|3 (60%)	|2 (40%)
Honduras|	3 (37%)	|5 (62%)
Hungary	|2 (28%)	|5 (71%)
Iceland	|3 (42%)	|4 (57%)
India	|3 (60%)	|2 (40%)
Individual Olympic Athletes	|10 (37%)|	17 (62%)
Indonesia|	5 (55%)	|4 (44%)
Iran	|2 (50%)	|2 (50%)
Iraq	|2 (50%)	|2 (50%)
Ireland	|3 (42%)	|4 (57%)
Israel	|3 (50%)	|3 (50%)
Italy	|2 (40%)	|3 (60%)
Ivory Coast|	4 (36%)|	7 (63%)
Jamaica	|4 (57%)	|3 (42%)
Japan	|2 (40%)	|3 (60%)
Jordan	|2 (33%)	|4 (66%)
Kazakhstan|	3 (30%)	|7 (70%)
Kenya	|2 (40%)	|3 (60%)
Kiribati|	4 (50%)	|4 (50%)
Kosovo|	3 (50%)	|3 (50%)
Kuwait|	3 (50%)	|3 (50%)
Kyrgyzstan	|1 (10%)	|9 (90%)
Laos	|2 (50%)|	2 (50%)
Latvia	|3 (50%)|	3 (50%)
Lebanon	|3 (42%)|	4 (57%)
Lesotho	|3 (42%)|	4 (57%)
Liberia	|4 (57%)|	3 (42%)
Libya	|2 (40%)|	3 (60%)
Liechtenstein	|5 (38%)	|8 (61%)
Lithuania|	5 (55%)	|4 (44%)
Luxembourg|	4 (40%)	|6 (60%)
Macedonia	|5 (55%)|	4 (44%)
Madagascar	|4 (40%)|	6 (60%)
Malawi	|3 (50%)	|3 (50%)
Malaysia|	4 (50%)	|4 (50%)
Maldives|	3 (37%)	|5 (62%)
Mali	|2 (50%)	|2 (50%)
Malta	|2 (40%)	|3 (60%)
Marshall Islands	|4 (25%)	|12 (75%)
Mauritania|	6 (60%)	|4 (40%)
Mauritius	|5 (55%)	|4 (44%)
Mexico	|3 (50%)	|3 (50%)
Micronesia	|5 (50%)	|5 (50%)
Moldova	|3 (42%)	|4 (57%)
Monaco	|3 (50%)	|3 (50%)
Mongolia	|4 (50%)	|4 (50%)
Montenegro|	4 (40%)	|6 (60%)
Morocco	|3 (42%)	|4 (57%)
Mozambique	|5 (50%)	|5 (50%)
Myanmar	|2 (28%)	|5 (71%)
NA	|1 (50%)	|1 (50%)
Namibia|	4 (57%)	|3 (42%)
Nauru|	3 (60%)	|2 (40%)
Nepal|	2 (40%)|	3 (60%)
Netherlands	|3 (27%)	|8 (72%)
New Zealand	|4 (36%)	|7 (63%)
Nicaragua	|5 (55%)	|4 (44%)
Niger	|2 (40%)	|3 (60%)
Nigeria	|4 (57%)	|3 (42%)
North Korea	|4 (36%)	|7 (63%)
Norway	|2 (33%)	|4 (66%)
Oman	|2 (50%)	|2 (50%)
Pakistan|	3 (37%)	|5 (62%)
Palau	|3 (60%)	|2 (40%)
Palestine	|4 (44%)|	5 (55%)
Panama	|3 (50%)	|3 (50%)
Papua New Guinea	|8 (50%)|	8 (50%)
Paraguay|	4 (50%)|	4 (50%)
Peru|	2 (50%)	|2 (50%)
Philippines	|4 (36%)	|7 (63%)
Poland	|2 (33%)	|4 (66%)
Portugal	|3 (37%)	|5 (62%)
Puerto Rico|	5 (45%)|	6 (54%)
Qatar	|2 (40%)	|3 (60%)
Republic of Congo|	6 (35%)|	11 (64%)
Romania	|4 (57%)|	3 (42%)
Russia	|3 (50%)|	3 (50%)
Rwanda	|2 (33%)|	4 (66%)
Saint Kitts	|3 (27%)	|8 (72%)
Saint Lucia	|5 (45%)	|6 (54%)
Saint Vincent	|4 (30%)|	9 (69%)
Samoa	|3 (60%)|	2 (40%)
San Marino	|4 (40%)	|6 (60%)
Sao Tome and Principe	|8 (38%)|	13 (61%)
Saudi Arabia	|7 (58%)	|5 (41%)
Senegal	|3 (42%)	|4 (57%)
Serbia	|3 (50%)	|3 (50%)
Seychelles	|3 (30%)|	7 (70%)
Sierra Leone	|6 (50%)|	6 (50%)
Singapore|	4 (44%)	|5 (55%)
Slovakia|	4 (50%)	|4 (50%)
Slovenia|	4 (50%)	|4 (50%)
Solomon Islands|	5 (33%)|	10 (66%)
Somalia	|4 (57%)	|3 (42%)
South Africa|	5 (41%)	|7 (58%)
South Korea	|5 (45%)	|6 (54%)
South Sudan	|4 (36%)	|7 (63%)
Spain	|2 (40%)	|3 (60%)
Sri Lanka|	3 (33%)	|6 (66%)
Sudan	|2 (40%)	|3 (60%)
Suriname|	4 (50%)	|4 (50%)
Swaziland|	3 (33%)	|6 (66%)
Sweden	|2 (33%)	|4 (66%)
Switzerland	|3 (27%)|	8 (72%)
Syria	|2 (40%)	|3 (60%)
Taiwan	|3 (50%)	|3 (50%)
Tajikistan	|4 (40%)	|6 (60%)
Tanzania	|4 (50%)	|4 (50%)
Thailand	|3 (37%)	|5 (62%)
Timor-Leste	|4 (36%)	|7 (63%)
Togo	|2 (50%)	|2 (50%)
Tonga	|2 (40%)	|3 (60%)
Trinidad	|3 (37%)	|5 (62%)
Tunisia	|4 (57%)|	3 (42%)
Turkey	|2 (33%)	|4 (66%)
Turkmenistan	|4 (33%)|	8 (66%)
Uganda|	3 (50%)	|3 (50%)
UK|	1 (50%)	|1 (50%)
Ukraine	|4 (57%)|	3 (42%)
United Arab Emirates|	9 (45%)|	11 (55%)
Uruguay|	4 (57%)	|3 (42%)
USA	|2 (66%)|	1 (33%)
Uzbekistan|	4 (40%)	|6 (60%)
Vanuatu|	4 (57%)	|3 (42%)
Venezuela|	5 (55%)|	4 (44%)
Vietnam|	3 (42%)	|4 (57%)
Virgin Islands, British	|6 (26%)	|17 (73%)
Virgin Islands, US| 5 (27%)	|13 (72%)
Yemen	|2 (40%)	|3 (60%)
Zambia	|3 (50%)	|3 (50%)
Zimbabwe	|3 (37%)	|5 (62%)

</details>


7. Sport Played in All Summer Olympics
Objective: Identify the sport played in all summer Olympics.

<details>
  <summary>Click to reveal query</summary>

```sql
select count(distinct(Games)) as Olympic_Games
	from athlete_events;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Olympic_Games|
  |-------------|
  |51           |
</details>


8. Sports Played Once
Objective: Identify sports that were played only once in the history of the Olympic Games.

<details>
  <summary>Click to reveal query</summary>

```sql
 with cte1 as(
		select distinct (games), sport from athlete_events),
	cte2 as (select Sport, count(1) as No_of_Sports from cte1 group by sport)
select c2.Sport, c1.Games, No_of_Sports
		from cte2 as c2 join cte1 as c1 on c2.Sport = c1.Sport
		where No_of_Sports = 1
		order by Sport;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Sport| Games| No_of_Sports|
  |-------------|-|-|
  |Aeronautics	|1936 Summer|	1
Basque Pelota	|1900 Summer|	1
Cricket	|1900 Summer	|1
Croquet	|1900 Summer	|1
Jeu De Paume|	1908 Summer	|1
Military Ski Patrol|	1924 Winter|	1
Motorboating	|1908 Summer	|1
Racquets|	1908 Summer	|1
Roque	|1904 Summer	|1
Rugby Sevens|	2016 Summer	|1

</details>


9. Oldest Athlete To Win Gold Medal
Objective: Identify the oldest athlete who won a gold medal in the history of the Olympic Games.

<details>
  <summary>Click to reveal query</summary>

```sql
with cte as (select
	Name, Sex, Age, Team, Games, Medal, rank() over (order by age desc) as Rnk
from 
	athlete_events ae join noc_regions nr on ae.noc = nr.noc
where Medal = 'Gold')
select * from cte where RNK = 1;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Name	|Sex	|Age	|Team	|Games	|Medal	|Rnk
  |-------------|-|-|-|-|-|-|
  |Charles Jacobus	|M	|64	|United States	|1904 Summer|	Gold	|1
Oscar Gomer Swahn|	M|	64	|Sweden	|1912 Summer	|Gold	|1

</details>


10. Ratio Of Men To Female
Objective: Determine the ratio of male to female athletes participating in all Olympic Games.

<details>
  <summary>Click to reveal query</summary>

```sql
with cte as(
		select sum(case when sex = 'M' then 1 else 0 end) as Male, sum(case when sex = 'F' then 1 else 0 end) as Female
		from athlete_events ),
	cte1 as
		(select cast(male as int) as M, cast(Female as float) as F from cte)
select concat('1:', round(M/F, 2)) as Ratio from cte1;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Ratio|
  |-------------|
  |1:2.64 |

</details>


11. Top 5 Most Successful Nation
Objective: Identify and present the top five successful countries in the Olympics, defining success based on the highest number of medals won.

<details>
  <summary>Click to reveal query</summary>

```sql
 with cte1 as (select region as Countries, count(1) Medals
		from athlete_events ae inner join noc_regions nr on ae.NOC =nr.NOC
		where not medal like '%NA%'
		group by region),
	cte2 as (select *, rank() over (order by Medals desc) as RNK from cte1)
select cte2.*
		from cte2
		where RNK <= 5;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Countries|Medals|RNK|
  |-------------|-|-|
  |USA	|5637|	1
Russia	|3947	|2
Germany	|3756	|3
UK	|2068	|4
France	|1777|	5

</details>


12. Distinct Medals Won By Each Country
Objective: List the total number of gold, silver, and bronze medals won by each country in the Olympics.
<details>
  <summary>Click to reveal query</summary>

```sql
select * 
	from (select region as Country, medal 
	from athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
	where medal <> 'NA') as medals_table
pivot (
	count(medal) for medal in (Bronze, Gold, Silver)) as pivot_table
	order by bronze desc, gold desc, silver desc;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Country	|Bronze|	Gold	|Silver|
  |-------------|-|-|-|
  |USA|	1358|	2638|	1641
Germany|	1260	|1301	|1195
Russia|	1178	|1599	|1170
France|	666	|501	|610
UK	|651|	678	|739
Sweden|	535	|479	|522
Italy	|531|575	|531
Australia|	522	|368|	459
Canada	|451	|463	|438
Finland|	432	|198	|270
Netherlands	|413	|287|	340
Hungary	|371	|432	|332
Japan	|357	|247	|309
Norway	|294	|378	|361
China	|293	|351	|349
Romania	|292	|161	|200
Switzerland	|268	|175|	248
Czech Republic|	259	|123	|262
Poland	|253	|117|	195
Brazil	|191	|109	|175
South Korea|	185	|221|	232
Denmark	|177	|179|	241
Belgium	|173	|98	|197
Serbia	|160	|157|	222
Austria	|156	|108|	186
Bulgaria|	144	|54	|144
Spain	|136	|110	|243
Cuba	|116	|164	|129
Ukraine	|100	|47	|52
Argentina|	91	|91|	92
Greece	|84	|62	|109
New Zealand|	82|	90|	56
Belarus	|71	|24	|44
Mexico	|54	|30	|26
South Africa|	52	|32	|47
Lithuania	|48	|6	|7
Nigeria	|46	|23	|30
Jamaica	|44	|38	|75
India	|40	|138|	19
Croatia	|37	|58	|54
North Korea	|35	|16|	16
Pakistan|	34	|42	|45
Kazakhstan	|32	|20	|25
Kenya	|31	|34	|41
Uruguay	|30	|31	|2
Iran	|29	|18	|21
Turkey	|28	|40	|27
Slovenia	|27	|8|	13
Portugal	|26	|4|	11
Estonia	|25	|13	|12
Azerbaijan|	25	|7	|12
Ethiopia|	22	|22	|9
Trinidad|	22	|7	|8
Ghana	|22	|0	|1
Chile	|20	|3	|9
Georgia	|18	|8	|6
Taiwan	|18	|3	|28
Uzbekistan|	17	|10	|7
Bahamas	|15	|14	|11
Colombia|	14	|5	|9
Mongolia|	14	|2	|10
Slovakia|	13	|15	|19
Indonesia|	13	|11	|17
Ireland	|13	|9	|13
Thailand|	13	|9	|8
Latvia	|13	|3	|19
Egypt	|12	|7	|8
Morocco	|12	|6	|5
Venezuela|	10	|2|	3
Armenia	|9	|2	|5
Algeria	|8	|5|	4
Tunisia	|7	|3|	3
Israel	|7	|1|	1
Philippines	|7|	0	|3
Puerto Rico	|6	|1	|2
Liechtenstein|	5|	2|	2
Haiti	|5	|1	|1
Malaysia	|5	|0|	11
Moldova	|5	|0	|3
Saudi Arabia|	5|	0	|1
Qatar|	4	|0|	1
Individual Olympic Athletes	|3	|1|	1
Dominican Republic	|2	|3	|2
Uganda	|2	|2	|3
Syria	|2	|1	|2
Tajikistan|	2	|1|	1
Costa Rica	|2|	1	|1
Panama	|2	|1|	0
Iceland	|2	|0	|15
Lebanon	|2	|0	|2
Kyrgyzstan|	2|	0|	1
Kuwait	|2	|0	|0
Afghanistan|	2	|0|	0
Cameroon	|1	|20	|1
Zimbabwe	|1	|17	|4
Bahrain|	1	|1	|1
Ivory Coast|	1|	1|	1
United Arab Emirates	|1	|1	|0
Suriname	|1	|1	|0
Mozambique	|1|	1|	0
Niger	|1	|0	|1
Zambia	|1|	0|	1|
Togo	|1|	0|	0|
Macedonia|	1|	0|	0
Monaco	|1|	0|	0|
Mauritius|	1|	0|	0
Guyana	|1|	0|	0|
Iraq	|1|	0|	0|
Barbados|	1|	0|	0
Bermuda	|1|	0|	0
Djibouti|	1	|0|	0
Eritrea	|1|	0	|0
Fiji	|0|	13|	0
Luxembourg	|0	|4	|4
Peru	|0	|1|	14
Vietnam	|0	|1|	3
Grenada	|0	|1|	1
Ecuador	|0	|1|	1
Burundi	|0	|1|	1
Jordan	|0	|1|	0
Kosovo	|0	|1|	0
Nepal	|0	|1	|0
Paraguay	|0|	0|	17
Montenegro|	0|	0|	14
Namibia	|0	|0|	4
Sri Lanka|	0|	0|	2
Tanzania|	0|	0|	2
Tonga	|0|	0|	1|
Virgin Islands, US	|0|	0|	1
Sudan	|0	|0	|1
Senegal	|0	|0	|1
Guatemala|	0|	0|	1
Botswana|	0|	0|	1
Curacao	|0	|0	|1
Cyprus	|0	|0	|1
Gabon	|0	|0|	1

</details>

13. Countries With highest Medals Each Year
Objective: Identify the country that won the most gold, most silver, most bronze medals, and the most overall medals in each Olympic Games.

<details>
  <summary>Click to reveal query</summary>

```sql
with cte1 as
		(select distinct (games) as Game, region as Country,
		sum(case when medal = 'bronze' then 1 else 0 end) as Bronze,
		sum(case when medal = 'gold' then 1 else 0 end) as Gold,
		sum(case when medal = 'silver' then 1 else 0 end) as Silver,
		sum(case when medal <> 'NA' then 1 else 0 end) as Medals
		from athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
		group by  Games, region)
select distinct(Game),
		concat (first_value(country) over (partition by game order by bronze desc), ' - ', first_value(bronze) over (partition by game order by bronze desc)) as Max_Bronze,
		concat(first_value(country) over (partition by game order by gold desc), ' - ', first_value(gold) over (partition by game order by gold desc)) as Max_Gold,
		concat(first_value(country) over (partition by game order by silver desc), ' - ', first_value(silver) over (partition by game order by silver desc)) as Max_Silver, 
		concat(first_value(country) over (partition by game order by Medals desc), ' - ', first_value(Medals) over (partition by game order by Medals desc)) as Max_Medals 
		from cte1
;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Game	|Max_Bronze	|Max_Gold	|Max_Silver	|Max_Medals|
  |-------------|-|-|-|-|
  |
1896 Summer	|Greece - 20|	Germany - 25|	Greece - 18	|Greece - 48
1900 Summer	|France - 82	|UK - 59	|France - 101	|France - 235
1904 Summer	|USA - 125	|USA - 128|	USA - 141	|USA - 394
1906 Summer	|Greece - 30	|Greece - 24	|Greece - 48	|Greece - 102
1908 Summer	|UK - 90	|UK - 147	|UK - 131	|UK - 368
1912 Summer|	UK - 59	|Sweden - 103	|UK - 64	|Sweden - 190
1920 Summer	|Belgium - 66	|USA - 111	|France - 71	|USA - 194
1924 Summer	|USA - 49	|USA - 97	|France - 51	|USA - 182
1924 Winter|	UK - 11|	UK - 16	|USA - 10|	UK - 31
1928 Summer	|Germany - 41	|USA - 47	|Netherlands - 29	|USA - 88
1928 Winter|	Switzerland - 12	|Canada - 12	|Sweden - 13	|Sweden - 16
1932 Summer|	USA - 61|	USA - 81	|USA - 47	|USA - 189
1932 Winter|	Germany - 14	|Canada - 14|	USA - 21	|USA - 34
1936 Summer	|Germany - 61	|Germany - 93	|Germany - 70	|Germany - 224
1936 Winter	|USA - 14|	UK - 12	|Canada - 13	|Norway - 18
1948 Summer|	USA - 35	|USA - 87|	UK - 42	|USA - 152
1948 Winter	|Switzerland - 19	|Canada - 13|	Czech Republic - 17|	Switzerland - 28
1952 Summer	|Hungary - 32|	USA - 83	|Russia - 62	|USA - 134
1952 Winter	|Sweden - 23	|Canada - 16	|USA - 25	|USA - 30
1956 Summer|	Russia - 55	|Russia - 68	|Russia - 46	|Russia - 169
1956 Winter|	Canada - 18|	Russia - 26|	USA - 19	|Russia - 37
1960 Summer	|Russia - 45	|USA - 81	|Russia - 63	|Russia - 169
1960 Winter|	Russia - 28|	USA - 19	|Canada - 17	|Russia - 42
1964 Summer|	Russia - 51|	USA - 95	|Russia - 63	|Russia - 174
1964 Winter	|Czech Republic - 17	|Russia - 30|	Sweden - 21|	Russia - 47
1968 Summer	|Russia - 64	|USA - 99	|Russia - 63|	Russia - 192
1968 Winter	|Canada - 18	|Russia - 26	|Czech Republic - 19|	Russia - 37
1972 Summer|	Germany - 96	|Russia - 107	|Germany - 83	|Germany - 253
1972 Winter	|Czech Republic - 19|	Russia - 36|	USA - 18	|Russia - 45
1976 Summer	|Russia - 77|	Germany - 123|	Russia - 95	|Russia - 286
1976 Winter	|Germany - 37	|Russia - 38	|Czech Republic - 19	|Germany - 64
1980 Summer	|Russia - 126	|Russia - 187|	Russia - 129	|Russia - 442
1980 Winter	|Sweden - 20	|USA - 24	|Russia - 29	|Russia - 54
1984 Summer|	Germany - 53|	USA - 186	|USA - 116	|USA - 352
1984 Winter	|Sweden - 21	|Russia - 29	|Czech Republic - 24	|Russia - 56
1988 Summer	|Russia - 99|	Russia - 134|	Germany - 91|	Russia - 300
1988 Winter|	Sweden - 23|	Russia - 40|	Germany - 22	|Russia - 66
1992 Summer	|USA - 85	|Russia - 92	|Russia - 61|	USA - 224
1992 Winter|	Czech Republic - 27	|Russia - 35|	Canada - 28|	Russia - 59
1994 Winter	|Finland - 29	|Sweden - 23	|Canada - 29	|Germany - 40
1996 Summer|	Australia - 84|	USA - 159	|China - 70|	USA - 259
1998 Winter|	Finland - 49|	USA - 25	|Russia - 32	|Finland - 58
2000 Summer	|Germany - 64|	USA - 130|	Australia - 69|	USA - 242
2002 Winter	|Russia - 27	|Canada - 52|	USA - 58|	USA - 84
2004 Summer	|Russia - 95	|USA - 117|	Australia - 77	|USA - 263
2006 Winter|	USA - 32	|Sweden - 35|	Finland - 34	|Canada - 69
2008 Summer|	USA - 80	|USA - 127	|USA - 110|	USA - 317
2010 Winter	|Finland - 46	|Canada - 67	|USA - 63	|USA - 97
2012 Summer	|Australia - 59|	USA - 145	|USA - 57	|USA - 248
2014 Winter|	Finland - 24	|Canada - 59	|Sweden - 32|	Canada - 86
2016 Summer	|USA - 71	|USA - 139	|UK - 55	|USA - 264

</details>


14. Countries With Zero Medals
Objective: Identify countries that have never won gold, silver, or bronze medals in the Olympic Games.

<details>
  <summary>Click to reveal query</summary>

```sql
with cte1 as (
		select distinct(region) as Country,
		sum(case when medal = 'bronze' then 1 else 0 end) as Bronze,
		sum(case when medal = 'Gold' then 1 else 0 end) as Gold, 
		sum( case when medal = 'Silver' then 1 else 0 end) as Silver
		from athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
		group by region)
select C1.* 
		from cte1 as c1
		where gold = 0 and silver = 0 and bronze = 0 ;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Country|	Bronze|	Gold	|Silver|
  |-------------|-|-|-|
  |
Albania	|0	|0	|0
American Samoa	|0|	0|	0
Andorra	|0	|0	|0
Angola	|0	|0	|0
Antigua	|0	|0|	0
Aruba	|0	|0|	0
Bangladesh|	0|	0|	0
Belize	|0	|0|	0
Benin	|0	|0	|0
Bhutan	|0	|0	|0
Boliva	|0	|0	|0
Bosnia and Herzegovina	|0	|0|	0
Brunei	|0	|0	|0
Burkina Faso|	0|	0|	0
Cambodia	|0	|0|	0
Cape Verde	|0	|0|	0
Cayman Islands|	0|	0|	0
Central African Republic|	0	|0	|0
Chad	|0|	0|	0
Comoros	|0	|0|	0|
Cook Islands	|0|	0|	0
Democratic Republic of the Congo|	0|	0|	0
Dominica	|0	|0|	0
El Salvador	|0	|0	|0
Equatorial Guinea|	0|	0|	0
Gambia	|0	|0|	0
Guam	|0	|0|	0
Guinea	|0	|0|	0
Guinea-Bissau|	0|	0|	0
Honduras	|0	|0|	0
Kiribati	|0|	0|	0
Laos	|0	|0|	0
Lesotho	|0	|0|	0
Liberia	|0	|0|	0
Libya	|0	|0|	0
Madagascar|	0|	0|	0
Malawi	|0	|0|	0
Maldives|	0	|0|	0
Mali	|0	|0|	0
Malta	|0	|0	|0
Marshall Islands|	0|	0|	0
Mauritania	|0	|0|	0
Micronesia	|0|	0|	0
Myanmar	|0	|0|	0
NA	|0	|0	|0
Nauru	|0	|0	|0
Nicaragua	|0|	0|	0
Oman	|0	|0|	0
Palau	|0	|0	|0
Palestine	|0	|0|	0
Papua New Guinea|	0	|0|	0
Republic of Congo|	0|	0|	0
Rwanda	|0	|0	|0
Saint Kitts	|0|	0|	0
Saint Lucia	|0	|0	|0
Saint Vincent	|0	|0|	0
Samoa	|0	|0	|0
San Marino|	0|	0	|0
Sao Tome and Principe|	0|	0|	0
Seychelles	|0	|0	|0
Sierra Leone|	0	|0|	0
Solomon Islands	|0	|0|	0
Somalia	|0|	0	|0
South Sudan	|0	|0|	0
Swaziland	|0|	0|	0
Timor-Leste	|0	|0|	0
Turkmenistan	|0	|0|	0
Vanuatu	|0	|0	|0
Virgin Islands, British|	0	|0	|0
Yemen	|0	|0|	0

</details>


15. Nigeria Top 10 Sports Won
Objective: Identify the top 10 sports in which Nigeria won the highest number of medals.

<details>
  <summary>Click to reveal query</summary>

```sql
with cte1 as (
		select Sport, count(medal) as Highest_Medal
		from athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
		where region = 'Nigeria' and Medal <> 'NA'
		group by sport)
select top 10 *
		from cte1
		order by Highest_medal desc;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Sport	| Highest_Medal|
  |-------------|-|
  |
Football	|50
Athletics	|41
Boxing	|6
Weightlifting|	1
Taekwondo	|1

</details>


16. Nigeria Top 1 Sport
Objective: Break down all Olympic Games where Nigeria won medals in the sport of Football, detailing the number of medals won in each Olympic Games.

<details>
  <summary>Click to reveal query</summary>

```sql
select 
	region as Country, games, sport, count (medal) As Medals
from 
	athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
where 
	region = 'Nigeria' and sport = 'Football' and medal <> 'NA'
group by 
	region, games, sport
order by 
	medals desc;
```
</details>

<details>
  <summary>Click to reveal expected results</summary>

  |Country	|games|	sport|	Medals|
  |-------------|-|-|-|
  |
Nigeria|	2016 Summer	|Football	|18
Nigeria	|1996 Summer	|Football	|16
Nigeria	|2008 Summer	|Football	|16
</details>


### Findings
1.	A total of 51 distinct Olympic Games was held from 1896 – 2016.
2.	52 Cities held the Olympic Game and this was because the 1956 Summer Olympic was held in both Stockholm and Melbourne.
3.	Only 4 nations (France, Italy, Switzerland and UK) participated in all 51 Olympic Games (1896 – 2016)
4.	Charles Jacobus (United States) and Oscar Gomer Swahn (Sweden) were the oldest athletes to win the most medals in the Olympic Games.
5.	The ratio of male to female is 2.64:1 which translate for every 2.64 Male athlete there is 1 Female athlete.
6.	 The to 5 successful (most medals) nations are namely; USA, Russia, Germany, UK and France
7.	70 distinct nations had zero medal in all of the Olympic played so far.
8.	Football is Nigeria most Successful sport (highest medal).

## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)


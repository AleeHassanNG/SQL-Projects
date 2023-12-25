
-- Count of Olympic Games
select count(distinct(Games)) as Olympic_Games
	from athlete_events

--2. Even or Odd Game Count
---Objective: Classify each Olympic Game as Even or Odd based on the count.
select *,
	case 
		when (a.Game_count % 2) = 0 
			then 'Even'
				else 'Odd'
					end As Even_or_Odd
from (select distinct games as Games, count(games) as Game_Count 
	from athlete_events group by Games ) as a
	group by a.Games,a.Game_count;

----Olympic Cities, Sports and Events Count

select distinct(City), Games, count(distinct sport) as Sport, count(distinct event) as Event 
	from athlete_events group by city, games
		order by Games;

----Top Country Each Year
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

--Nations Participated in All Olympic Games

select 
	Region as Nation, count(distinct(games)) as Game_Played
from 
	athlete_events join noc_regions on athlete_events.noc = noc_regions.noc
group by 
	region
having count(distinct(games)) = 51

 -- Count of Vowels and Counsonants Letters
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
	from cte2
		
 

--Sports Played Once

 with cte1 as(
		select distinct (games), sport from athlete_events),
	cte2 as (select Sport, count(1) as No_of_Sports from cte1 group by sport)
		select c2.Sport, c1.Games, No_of_Sports
		from cte2 as c2 join cte1 as c1 on c2.Sport = c1.Sport
		where No_of_Sports = 1
		order by Sport

-- Oldest Athlete To Win Gold Medal

with cte as (select
	Name, Sex, Age, Team, Games, Medal, rank() over (order by age desc) as Rnk
from 
	athlete_events ae join noc_regions nr on ae.noc = nr.noc
where Medal = 'Gold')
select * from cte where RNK = 1

		
-- Ratio Of Men To Female

with cte as(
		select sum(case when sex = 'M' then 1 else 0 end) as Male, sum(case when sex = 'F' then 1 else 0 end) as Female
		from athlete_events ),
	cte1 as
		(select cast(male as int) as M, cast(Female as float) as F from cte)
select concat('1:', round(M/F, 2)) as Ratio from cte1

 --Top 5 Most Successful Nation
 with cte1 as (select region as Countries, count(1) Medals
		from athlete_events ae inner join noc_regions nr on ae.NOC =nr.NOC
		where not medal like '%NA%'
		group by region),
	cte2 as (select *, rank() over (order by Medals desc) as RNK from cte1)
select cte2.*
		from cte2
		where RNK <= 5

--Distinct Medals Won By Each Country

select * 
	from (select region as Country, medal 
	from athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
	where medal <> 'NA') as medals_table
pivot (
	count(medal) for medal in (Bronze, Gold, Silver)) as pivot_table
	order by bronze desc, gold desc, silver desc


--Countries With highest Medals Each Year
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


--Countries With Zero Medals
with cte1 as (
		select distinct(region) as Country,
		sum(case when medal = 'bronze' then 1 else 0 end) as Bronze,
		sum(case when medal = 'Gold' then 1 else 0 end) as Gold, 
		sum( case when medal = 'Silver' then 1 else 0 end) as Silver
		from athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
		group by region)
select C1.* 
		from cte1 as c1
		where gold = 0 and silver = 0 and bronze = 0 

--Nigeria Top 10 Sports Won

with cte1 as (
		select Sport, count(medal) as Highest_Medal
		from athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
		where region = 'Nigeria' and Medal <> 'NA'
		group by sport)
select top 10 *
		from cte1
		order by Highest_medal desc

--Nigeria Top 1 Sport
select 
	region as Country, games, sport, count (medal) As Medals
from 
	athlete_events ae inner join noc_regions nc on ae.noc = nc.noc
where 
	region = 'Nigeria' and sport = 'Football' and medal <> 'NA'
group by 
	region, games, sport
order by 
	medals desc
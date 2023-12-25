
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
  ```Query:
  ```select count(distinct(Games)) as Olympic_Games
	from athlete_events

</details>

<details>
  <summary>Click to reveal expected results</summary>
 | Olympic_Games|
|---------------|
|   51		|

</details>

2. Even or Odd Game Count
Objective: Classify each Olympic Game as Even or Odd based on the count.

3. City where Sport and Event Counts
Objective: Identufy the cities where the Olympics Game took place and also count number sports and events.


4. Top Country Each Year
Objective: Identify the top country each year with the most/highest participants.

5. Nations Participated in All Olympic Games
Objective: Identify nations that participated in all Olympic Games.

6. Count of Vowels and Counsonants Letters
Objective: Highlight the count of vowels and consonants alphabets in each distinct region's name and give the percentage of the count of vowels and consonants in each of the names

7. Sport Played in All Summer Olympics
Objective: Identify the sport played in all summer Olympics.

8. Sports Played Once
Objective: Identify sports that were played only once in the history of the Olympic Games.

9. Oldest Athlete To Win Gold Medal
Objective: Identify the oldest athlete who won a gold medal in the history of the Olympic Games.

10. Ratio Of Men To Female
Objective: Determine the ratio of male to female athletes participating in all Olympic Games.

11. Top 5 Most Successful Nation
Objective: Identify and present the top five successful countries in the Olympics, defining success based on the highest number of medals won.

12. Distinct Medal Won By Each Country
Objective: List the total number of gold, silver, and bronze medals won by each country in the Olympics.

13. Countries With highest Medals Each Year
Objective: Identify the country that won the most gold, most silver, most bronze medals, and the most overall medals in each Olympic Games.

14. Countries With Zero Medals
Objective: Identify countries that have never won gold, silver, or bronze medals in the Olympic Games.

15. Nigeria Top 10 Sports Won
Objective: Identify the top 10 sports in which Nigeria won the highest number of medals.

16. Nigeria Top 1 Sport
Objective: Break down all Olympic Games where Nigeria won medals in the sport of Football, detailing the number of medals won in each Olympic Games.

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


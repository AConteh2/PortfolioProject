
--Select *
--From PortfolioProject..NFLStatRecordsHome
--order by ASC

-- Put Data In ascending order

Select *
From PortfolioProject..NFLStatRecordsAway
order by date ASC;

Select *
From PortfolioProject..NFLStatRecordsHome
order by date ASC;

-- Remove values that will not need records of. Other values were already removed before.

Delete FROM PortfolioProject..NFLStatRecordsAway
Where date = '2012-02-05 00:00:00.000';

-- AFC South Teams that held that the Highest Total Yards in Away (Greatest to Least)

Select away, SUM(total_yards_away) as sum_total_yards
From PortfolioProject..NFLStatRecordsAway
GROUP by away
Having away = 'Texans' OR away = 'Colts' OR away = 'Titans' OR away = 'Jaguars'
order by sum_total_yards DESC;

-- AFC North Teams that held the Highest Total Yards in Away (Greatest to Least)

Select away, SUM(total_yards_away) as sum_total_yards
From PortfolioProject..NFLStatRecordsAway
GROUP by away
Having away = 'Browns' OR away = 'Bengals' OR away = 'Ravens' OR away = 'Steelers'
Order by sum_total_yards DESC;

-- AFC East Teams that held the Highest Total Yards in Away (Greatest to Least)

Select away, SUM(total_yards_away) as sum_total_yards
From PortfolioProject..NFLStatRecordsAway
GROUP by away
Having away = 'Patriots' OR away = 'Bills' OR away = 'Dolphins' OR away = 'Jets'
Order by sum_total_yards DESC;

-- AFC West Teams that held the Highest Total Yards in Away (Greatest to Least)

Select away, SUM(total_yards_away) as sum_total_yards
From PortfolioProject..NFLStatRecordsAway
GROUP by away
Having away = 'Chiefs' OR away = 'Raiders' OR away = 'Broncos' OR away = 'Chargers'
Order by sum_total_yards DESC;

-- NFC South Teams that held the Highest Total Yards in Away (Greatest to Least)

Select away, SUM(total_yards_away) as sum_total_yards
From PortfolioProject..NFLStatRecordsAway
GROUP by away
Having away = 'Falcons' OR away = 'Saints' OR away = 'Buccaneers' OR away = 'Panthers'
Order by sum_total_yards DESC;

-- NFC North Teams that held the Highest Total Yards in Away (Greatest to Least)

Select away, SUM(total_yards_away) as sum_total_yards
From PortfolioProject..NFLStatRecordsAway
GROUP by away
Having away = 'Packers' OR away = 'Vikings' OR away = 'Lions' OR away = 'Bears'
Order by sum_total_yards DESC;

-- NFC East Teams that held the Highest Total Yards in Away (Greatest to Least)

Select away, SUM(total_yards_away) as sum_total_yards
From PortfolioProject..NFLStatRecordsAway
GROUP by away
Having away = 'Cowboys' OR away = 'Eagles' OR away = 'Giants' OR away = 'Washington'
Order by sum_total_yards DESC;

-- AFC South Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = 'Texans' OR home = 'Colts' OR home = 'Jaguars' OR home = 'Titans'
Order by home_total_yards DESC;

-- AFC North Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = 'Browns' OR home = 'Bengals' OR home = 'Ravens' OR home = 'Steelers'
Order by home_total_yards DESC;

-- AFC East Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = 'Patriots' OR home = 'Bills' OR home = 'Dolphins' OR home = 'Jets'
Order by home_total_yards DESC;

-- AFC West Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = 'Chiefs' OR home = 'Raiders' OR home = 'Broncos' OR home = 'Chargers'
Order by home_total_yards DESC;

-- NFC South Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = 'Falcons' OR home = 'Saints' OR home = 'Buccaneers' OR home = 'Panthers'
Order by home_total_yards DESC;

-- NFC North Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = 'Packers' OR home = 'Vikings' OR home = 'Lions' OR home = 'Bears'
Order by home_total_yards DESC;

-- NFC East Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = 'Cowboys' OR home = 'Eagles' OR home = 'Giants' OR home = 'Washington'
Order by home_total_yards DESC;

-- NFC West Teams that held the Highest Total Yards in Home (Greatest to Least)

Select home, SUM(total_yards_home) as home_total_yards
From PortfolioProject..NFLStatRecordsHome
GROUP by home
Having home = '49ers' OR home = 'Rams' OR home = 'Cardinals' OR home = 'Seahawks'
Order by home_total_yards DESC;

-- Looking at NFL Team Performance based on Pass/Run Breakdown

Select a1.away as team, AVG(a1.rushing_yards_away / a1.total_yards_away) as away_Yards_Per_Rushing_Percentage, 
AVG(a1.passing_yards_away / a1.total_yards_away) as away_Yards_Per_Passing_Percentage, 
AVG(h1.rushing_yards_home / h1.total_yards_home) as home_Yards_Per_Rushing_Percentage, 
AVG(h1.passing_yards_home / h1.total_yards_home) as home_Yards_Per_Passing_Percentage
From PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
Group BY a1.away, h1.home
Order By away_Yards_Per_Rushing_Percentage DESC, 
away_Yards_Per_Passing_Percentage DESC, 
home_Yards_Per_Rushing_Percentage ASC, 
home_Yards_Per_Passing_Percentage ASC;

-- Looking at NFL Team Performance based on First Down Percentage Rate

Select a1.away as team, SUM(a1.first_downs_away+h1.first_downs_home)/100 as first_down_percentage_rate
From PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
GROUP By a1.away, h1.home
Order By first_down_percentage_rate DESC;

-- Looking for NFL Teams with the Best Performance in Fumbles

Select a1.away as team, AVG(a1.fumbles_away+h1.fumbles_home) as total_fumbles_rate
From PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
GROUP By a1.away, h1.home
Order by total_fumbles DESC;


-- Looking for NFL Teams with the Best Performance in Interceptions

Select a1.away as team, AVG(a1.int_away+h1.int_home) as total_int
From PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
GROUP By a1.away, h1.home
Order by total_int DESC;

-- Looking for NFL Team Performance Based on Turnover Rate Per Game

Select a1.away as team, AVG(a1.turnovers_away+h1.turnovers_home) as turnover_rate
From PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
Group By a1.away, h1.home
Order By turnover_rate DESC;

-- Summary of NFL Team Performance Based on Drive Rating Score in Both Away & Home Sides

Select a1.away as team, AVG(a1.drives_away + h1.drives_home)/100 as drive_rate_score
FROM PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
GROUP BY a1.away
Order BY drive_rate_score;

-- Summary of NFL Team Performance Based on Team Scoring

Select a1.away as team, AVG(a1.score_away)/100 as team_score_away, AVG(h1.score_home)/100 as team_score_home,
AVG(a1.score_away+h1.score_home)/100 as team_overall_score_rate
FROM PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
GROUP BY a1.away
Order BY team_score_away, team_score_home, team_overall_score_rate DESC;

-- Create Views to store data for later visualizations

Create View NFLTeamScorePerformanceRate as
Select a1.away as team, AVG(a1.drives_away + h1.drives_home)/100 as drive_rate_score
FROM PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
GROUP BY a1.away
--Order BY drive_rate_score;

Create View NFLTeamRushPassPerformanceRate as
Select a1.away as team, AVG(a1.rushing_yards_away / a1.total_yards_away) as away_Yards_Per_Rushing_Percentage, 
AVG(a1.passing_yards_away / a1.total_yards_away) as away_Yards_Per_Passing_Percentage, 
AVG(h1.rushing_yards_home / h1.total_yards_home) as home_Yards_Per_Rushing_Percentage, 
AVG(h1.passing_yards_home / h1.total_yards_home) as home_Yards_Per_Passing_Percentage
From PortfolioProject..NFLStatRecordsAway a1
JOIN PortfolioProject..NFLStatRecordsHome h1
ON a1.away = h1.home
Group BY a1.away, h1.home
--Order By away_Yards_Per_Rushing_Percentage DESC, away_Yards_Per_Passing_Percentage DESC, home_Yards_Per_Rushing_Percentage ASC, home_Yards_Per_Passing_Percentage ASC;

Select *
From NFLTeamRushPassPerformanceRate

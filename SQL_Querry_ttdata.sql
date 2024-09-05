create database t20db


CREATE TABLE ttdata (
    id INT PRIMARY KEY,
    venue VARCHAR(255),
    team1 VARCHAR(255),
    team2 VARCHAR(255),
    stage VARCHAR(100),
    toss_winner VARCHAR(255),
    toss_decision VARCHAR(50),
    first_innings_score FLOAT,
    first_innings_wickets INT,
    second_innings_score FLOAT,
    second_innings_wickets INT,
    winner VARCHAR(255),
    won_by VARCHAR(50),
    player_of_the_match VARCHAR(255),
    top_scorer VARCHAR(255),
    highest_score FLOAT,
    best_bowler VARCHAR(255),
    best_bowling_figure VARCHAR(50)
);


ALTER TABLE ttdata
DROP COLUMN id;


##**Basic Queries**

1. **List all matches played.**

select * from ttdata

2. **Show distinct venues where matches were held.**

select distinct(venue) from ttdata

3. **Count the total number of matches played.**

select count(*) as match_played from ttdata 

4. **Find matches where the first innings score was above 150.**

select * from ttdata
where first_innings_score >150
	
5. **Find matches where the second innings score was below 100.**

select * from ttdata
where  second_innings_score<100

6. **List all the matches won by 'India'.**

select * from ttdata
where  winner ='India'

7. **Find matches where the toss winner decided to 'Bat'.**

select * from ttdata
where toss_decision = 'Bat'

8. **Show the top scorer and their highest score in all matches.**

SELECT top_scorer, highest_score FROM ttdata


9. **List matches where more than 8 wickets were lost in the first innings.**

select * from ttdata
where first_innings_wickets > 8

10. **Find all matches played at 'MCG'.**

select * from ttdata
where venue = 'MCG'




	

##**Intermediate Queries**

11. **Count the number of matches won by teams batting first.**

SELECT COUNT(*)  as num_of_matches_won_by_bat_first FROM ttdata WHERE toss_decision = 'Bat' AND winner = toss_winner;

12. **Find matches where 'India' won and had a top scorer of over 80 runs.**

select * from ttdata
where winner = 'India' and highest_score >80

13. **Show the player of the match and their best bowling figure for all matches.**

select player_of_the_match, best_bowling_figure from ttdata

14. **Find all matches where the second innings score exceeded the first innings score.**

SELECT * FROM ttdata 
WHERE second_innings_score > first_innings_score;

15. **List the number of matches won by 'Wickets'.**

select * from ttdata 
where won_by = 'Wickets'

16. **Find the match where the highest individual score was recorded.**

SELECT * FROM ttdata 
ORDER BY highest_score 
DESC nulls last LIMIT 1

17. **Show all matches where 'Australia' lost the toss but won the match.**
                                                                                                                                                  
select * from ttdata
where toss_winner != 'Australia' and winner = 'Australia'

18. **Display the best bowler and the number of wickets taken by them in all matches.**

select  best_bowler,best_bowling_figure from ttdata

19. **Find the match with the lowest second innings score.**

SELECT * FROM ttdata 
ORDER BY second_innings_score  asc
LIMIT 1;
 
20. **Count the number of matches where more than 8 wickets were taken in the second innings.**

select count(*) from ttdata
where second_innings_score >8

21. **List matches where the toss winner chose to field but lost the match.**
   
SELECT * FROM ttdata 
WHERE toss_decision = 'Field' AND toss_winner != winner;

22. **Display the match with the highest first innings score.**

select * from ttdata
order by first_innings_score desc nulls last
limit 1
	
23. **Find the matches where the margin of victory was 'Runs'.**

select * from ttdata
where won_by ='Runs'

24. **Count how many matches were won by teams chasing a total.**

SELECT COUNT(*) FROM ttdata
WHERE toss_decision = 'Field' AND winner = toss_winner;

25. **Find all matches where 'Sri Lanka' played in the Super 12 stage.**

SELECT * FROM ttdata 
WHERE (team1 = 'Sri lanka' OR team2 = 'Sri lanka') AND stage = 'Super 12';







##**Advanced Queries**

26. **Find the total number of runs scored in first innings across all matches.**

select  sum(first_innings_score) as total_first_innings_score from ttdata

27. **Display matches where the player of the match was also the top scorer.**

select * from ttdata
where player_of_the_match=top_scorer;

28. **List matches where the top scorers highest score is below 50.**

SELECT * FROM ttdata 
WHERE highest_score < 50;

29. **Find the total number of wickets taken in the second innings across all matches.**

SELECT SUM(second_innings_wickets) AS total_second_innings_wickets FROM ttdata;

30. **Show matches where both teams scored over 150 runs.**

select * from ttdata
where first_innings_score>150 and second_innings_score>150

31. **Find all matches where the player of the match was also the best bowler.**

select * from ttdata
where player_of_the_match = best_bowler

32. **List the number of matches won by each team.**

select winner,count(*) as num_of_matches_won from ttdata
group by 1

33. **Find matches where 'Virat Kohli' was the player of the match and 'India' won.**

select * from ttdata
where winner ='India' and player_of_the_match = 'Virat Kohli'

34. **Show the match with the closest margin of victory (by wickets).**
	
SELECT * FROM ttdata 
where won_by ='Wickets'
order by second_innings_wickets asc 
limit 1
  
##35. **Display the highest-scoring match (sum of both innings scores).**
   
SELECT * FROM ttdata 
ORDER BY (first_innings_score + second_innings_score) DESC 
LIMIT 1;

##36. **Find all matches played by 'Australia' in the Super 12 stage.**

SELECT * FROM ttdata 
WHERE (team1 = 'Australia' OR team2 = 'Australia') AND stage = 'Super 12';

37. **Count the number of matches where the team batting second won.**

select count(*) from ttdata
where toss_decision ='Field'

##38. **Find matches where the best bowler took 4 or more wickets.**

SELECT * FROM ttdata
WHERE CAST(SPLIT_PART(best_bowling_figure, '-', 1) AS INTEGER) >= 4;

39. **List the match where 'Bangladesh' won by the largest margin of runs.**

SELECT * FROM ttdata
WHERE winner = 'Bangladesh' AND won_by = 'Runs' 
ORDER BY first_innings_score - second_innings_score DESC 
LIMIT 1;

##40. **Display all matches where the second innings score was greater than the first by more than 50 runs.**

SELECT * FROM ttdata
WHERE (second_innings_score - first_innings_score) > 50;

41. **Find all matches where 'England' lost.**

SELECT * FROM ttdata 
WHERE (team1 = 'England' OR team2 = 'England') AND winner != 'England';

42. **List matches where the team batting first won with a margin of over 50 runs.**

SELECT * FROM ttdata 
WHERE won_by = 'Runs' AND (first_innings_score - second_innings_score) > 50;

43. **Count how many times the team batting second chased a total of 150 or more.**

SELECT COUNT(*) FROM ttdata WHERE second_innings_score >= 150;

44. **Display matches where both teams lost 8 or more wickets.**

SELECT * FROM ttdata 
WHERE first_innings_wickets >= 8 AND second_innings_wickets >= 8;

45. **Find all matches where 'Pakistan' played and won.**

#Ans-1
SELECT * FROM ttdata 
WHERE (team1 = 'Pakistan' OR team2 = 'Pakistan') AND winner = 'Pakistan';

#Ans-2
SELECT * FROM ttdata where winner = 'Pakistan';

46. **List matches where the toss winner won the match by wickets.**

SELECT * FROM ttdata 
WHERE toss_winner = winner AND won_by = 'Wickets';

47. **Show the match with the fewest total wickets lost (both innings combined).**
 
SELECT * FROM ttdata 
ORDER BY (first_innings_wickets + second_innings_wickets) ASC LIMIT 1;
   

48. **Find matches where the second innings team scored more than the first by exactly 1 run.**
 
SELECT * FROM ttdata 
WHERE (second_innings_score - first_innings_score) = 1;
 

49. **Display matches where the first innings team scored between 120 and 160 runs.**
 
SELECT * FROM ttdata 
WHERE first_innings_score BETWEEN 120 AND 160;
 

50. **Find matches where the player of the match also had the highest individual score.**
 
SELECT * FROM ttdata
WHERE player_of_the_match = top_scorer;
   









	

	

SELECT * FROM ttdata 

#!/bin/bash

# CREATE DATABASE worldcup;
# \c worldcup

# CREATE TABLE teams(team_id SERIAL PRIMARY KEY, 
# name UNIQUE NOT NULL VARCHAR(15));

# CREATE TABLE games(game_id SERIAL PRIMARY KEY, 
# year INT NOT NULL, round VARCHAR(50) NOT NULL, 
# winner_id INT FOREIGN KEY REFERENCES teams(team_id),
# opponent_id INT FOREIGN KEY REFERENCES teams(team_id),
# winner_goals INT NOT NULL, opponent_goals INT NOT NULL);

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#PSQL="psql -X --username=freecodecamp --dbname=worldcup --no-align --tuple-only -c"
echo $($PSQL "DROP TABLE IF EXISTS teams, games CASCADE;")
echo $($PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY, name VARCHAR(20) UNIQUE NOT NULL);")
echo $($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY, year INT NOT NULL, round VARCHAR(20) NOT NULL, winner_id INT NOT NULL, opponent_id INT NOT NULL, winner_goals INT NOT NULL, opponent_goals INT NOT NULL, FOREIGN KEY(winner_id) REFERENCES teams(team_id), FOREIGN KEY(opponent_id) REFERENCES teams(team_id));")
echo $($PSQL "TRUNCATE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_1=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      if [[ $INSERT_1 == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi
    TEAM_ID2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    if [[ -z $TEAM_ID2 ]]
    then
      INSERT_2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      if [[ $INSERT_2 == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    TEAM_ID2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    fi
    # games.csv (year, round, winner, opponent, win_goals, opp_goals)
    INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID, $TEAM_ID2, $WIN_GOALS, $OPP_GOALS);")
    if [[ $INSERT_GAMES == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR $ROUND $TEAM_ID $TEAM_ID2 $WIN_GOALS $OPP_GOALS
    fi
  fi
done
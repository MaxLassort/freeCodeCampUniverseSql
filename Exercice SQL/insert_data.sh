#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# CREATE TABLE teams(
#   team_id SERIAL PRIMARY KEY,
#   name VARCHAR(50) UNIQUE NOT NULL
# );

# CREATE TABLE games(
#   game_id SERIAL PRIMARY KEY,
#   year INT NOT NULL,
#   round VARCHAR(30) NOT NULL,
#   winner_id INT REFERENCES teams(team_id) NOT NULL,
#   opponent_id INT REFERENCES teams(team_id) NOT NULL,
#   winner_goals INT NOT NULL,
#   opponent_goals INT NOT NULL
# )
echo $($PSQL "TRUNCATE games, teams")
while IFS=, read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # echo "$YEAR $ROUND $WINNER $OPPONENT $WINNER $WINNER_GOALS $OPPONENT_GOALS"
    # check if the team is in the db else insert into
    # maybe need to do this with the opponent
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $WINNER_ID ]] 
    then 
      echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi
    if [[ -z $OPPONENT_ID ]] 
    then 
      echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi
    if [[ -n $WINNER_ID && -n $OPPONENT_ID ]]
    then
      GAME=$($PSQL "SELECT g.game_id FROM games g WHERE year = $YEAR AND g.winner_id = $WINNER_ID AND g.opponent_id = $OPPONENT_ID")
      if [[ -z $GAME ]]
      then
        echo "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)"
        $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      fi
    fi
    
  fi

done < games.csv
exit 0
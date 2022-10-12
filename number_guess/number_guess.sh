#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_GEN=$(($RANDOM % 1000 + 1))
COUNTER=0

GUESS(){
  read INPUT

  if [[ $INPUT =~ ^[0-9]+$ ]]; then

    if [[ $INPUT -ne $RANDOM_GEN ]]; then
    
      while [[ $INPUT -lt $RANDOM_GEN ]]; do
        echo -e "\nIt's higher than that, guess again:"
        let COUNTER+=1
        GUESS
      done

      while [[ $INPUT -gt $RANDOM_GEN ]]; do
        echo -e "\nIt's lower than that, guess again:"
        let COUNTER+=1
        GUESS
      done
    
    else
      echo "You guessed it in $COUNTER tries. The secret number was $RANDOM_GEN. Nice job!"
      let COUNTER+=1
    fi

  else
    until [[ $INPUT =~ ^[0-9]+$ ]]; do
      echo -e "\nThat is not an integer, guess again:"
      let COUNTER+=1
      GUESS
    done
  fi
}

MAIN(){
  
  echo "Enter your username:"
  read USERNAME

  USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")
  if [[ -z $USER ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    echo "Guess the secret number between 1 and 1000:"
    GUESS
    INSERT_INFO_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $COUNTER);")
  else
    PLAY_INFO=$($PSQL "SELECT games_played FROM users WHERE username='$USER';")
    GAME_INFO=$($PSQL "SELECT best_game FROM users WHERE username='$USER';")
    echo "Welcome back, $USER! You have played $PLAY_INFO games, and your best game took $GAME_INFO guesses."
    echo "Guess the secret number between 1 and 1000:"
    let COUNTER+=1
    GUESS
    if [[ $COUNTER -lt $GAME_INFO ]]; then
      INSERT_INFO_RESULT=$($PSQL "UPDATE users SET games_played=$PLAY_INFO+1, best_game=$COUNTER WHERE username='$USER';")
    else
      INSERT_INFO_RESULT=$($PSQL "UPDATE users SET games_played=$PLAY_INFO+1 WHERE username='$USER';")
    fi
  fi
}

MAIN
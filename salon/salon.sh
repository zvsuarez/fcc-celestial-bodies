#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?"
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CUT ;;
    2) COLOR ;;
    3) PERM ;;
    4) STYLE ;;
    5) TRIM ;;
    *) SERVICE_MENU "I could not find that service. What would you like today?" ;;
  esac
}

CUT(){
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=1";)
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  if [[ -z $PHONE_NUMBER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

COLOR(){
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=2";)
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  if [[ -z $PHONE_NUMBER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
    read SERVICE_TIME
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

PERM(){
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=3";)
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  if [[ -z $PHONE_NUMBER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo -e "\nWhat time would you like your perm, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your perm, $CUSTOMER_NAME?"
    read SERVICE_TIME
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

STYLE(){
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=4";)
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  if [[ -z $PHONE_NUMBER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo -e "\nWhat time would you like your style, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a style at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your style, $CUSTOMER_NAME?"
    read SERVICE_TIME
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a style at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

TRIM(){
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=5";)
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  if [[ -z $PHONE_NUMBER ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo -e "\nWhat time would you like your trim, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your trim, $CUSTOMER_NAME?"
    read SERVICE_TIME
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $GET_CUSTOMER_ID, $SERVICE_ID);")
    SERVICE_MENU "I have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SERVICE_MENU
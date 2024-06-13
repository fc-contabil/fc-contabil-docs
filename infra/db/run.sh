#!/bin/bash

# Function to start the PostgreSQL service
start_postgres() {
  docker-compose up -d
  echo "PostgreSQL service started successfully."
}

# Function to stop the PostgreSQL service
stop_postgres() {
  docker-compose down
  echo "PostgreSQL service stopped successfully."
}

# Function to show the status of the PostgreSQL service
status_postgres() {
  docker-compose ps
}

# Function to rebuild the PostgreSQL image
rebuild_postgres() {
  docker-compose build
  echo "PostgreSQL image rebuilt successfully."
}

# Main script execution
while true; do
  # Display menu options
  echo "-------------------------"
  echo "  Manage PostgreSQL Service"
  echo "-------------------------"
  echo "1) Start Service"
  echo "2) Stop Service"
  echo "3) View Status"
  echo "4) Rebuild Image"
  echo "5) Exit"
  echo "-------------------------"
  read -p "Enter your choice (1-5): " choice

  # Handle user input
  case "$choice" in
    1)
      start_postgres
      ;;
    2)
      stop_postgres
      ;;
    3)
      status_postgres
      ;;
    4)
      rebuild_postgres
      ;;
    5)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid choice. Please enter a number between 1 and 5."
      ;;
  esac
done

exit 0

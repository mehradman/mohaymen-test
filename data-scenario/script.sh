#!/bin/bash

# Get the current timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Generate a random long integer for population
population=$((RANDOM * RANDOM))

# Generate a random short integer
randomshortint=$((1 + RANDOM % 100))

# Calculate the number of men and women
men=$(($population / 2))
women=$(($population / $randomshortint))

# Calculate hOffset
hOffset=$(($population * 2))

# Prepare the log message
log_message="myfirsylog : $timestamp hello devops\n: {\"iran\"\n \"city\": \"tehran\",\n \"population\": \"$population\",\n \"men\": \"$men\",\n \"women\": \"$women\",\n \"hOffset\": \"$hOffset\",\n \"vOffset\": 100,\n \"weather\": \"sun1.city=(sun1.city / 100)*90;\"\n}"

# Send the log message to the local port (e.g., port 8080)
echo -e $log_message | nc localhost 8080

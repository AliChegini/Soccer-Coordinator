Raw project description:

You have volunteered to be the coordinator for your town’s youth soccer league. As part of your job you need to divide the 18 children who have signed up for the league into three even teams — Dragons, Sharks, and Raptors. In years past, the teams have been unevenly matched, so this year you are doing your best to fix that. For each child, you will have the following information: Name, height (in inches), whether or not they have played soccer before, and their guardians’ names.

The project has three major parts. For each part, choose ONLY from the tools we have covered in the courses so far.

Native types and collections to store data (Dictionaries, Arrays, Ints, Strings, etc...) Accessing, appending and counting Arrays Accessing Dictionaries and Arrays Creating control flow Use of comparison operators String Interpolation Use of comments

Please don’t employ more advanced tools we haven’t covered yet, even if they are right for the job. (Yes, that means no classes, structs or filters on Project 1.)

** Part 1: ** We have provided information for the 18 players in the Player Info spreadsheet. Please choose an appropriate data type to store the information for each player. In addition, create an empty collection variable to hold all the players’ data. Once you have decided on what tools to use, manually enter the player data so it can be used in Part 2.

** Part 2: ** Create logic to iterate through all 18 players and assign them to teams such that the number of experienced players on each team are the same. Store each team’s players in its own new collection variable for use in Part 3. (Please note: your logic should work correctly regardless of the initial ordering of the players and should work, if we theoretically had more or less than 18 players, so NO MAGIC NUMBERS!)

Also, if you would like to attain an “exceeds expectations” rating for this project, add logic to ensure that each team's average height is within 1.5 inches of the others.

** Part 3: ** Create logic that iterates through all three teams of players and generates a personalized letter to the guardians, letting them know which team the child has been placed on and when they should attend their first team team practice. As long as you provide the necessary information (player name, team name, guardian names, practice date/time), feel free to have fun with the content of the letter. The team practice dates/times are as follows:

Dragons - March 17, 1pm
Sharks - March 17, 3pm
Raptors - March 18, 1pm
When your complete code is run in a playground the letters should be stored in a collection variable named 'letters'. When the code is run, the letters should be visible in the console.

You can reference the resources provided in the Project Resources area for additional information on how to implement and use the Swift Collections.

As always, meaningful and concise code comments are expected. Your code should be written and refined in an Xcode playground. Be sure to upload it to GitHub, as per the instructions provided in the Soccer Coordinator Video Instruction (see the link below).

Please also note the specific naming requirements for variables in the detailed instructions below as these are REQUIRED for your project to pass.

Extra Credit:

Logic to ensure that each team's average height is within 1.5 inch of the others as well as having each team contain the same number of experienced players. Your logic should be make use of dynamic values like the average height of teams or players and not be based on any magic numbers or hard-coded values. You should not rely on a particular ordering of the initial collection of players - the logic should work regardless of the order of players in the initial collection. (Please note, this feature only needs to meet the 1.5 inch threshold for the given set of players we provided, not for all potential future sets of players.) Please also print out the average height of the players of each team. If you do not want to be considered for an “Exceeds Expectations” rating, you may skip this step. Note that you should use variable type Double for storing the heights.



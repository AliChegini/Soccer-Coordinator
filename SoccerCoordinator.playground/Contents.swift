// Part 1
// Collection which has key strings and array values to hold all players data
// Data structure [String : [String : Any]]
let players = [
    "Joe Smith": ["height": 42.0 ,"hasExperience": true ,"guardianName": "Jim and Jan Smith"],
    "Jill Tanner": ["height": 36.0 ,"hasExperience": true ,"guardianName": "Clara Tanner"],
    "Bill Bon": ["height": 43.0 ,"hasExperience": true ,"guardianName": "Sara and Jenny Bon"],
    "Eva Gordon": ["height": 45.0 ,"hasExperience": false ,"guardianName": "Wendy and Mike Gordon"],
    "Matt Gill": ["height": 40.0,"hasExperience": false ,"guardianName": "Charles and Sylvia Gill"],
    "Kimmy Stein": ["height": 41.0,"hasExperience": false ,"guardianName": "Bill and Hillary Stein"],
    "Sammy Adams": ["height": 45.0 ,"hasExperience": false ,"guardianName": "Jeff Adams"],
    "Karl Saygan": ["height": 42.0 ,"hasExperience": true ,"guardianName": "Heather Bledsoe"],
    "Suzane Greenberg": ["height": 44.0 ,"hasExperience": true ,"guardianName": "Henrietta Dumas"],
    "Sal Dali": ["height": 41.0 ,"hasExperience": false ,"guardianName": "Gala Dali"],
    "Joe Kavalier": ["height": 39.0 ,"hasExperience": false ,"guardianName": "Sam and Elaine Kavalier"],
    "Ben Finkelstein": ["height": 44.0 ,"hasExperience":false ,"guardianName": "Aaron and Jill Finkelstein"],
    "Diego Soto": ["height": 41.0 ,"hasExperience": true ,"guardianName": "Robin and Sarika Soto"],
    "Chloe Alaska": ["height": 47.0 ,"hasExperience": false ,"guardianName": "David and Jamie Alaska"],
    "Arnold Willis": ["height": 43.0 ,"hasExperience": false ,"guardianName": "Claire Willis"],
    "Phillip Helm": ["height": 44.0 ,"hasExperience": true ,"guardianName": "Thomas Helm and Eva Jones"],
    "Les Clay": ["height": 42.0 ,"hasExperience": true ,"guardianName": "Wynonna Brown"],
    "Herschel Krustofski": ["height": 45.0 ,"hasExperience": true ,"guardianName": "Hyman and Rachel Krustofski"]
]


let allTeams = ["teamSharks", "teamDragons", "teamRaptors"]
var experienced: [String : [String : Any]] = [:]
var nonExperienced: [String : [String : Any]] = [:]
var teamSharks: [String : [String : Any]] = [:]
var teamDragons: [String : [String : Any]] = [:]
var teamRaptors: [String : [String : Any]] = [:]
var letters: [String] = []
let allowedRange = 1.5  // Inches

// Part 2
// Iterate through all players
// Seperate experienced from non experienced and put them in two different collections
func seperateExperienced() {
    for (key, value) in players {
        // as! Bool is there to type cast Any to Bool
        if value["hasExperience"] as! Bool == true {
            experienced[key] = value
        } else {
            nonExperienced[key] = value
        }
    }
}

// Dividing the players based on experience only --- Height is considered for nonExperienced
// Divide experienced 3 by 3 --- No magic number is been used
func divideExperienced() {
    for player in experienced {
        if teamSharks.count < (experienced.count / allTeams.count) {
            teamSharks[player.key] = player.value
        } else if teamDragons.count < (experienced.count / allTeams.count) {
            teamDragons[player.key] = player.value
        } else if teamRaptors.count < (experienced.count / allTeams.count) {
            teamRaptors[player.key] = player.value
        }
    }
}


// Divide nonExperienced based on height
// Global average (Average of all players) and team average is been used to meet the height constraint
func divideNonExperienced() {
    // Create a mutable copy of nonExperienced so the confimred player can be removed from it
    var copyOfNonExperienced = nonExperienced
    // loop over all the nonExperienced untill every one is confirmed to have a team within the range
    while copyOfNonExperienced.count != 0 {
        for player in copyOfNonExperienced {
            if teamSharks.count < (players.count / allTeams.count) {
                // After adding the player, calculate the team average height,
                // If height is out of range (too short/too high) player will be removed and be considered later
                teamSharks[player.key] = player.value
                if calculateAvgHeight(team: players) - allowedRange / Double(allTeams.count) > calculateAvgHeight(team: teamSharks) || calculateAvgHeight(team: teamSharks) > calculateAvgHeight(team: players) + allowedRange / Double(allTeams.count) {
                    teamSharks.removeValue(forKey: player.key)
                // if player is within the accepted range, he is confirmed and have a team
                // so should be removed from the copyOfNonExperienced
                } else {
                    copyOfNonExperienced.removeValue(forKey: player.key)
                }
                
            } else if teamDragons.count < (players.count / allTeams.count) {
                teamDragons[player.key] = player.value
                if calculateAvgHeight(team: players) - allowedRange / Double(allTeams.count) > calculateAvgHeight(team: teamDragons) || calculateAvgHeight(team: teamDragons) > calculateAvgHeight(team: players) + allowedRange / Double(allTeams.count) {
                    teamDragons.removeValue(forKey: player.key)
                } else {
                    copyOfNonExperienced.removeValue(forKey: player.key)
                }
                
            } else if teamRaptors.count < (players.count / allTeams.count) {
                teamRaptors[player.key] = player.value
                if calculateAvgHeight(team: players) - allowedRange / Double(allTeams.count) > calculateAvgHeight(team: teamRaptors) || calculateAvgHeight(team: teamRaptors) > calculateAvgHeight(team: players) + allowedRange / Double(allTeams.count) {
                    teamRaptors.removeValue(forKey: player.key)
                } else {
                    copyOfNonExperienced.removeValue(forKey: player.key)
                }
            }
        }
    }
}

// Calculate the height
// function takes a paramater which could be collection of all players or just a team, returns average
func calculateAvgHeight(team: [String : [String : Any]]) -> Double {
    var additionResult = 0.0
    for (_, value) in team {
        additionResult += value["height"] as! Double
    }
    return additionResult / Double(team.count)
}


// Part 3
// Generate personalized letter(mail)
func generateLetter() {
    // ?? "" is there to get rid of Optionals
    for (key, value) in teamSharks {
        letters += ["Dear \(value["guardianName"] ?? ""), your child \(key), is in Team Sharks, practicing on March 17, 3pm"]
    }
    for (key, value) in teamDragons {
        letters += ["Dear \(value["guardianName"] ?? ""), your child \(key), is in Team Dragons, practicing on March 17, 1pm"]
    }
    for (key, value) in teamRaptors {
        letters += ["Dear \(value["guardianName"] ?? ""), your child \(key), is in Team Raptors, practicing on March 18, 1pm"]
    }
}

// Function to print the letters
func printLetters() {
    for letter in letters {
        print(letter)
    }
}


// Main function to run the program
func runTheProgram(){
    seperateExperienced()
    divideExperienced()
    divideNonExperienced()
    generateLetter()
    printLetters()
    print("-------------")
    print("All players average height: ", calculateAvgHeight(team: players))
    print("sharks average height: " , calculateAvgHeight(team: teamSharks))
    print("dragons average height: " ,calculateAvgHeight(team: teamDragons))
    print("raptors average height: " ,calculateAvgHeight(team: teamRaptors))
}


runTheProgram()

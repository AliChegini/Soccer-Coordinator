// Part 1
// Collection which has key strings and array values to hold all players data
// Data structure [String : [String]]
let players = [
    "Joe Smith": ["42", "YES", "Jim and Jan Smith"],
    "Jill Tanner": ["36", "YES", "Clara Tanner"],
    "Bill Bon": ["43", "YES", "Sara and Jenny Bon"],
    "Eva Gordon": ["45", "NO", "Wendy and Mike Gordon"],
    "Matt Gill": ["40", "NO", "Charles and Sylvia Gill"],
    "Kimmy Stein": ["41", "NO", "Bill and Hillary Stein"],
    "Sammy Adams": ["45", "NO", "Jeff Adams"],
    "Karl Saygan": ["42", "YES", "Heather Bledsoe"],
    "Suzane Greenberg": ["44", "YES", "Henrietta Dumas"],
    "Sal Dali": ["41", "NO", "Gala Dali"],
    "Joe Kavalier": ["39", "NO", "Sam and Elaine Kavalier"],
    "Ben Finkelstein": ["44", "NO", "Aaron and Jill Finkelstein"],
    "Diego Soto": ["41", "YES", "Robin and Sarika Soto"],
    "Chloe Alaska": ["47", "NO", "David and Jamie Alaska"],
    "Arnold Willis": ["43", "NO", "Claire Willis"],
    "Phillip Helm": ["44", "YES", "Thomas Helm and Eva Jones"],
    "Les Clay": ["42", "YES", "Wynonna Brown"],
    "Herschel Krustofski": ["45", "YES", "Hyman and Rachel Krustofski"]
]

let numberOfTeams = 3
var experienced: [String : [String]] = [:]
var nonExperienced: [String : [String]] = [:]
var teamSharks: [String : [String]] = [:]
var teamDragons: [String : [String]] = [:]
var teamRaptors: [String : [String]] = [:]
var letters: [String] = []
let allowedRange: Float = 1.5  // Inches


// Part 2
// Iterate through all players
// Seperate experienced from non experienced and put them in two different collections
func seperateExperienced() {
    for (key, value) in players {
        /* value[1] is the experience property
         assuming structure of the data set will not change,
         changes in number of player will not affect this branch */
        if (value[1] == "YES") {
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
        if teamSharks.count < (experienced.count / numberOfTeams) {
            teamSharks[player.key] = player.value
        } else if teamDragons.count < (experienced.count / numberOfTeams) {
            teamDragons[player.key] = player.value
        } else if teamRaptors.count < (experienced.count / numberOfTeams) {
            teamRaptors[player.key] = player.value
        }
    }
}

// Divide nonExperienced based on height
// Global average (Average of all players) and team average is been used to meet the height constraint
func divideNonExperienced() {
    for player in nonExperienced {
        if teamDragons.count < (players.count / numberOfTeams) {
            teamDragons[player.key] = player.value
            // After adding the player, calculate the team average height,
            // If height is out of range (too short/ too high) player will be removed and be considered later
            if calculateAvgHeight(team: players) - allowedRange > calculateAvgHeight(team: teamDragons) && calculateAvgHeight(team: teamDragons) > calculateAvgHeight(team: players) + allowedRange {
                    teamDragons.removeValue(forKey: player.key)
            }
        } else if teamRaptors.count < (players.count / numberOfTeams) {
            teamRaptors[player.key] = player.value
            if calculateAvgHeight(team: players) - allowedRange > calculateAvgHeight(team: teamRaptors) && calculateAvgHeight(team: teamRaptors) > calculateAvgHeight(team: players) + allowedRange {
                    teamRaptors.removeValue(forKey: player.key)
            }
        } else if teamSharks.count < (players.count / numberOfTeams) {
            teamSharks[player.key] = player.value
            if calculateAvgHeight(team: players) - allowedRange > calculateAvgHeight(team: teamSharks) && calculateAvgHeight(team: teamSharks) > calculateAvgHeight(team: players) + allowedRange {
                    teamSharks.removeValue(forKey: player.key)
            }
        }
    }
}

// Calculate the height
// function takes a paramater which could be collection of all players or just a team, returns average
func calculateAvgHeight(team: [String : [String]]) -> Float {
    var additionResult: Float = 0.0
    for (_, value) in team {
        additionResult += Float(value[0])!
    }
    return additionResult / Float(team.count)
}


// Part 3
// Generate personalized letter(mail)
func generateLetter() {
    // value[2] is the guardian name
    for (key, value) in teamSharks {
        letters += ["Dear \(value[2]), your child \(key), is in Team Sharks, practicing on March 17, 3pm"]
    }
    for (key, value) in teamDragons {
        letters += ["Dear \(value[2]), your child \(key), is in Team Dragons, practicing on March 17, 1pm"]
    }
    for (key, value) in teamRaptors {
        letters += ["Dear \(value[2]), your child \(key), is in Team Raptors, practicing on March 18, 1pm"]
    }
}

// Function to print the letters
func printLetters() {
    for letter in letters {
        print(letter)
    }
}


// Main function to run the program
func main(){
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


main()


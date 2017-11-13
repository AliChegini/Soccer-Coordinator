// Part 1
//  Dictionary which has key string and array value to hold all players data
let allPlayers = [
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


// Part 2
// Iterate through all players
// Seperate experienced from non experienced

func seperateExperienced() {
    for (key, value) in allPlayers {
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

// Dividing the players only based on experience (Height will be added later)
// Divide experienced in a group of 3 --- func
func divideExperienced() {
    for (index, player) in experienced.enumerated() {
        if index < numberOfTeams {
            teamSharks[player.key] = player.value
        } else if index < numberOfTeams * 2 {
            teamDragons[player.key] = player.value
        } else if index < numberOfTeams * 3 {
            teamRaptors[player.key] = player.value
        }
    }
    print(teamDragons)
}

// Divide nonExperienced --- func


// Think about the height property and how it should be used.
seperateExperienced()
divideExperienced()


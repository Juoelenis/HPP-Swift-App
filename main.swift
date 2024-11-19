truct Player {
    var name: String
    var highScore: Int = 0
    var history: [Int] = []

    init(_ name: String) {
        self.name = name
    }
}
extension Player {
    mutating func updateScore(_ newScore: Int) {
        history.append(newScore)
        if highScore < newScore {
            print("\(newScore)! A new high score for \(name)! 🎉")
            highScore = newScore
        }
    }
}

player.updateScore(50)

let players = getPlayers()

// Sort players, with best high scores first
let ranked = players.sorted(by: { player1, player2 in
    player1.highScore > player2.highScore
})

// Create an array with only the players’ names
let rankedNames = ranked.map { $0.name }
// ["Erin", "Rosana", "Tomas

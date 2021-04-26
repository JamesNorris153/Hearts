import Foundation
import CoreData

class ScoreboardViewModel: ObservableObject, Identifiable {
	let id = UUID()
	var game: GameData
	
	init(game: GameData) {
		self.game = game
		
		self.players.append(Player(name: "James"))
		self.players.append(Player(name: "Will"))
		self.players.append(Player(name: "Mum"))
		self.players.append(Player(name: "Dad"))
		
		for player in self.players {
			self.scores[player] = [Score]()
			self.totals[player] = self.getTotal(player: player)
		}
	}
	
	@Published var players = [Player]()
	@Published var scores = [Player: [Score]]()
	@Published var totals = [Player: Int]()
	
	func appendScore() {
		for player in self.scores.keys {
			self.scores[player]!.append(Score(points: Int()))
		}
	}
	
	func removeLastScore() {
		for player in self.scores.keys {
			self.scores[player]!.removeLast()
		}
	}
	
	func getScores(player: Player) -> [Score] {
		return self.scores[player] ?? [Score]()
	}
	
	func refreshTotals() {
		for player in self.players {
			self.totals[player] = self.getTotal(player: player)
		}
	}
	
	func getTotal(player: Player) -> Int {
		if self.scores[player] == nil { return 0 }
		
		var total = 0
		for score in self.scores[player]! {
			total += score.points
		}
		
		return total
	}
}

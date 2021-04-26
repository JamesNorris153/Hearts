import Foundation
import CoreData

class ScoreViewModel: ObservableObject, Identifiable {
	let id = UUID()
	
	init(score: Score) {
		self.score = score
		self.points = score.points
	}
	
	@Published var score: Score
	
	@Published var points: Int {
		didSet {
			//self.score.points = self.points
		}
	}
}

import Foundation
import CoreData

class ScoreViewModel: ObservableObject, Identifiable {
	let id = UUID()
	
	init(score: Score) {
		self.score = score
	}
	
	@Published var score: Score
}

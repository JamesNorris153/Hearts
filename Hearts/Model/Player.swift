import Foundation

internal class Player: Identifiable, Hashable {
	var id = UUID()
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
	static func == (lhs: Player, rhs: Player) -> Bool {
		lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.id)
	}
}

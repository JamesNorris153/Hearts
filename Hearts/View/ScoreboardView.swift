import SwiftUI

struct ScoreboardView: View {
	@ObservedObject var viewModel: ScoreboardViewModel

	var body: some View {
		VStack {
			HStack {
				Spacer()
				
				ForEach(self.viewModel.players) { (player: Player) in
					VStack {
						Text(player.name)
							.multilineTextAlignment(.center)
							.frame(maxWidth: .infinity)
						
						ForEach(self.viewModel.getScores(player: player)) { (score: Score) in
							ScoreView(viewModel: ScoreViewModel(score: score), onCommit: refreshTotals)
						}
						
						Spacer()
						
						Text(String(self.viewModel.getTotal(player: player)))
							.multilineTextAlignment(.center)
							.frame(maxWidth: .infinity)
					}
				}
				
				Spacer()
			}
			
			Spacer()
			Stepper(
				"stepper",
				onIncrement: { self.viewModel.appendScore() },
				onDecrement: { self.viewModel.removeLastScore() })
		}
	}
	
	func refreshTotals() {
		for player in self.viewModel.players {
			self.viewModel.totals[player] = self.viewModel.getTotal(player: player)
		}
	}
}

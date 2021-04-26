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
						
						ForEach(self.viewModel.scores[player] ?? [Score]()) { (score: Score) in
							ScoreView(viewModel: ScoreViewModel(score: score), onCommit: refreshTotals)
						}
						
						Spacer()
						
						Text("\(self.viewModel.totals[player] ?? 0)")
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
		self.viewModel.refreshTotals()
	}
}

import SwiftUI

struct ScoreView: View {
	@ObservedObject var viewModel: ScoreViewModel
	let onCommit: () -> Void

	var body: some View {
		VStack {
			TextField(
				"X",
				value: self.$viewModel.score.points,
				formatter: NumberFormatter(),
				onCommit: {
					onCommit()
				})
				.frame(minHeight: 50)
				.keyboardType(.decimalPad)
				.multilineTextAlignment(.center)
		}
	}
}

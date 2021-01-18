//
//  ScoreView.swift
//  Hearts
//
//  Created by James Norris on 16/01/2021.
//

import SwiftUI

struct ScoreView: View {
	@ObservedObject var viewModel: ScoreViewModel
	
	var body: some View {
		TextField("X", value: $viewModel.points, formatter: NumberFormatter())
			.frame(minHeight: 50)
			.keyboardType(.decimalPad)
			.multilineTextAlignment(.center)
	}
}

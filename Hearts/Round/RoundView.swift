//
//  RoundView.swift
//  Hearts
//
//  Created by James Norris on 16/01/2021.
//

import SwiftUI

struct RoundView: View {
	@ObservedObject var viewModel: RoundViewModel
	
	var body: some View {
		HStack {
			Spacer()
			ForEach (viewModel.scores) { score in
				ScoreView(viewModel: score).frame(maxWidth: .infinity)
			}
			Spacer()
		}
	}
}

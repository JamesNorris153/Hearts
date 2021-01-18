//
//  ContentView.swift
//  Hearts
//
//  Created by James Norris on 05/01/2021.
//

import SwiftUI

struct GameView: View {
	@ObservedObject var viewModel: GameViewModel

    var body: some View {
		VStack {
			PlayerListView(viewModel: viewModel.playerList)
			List (viewModel.rounds) { round in
				RoundView(viewModel: round)
			}
			Spacer()
			Button(action: viewModel.addRound) {
				Label("Add Round", systemImage: "plus")
			}.frame(alignment: .bottom)
		}
	}
}

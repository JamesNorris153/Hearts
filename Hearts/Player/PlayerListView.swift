//
//  PlayerListView.swift
//  Hearts
//
//  Created by James Norris on 18/01/2021.
//

import SwiftUI

struct PlayerListView: View {
	@ObservedObject var viewModel: PlayerListViewModel
	
	var body: some View {
		HStack (alignment: .top) {
			Spacer()
			ForEach (viewModel.playerList) { player in
				PlayerView(viewModel: player).frame(maxWidth: .infinity)
			}
			Spacer()
		}
	}
}

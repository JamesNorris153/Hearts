//
//  PlayerView.swift
//  Hearts
//
//  Created by James Norris on 16/01/2021.
//

import SwiftUI

struct PlayerView: View {
	@ObservedObject var viewModel: PlayerViewModel
	
	var body: some View {
		Text(self.viewModel.name)
	}
}

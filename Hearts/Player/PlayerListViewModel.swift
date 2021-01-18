//
//  PlayerListViewModel.swift
//  Hearts
//
//  Created by James Norris on 18/01/2021.
//

import Foundation

class PlayerListViewModel: Identifiable, ObservableObject {
	let id = UUID()
	@Published var playerList: [PlayerViewModel]
	
	init(playerList: [PlayerViewModel]) {
		self.playerList = playerList
	}
}

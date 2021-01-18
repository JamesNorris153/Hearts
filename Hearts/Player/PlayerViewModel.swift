//
//  PlayerViewModel.swift
//  Hearts
//
//  Created by James Norris on 13/01/2021.
//

import Foundation

class PlayerViewModel: Identifiable, ObservableObject {
	let id = UUID()
	@Published var name: String
	
	init(player: Player) {
		self.name = player.name ?? String()
	}
}

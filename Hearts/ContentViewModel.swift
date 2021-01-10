//
//  ContentViewModel.swift
//  Hearts
//
//  Created by James Norris on 10/01/2021.
//

import Foundation

class ContentViewModel : Identifiable {
	let id = UUID()
	var players: [Player]
	
	init(players: [Player]) {
		self.players = players
	}
	
	func getPlayerScores(player: Player) -> Array<Int> {
		return Array<Int>()
	}
}

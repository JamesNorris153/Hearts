//
//  ContentViewModel.swift
//  Hearts
//
//  Created by James Norris on 10/01/2021.
//

import Foundation
import CoreData

class GameViewModel: ObservableObject, Identifiable {
	let id = UUID()
	@Published var playerList: PlayerListViewModel
	@Published var rounds = [RoundViewModel]()
	
	init(game: Game) {
		var playerList = [PlayerViewModel]()
		game.players?.forEach { player in playerList.append(PlayerViewModel(player: player as! Player))}
		self.playerList = PlayerListViewModel(playerList: playerList)
		game.rounds?.forEach { round in self.rounds.append(RoundViewModel(round: round as! Round))}
	}
	
	func addRound() {
		let round = Round(context: PersistenceController.shared.container.viewContext)
		let roundViewModel = RoundViewModel(round: round)
		
		for _ in 0..<4 {
			let score = Score(context: PersistenceController.shared.container.viewContext)
			round.addToScores(score)
			roundViewModel.scores.append(ScoreViewModel(score: score))
		}
		
		self.rounds.append(roundViewModel)
		do {
			try PersistenceController.shared.container.viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}

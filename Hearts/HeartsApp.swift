//
//  HeartsApp.swift
//  Hearts
//
//  Created by James Norris on 05/01/2021.
//

import SwiftUI

@main
struct HeartsApp: App {
    let persistenceController = PersistenceController.shared
	
	@FetchRequest(entity: GameData.entity(), sortDescriptors: [])
	private var games: FetchedResults<GameData>

    var body: some Scene {
		WindowGroup {
			ScoreboardView(viewModel: ScoreboardViewModel(game: games.first ?? GameData())).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
	
	/*private func getGame() -> GameData {
		let viewContext = persistenceController.container.viewContext
		let newGame = Game(context: viewContext)
		
		newGame.players = NSSet()
		for i in 0..<4 {
			let player = Player(context: viewContext)
			player.game = newGame
			player.name = "Player \(i + 1)"
			player.rounds = NSSet()
			newGame.addToPlayers(player)
		}
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
		
		return newGame
	}*/
}

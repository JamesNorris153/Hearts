//
//  ContentView.swift
//  Hearts
//
//  Created by James Norris on 05/01/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

	@FetchRequest(
		entity: Player.entity(),
		sortDescriptors: [])
    private var players: FetchedResults<Player>

    var body: some View {
		VStack {
			HStack {
				Spacer()
				ForEach (players) { player in
					Text("\(player.name!)").frame(maxWidth: .infinity)
				}
				Spacer()
			}
		 
			HStack{
				Spacer()
				ForEach(players) { player in
					let scores = getPlayerScores(player: player)
					List (scores, id: \.self) { score in
						Text("\(score)")
					}
				}
				.onDelete(perform: deleteItems)
				
				Spacer()
			}
			.toolbar {
			   EditButton()
			   
			   Button(action: addItem) {
				   Label("Add Item", systemImage: "plus")
			   }
			}
		}
    }

    private func addItem() {
        withAnimation {
			let player = Player(context: viewContext)
            player.name = "New Player"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { players[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
	
	private func getPlayerScores(player: Player) -> Array<Int> {
		var scores = Array<Int>()
		for score in player.scores! {
				scores.append(Int((score as! Score).points))
		}
		return scores
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//
//  RoundViewModel.swift
//  Hearts
//
//  Created by James Norris on 13/01/2021.
//

import Foundation

class RoundViewModel: Identifiable, ObservableObject {
	let id = UUID()
	@Published var scores = [ScoreViewModel]()
	
	init(round: Round) {
		round.scores?.forEach { score in self.scores.append(ScoreViewModel(score: score as! Score))}
	}
}

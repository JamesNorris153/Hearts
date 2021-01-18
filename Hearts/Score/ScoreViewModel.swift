//
//  ScoreViewModel.swift
//  Hearts
//
//  Created by James Norris on 13/01/2021.
//

import Foundation

class ScoreViewModel: Identifiable, ObservableObject {
	let id = UUID()
	@Published var points: Int?
	
	init(score: Score) {
		self.points = Int(score.points)
	}
}

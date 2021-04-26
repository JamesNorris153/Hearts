//
//  Score.swift
//  Hearts
//
//  Created by James Norris on 25/04/2021.
//

import Foundation

internal class Score: Identifiable {
	var id = UUID()
	var points: Int
	
	init(points: Int) {
		self.points = points
	}
}

//
//  Model.swift
//  ToProcrastinate
//
//  Created by Zerone Consulting on 11/01/23.
//

import Foundation

struct TaskEntry: Codable { // to decode JSON from API
	let id: Int
	let title: String
}

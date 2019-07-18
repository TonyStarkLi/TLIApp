//
//  Acronym.swift
//  App
//
//  Created by Botao Li on 7/18/19.
//

import FluentSQLite
import Vapor

final class Acronym: Codable {
	var id: Int?
	var short: String
	var long: String
	
	init(short: String, long: String) {
		self.short = short
		self.long = long
	}
}

extension Acronym: SQLiteModel {}
extension Acronym: Content {}
extension Acronym: Migration {}
extension Acronym: Parameter {}

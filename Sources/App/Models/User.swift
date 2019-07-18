//
//  User.swift
//  App
//
//  Created by Botao Li on 7/18/19.
//

import Vapor
import FluentSQLite

final class User: Codable {
	var id: UUID?
	var name: String
	var username: String
	
	init(name: String, username: String) {
		self.name = name
		self.username = username
	}
}

extension User: SQLiteUUIDModel {}
extension User: Migration {}
extension User: Content {}
extension User: Parameter {}
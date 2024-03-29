//
//  User.swift
//  App
//
//  Created by Botao Li on 7/18/19.
//

import Vapor
import FluentMySQL

final class User: Codable {
	var id: UUID?
	var name: String
	var username: String
	
	init(name: String, username: String) {
		self.name = name
		self.username = username
	}
}

extension User: MySQLUUIDModel {}
extension User: Migration {}
extension User: Content {}
extension User: Parameter {}

extension User {
	var acronyms: Children<User, Acronym> {
		return children(\.userID)
	}
}

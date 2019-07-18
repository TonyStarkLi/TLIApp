//
//  UsersController.swift
//  App
//
//  Created by Botao Li on 7/18/19.
//

import Vapor

struct UsersController: RouteCollection {
	
	func boot(router: Router) throws {
		let userRoute = router.grouped("api", "users")
		userRoute.post(User.self, use: createHandler)
		userRoute.get(use: getAllHandler)
		userRoute.get(User.parameter, use: getHandler)
	}
	
	func getAllHandler(_ req: Request) throws -> Future<[User]> {
		return User.query(on: req).all()
	}
	
	func createHandler(_ req: Request, user: User) throws -> Future<User> {
		return user.save(on: req)
	}
	
	func getHandler(_ req: Request) throws -> Future<User> {
		return try req.parameters.next(User.self)
	}
}

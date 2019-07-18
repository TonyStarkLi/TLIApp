//
//  CategoriesController.swift
//  App
//
//  Created by Botao Li on 7/18/19.
//

import Vapor

struct CategoriesController: RouteCollection {
	
	func boot(router: Router) throws {
		let categoriesRoute = router.grouped("api", "categories")
		categoriesRoute.get(use: getAllHandler)
		categoriesRoute.post(use: createhandler)
		categoriesRoute.post(Category.parameter, use: getCategoryHandler)
	}
	
	func getAllHandler(_ req: Request) throws -> Future<[Category]> {
		return Category.query(on: req).all()
	}
	
	// two ways of doing this
	func createhandler(_ req: Request) throws -> Future<Category> {
		return try req.content.decode(Category.self).save(on: req)
	}
	
	func getCategoryHandler(_ req: Request) throws -> Future<Category> {
		return try req.parameters.next(Category.self)
	}
}

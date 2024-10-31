//
//  Item.swift
//  GhalehTasks
//
//  Created by zero on 10/31/24.
//

import Foundation

struct Item: Identifiable, Codable {
  var id = UUID()
  var config: Config

}

extension Item {
  static let defaults = [
	Item(config: Config(selectedOption: 0, isToggleOn: true)),
	Item(config: Config(selectedOption: 1, isToggleOn: false)),
	Item(config: Config(selectedOption: 2, isToggleOn: true))
  ]
}


extension Item {
  static func loadItems() -> [Item] {
	if let data = UserDefaults.standard.data(forKey: "Items") {
	  let decoder = JSONDecoder()
	  if let decoded = try? decoder.decode([Item].self, from: data) {
		return decoded
	  }
	}
	
	return Item.defaults
  }
  
  static func saveItems(_ items: [Item]) {
	let encoder = JSONEncoder()
	if let encoded = try? encoder.encode(items) {
	  UserDefaults.standard.set(encoded, forKey: "Items")
	}
  }
}

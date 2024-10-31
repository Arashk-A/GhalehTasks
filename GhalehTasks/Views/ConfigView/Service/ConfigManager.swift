//
//  ConfigManager.swift
//  GhalehTasks
//
//  Created by zero on 10/31/24.
//

import Foundation

class ConfigManager: ObservableObject {
  @Published var items: [Item] = [] {
	didSet {
	  saveToUserDefaults()
	}
  }
  
  init() {
	self.items = loadFromUserDefaults()
  }
  
  
  private func saveToUserDefaults() {
	if let encodedItems = try? JSONEncoder().encode(items) {
	  UserDefaults.standard.set(encodedItems, forKey: "savedItems")
	}
  }
  
  
  private func loadFromUserDefaults() -> [Item] {
	guard let savedItemsData = UserDefaults.standard.data(forKey: "savedItems"),
		  let decodedItems = try? JSONDecoder().decode([Item].self, from: savedItemsData), !decodedItems.isEmpty else {
	  return Item.defaults
	}

	return decodedItems
  }
  
}

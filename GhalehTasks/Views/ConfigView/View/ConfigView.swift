//
//  ConfigView.swift
//  GhalehTasks
//
//  Created by zero on 10/31/24.
//

import SwiftUI

struct ConfigView: View {
  @StateObject var storage = ConfigManager()
  
  var body: some View {
	List {
	  
	  ForEach(Array($storage.items.enumerated()), id: \.offset) { (index, $item) in
		HStack {
		  VStack(alignment: .leading) {
			Text("Item \(index) description \(index)")
			  .font(.headline)
			
			HStack {
			  Picker("Options", selection: $item.config.selectedOption) {
				Text("0").tag(0)
				Text("1").tag(1)
				Text("2").tag(2)
			  }
			  .pickerStyle(SegmentedPickerStyle())
			  
			  Toggle("", isOn: $item.config.isToggleOn)
			}
			
		  }
		  
		}
	  }
	  
	  ForEach(Array(storage.items.enumerated()), id: \.offset) { (index, item) in
		Text("item \(index) config => option: \(item.config.selectedOption) | toggle: \(item.config.isToggleOn)")
	  }
	}
  }
}

#Preview {
    ConfigView()
}

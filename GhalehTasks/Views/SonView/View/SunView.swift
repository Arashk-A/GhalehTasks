//
//  SunView.swift
//  GhalehTasks
//
//  Created by zero on 10/31/24.
//

import SwiftUI

struct SunView: View {
  @State private var percentage: CGFloat = 0
  
  var body: some View {
	GeometryReader { geometry in
	  // bounds of the path
	  let rect = CGRect(origin: .zero, size: CGSize(width: geometry.size.width - 40, height: 200))
	  let (path, startPoint) = Path.sinPath(in: rect)
	  
	  // dash line
	  path
		.stroke(style: StrokeStyle(lineWidth: 4, dash: [5]))
		.foregroundColor(.purple.opacity(0.6))
		.frame(height: 200)
		.overlay {
		  
		  ZStack {
			// filling path
			path
			  .trim(from: 0, to: percentage)
			  .stroke(.purple, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
			
			  // Sun Icon
			Image(systemName: "sun.max.fill")
			  .foregroundStyle(Color.yellow)
			  .font(.title)
			  .modifier(Move(percentage: percentage, path: path, startPoint: startPoint))
			  .onTapGesture {
				withAnimation(.linear(duration: 1.5)) {
				  percentage = 0.7
				  
				}
			  }
		  }
		  
		}
		.padding(20)
	  
	}
	
  }
}

#Preview {
    SunView()
}

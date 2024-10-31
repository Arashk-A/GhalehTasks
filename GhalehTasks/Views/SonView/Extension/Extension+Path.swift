//
//  Extension+Path.swift
//  GhalehTasks
//
//  Created by zero on 10/31/24.
//

import SwiftUI

extension Path {
  static func sinPath(in rect: CGRect)-> (Path, CGPoint) {
	var path = Path()
	let width = rect.width
	let centerY = rect.midY
	let amplitude = rect.height / 4
	let range = Double.pi * 2
	var startPoint: CGPoint = .zero
	
	for x in stride(from: 0, to: width , by: 1) {
	  let angle = (Double(x) / Double(width) * range - Double.pi / 2) * -1
	  let y = centerY + CGFloat(amplitude * sin(angle))
	  
	  if x == 0 {
		path.move(to: CGPoint(x: x, y: y))
		startPoint = CGPoint(x: x, y: y)
	  } else {
		path.addLine(to: CGPoint(x: x, y: y))
	  }
	}
	
	return (path, startPoint)
  }
}

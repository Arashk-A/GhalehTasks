//
//  Move.swift
//  GhalehTasks
//
//  Created by zero on 10/31/24.
//

import SwiftUI

struct Move: AnimatableModifier {
  var percentage : CGFloat
  let path : Path
  let startPoint: CGPoint
  
  var animatableData: CGFloat {
	get { percentage }
	set { percentage = newValue }
  }
  
  func body(content: Content) -> some View {
	content
	  .position(
		path.trimmedPath(from: 0, to: percentage).currentPoint ?? startPoint
	  )
  }
}

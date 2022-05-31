//
//  ShapeView.swift
//  SwiftLogo-SwiftUI
//
//  Created by Алексей Синяговский on 31.05.2022.
//

import SwiftUI

struct ShapeView: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            Path { path in
                let length = min(geometry.size.width, geometry.size.height)
                let width = length
                let height = length
                let middle = length * 0.5
                let offset = length * 0.1
                
                path.move(to: CGPoint(x: 0, y: middle))
                path.addQuadCurve(
                    to: CGPoint(x: middle, y: 0),
                    control: CGPoint(x: middle-offset, y: middle-offset)
                )
                path.addQuadCurve(
                    to: CGPoint(x: width, y: middle),
                    control: CGPoint(x: middle+offset, y: middle-offset)
                )
                path.addQuadCurve(
                    to: CGPoint(x: middle, y: height),
                    control: CGPoint(x: middle+offset, y: middle+offset)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 0, y: middle),
                    control: CGPoint(x: middle-offset, y: middle+offset)
                )
            }.fill(LinearGradient(
                gradient: Gradient(colors: [.orange, .purple]),
                startPoint: UnitPoint(x: 0, y: 1),
                endPoint: UnitPoint(x: 1, y: 0)))
            
            
        }.frame(width: 350, height: 350)
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}

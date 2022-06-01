//
//  ContentView.swift
//  SwiftLogo-SwiftUI
//
//  Created by Алексей Синяговский on 30.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animation = false
    @State private var offset: CGFloat = -UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Spacer()
            
            ShapeView()
                .offset(y: offset)
                .rotation3DEffect(.init(degrees: animation ? 0 : 55),
                                  axis: (x: animation ? 0 : 1.0, y: 0, z: 0))
                .opacity(offset == -UIScreen.main.bounds.height ? 0 : 1.0)
                .animation(.easeOut(duration: 0.8), value: offset)
            
            Spacer()
            Button(action: animation ? hideShape : showShape) {
                Text(animation ? "Hide" : "Show")
            }
        }
    }
    
    private func showShape() {
        withAnimation {
            offset = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                animation.toggle()
            }
        }
    }
    
    private func hideShape() {
        animation.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            offset = -UIScreen.main.bounds.height
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


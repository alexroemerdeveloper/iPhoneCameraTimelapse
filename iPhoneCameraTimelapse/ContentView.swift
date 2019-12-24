//
//  ContentView.swift
//  iPhoneCameraTimelapse
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    @State private var rotateHandle = false
    @State private var strokeGrows  = false
    
    var body: some View {
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: 5, endRadius: 500)
            
            Image("Group")
            
            Circle()
                .trim(from: strokeGrows ? 0 : 1, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 8, dash: [1, 2], dashPhase: 1.0))
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.linear(duration: 8).delay(2).repeatForever(autoreverses: false))
                .onAppear() {
                    self.strokeGrows.toggle()
                }
            
            Rectangle()
                .offset(y: -25)
                .frame(width: 2, height: 5)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotateHandle ? 360 : 0))
                .animation(Animation.linear(duration: 8).delay(2).repeatForever(autoreverses: false))
                .onAppear() {
                    self.rotateHandle.toggle()
                }
            
            
            Rectangle()
                .frame(width: 25, height: 25)
                .foregroundColor(.red)
                .cornerRadius(4)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

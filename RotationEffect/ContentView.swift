//
//  ContentView.swift
//  RotationEffect
//
//  Created by Alexander Chervoncev on 15/6/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var degress = 0.0

    var body: some View {
        ZStack {
            Color(red: 225/255, green: 95/255, blue: 65/255)
                .ignoresSafeArea()
            VStack {
                Spacer()
                LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)

                .frame(width: 300, height: 200)
                .cornerRadius(10)
                .rotation3DEffect(.degrees(degress), axis: (x: 0, y: 1, z: 0), perspective: 0.7)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                .onAppear {
                    animateCard()
                }

                Spacer()
            }
        }
    }

    private func animateCard() {
        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: true)) {
            degress = 360
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

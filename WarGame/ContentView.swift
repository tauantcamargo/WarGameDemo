//
//  ContentView.swift
//  WarGame
//
//  Created by Tauan Tathiell Camargo on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                LogoContent()
                Spacer()
                CardsContent()
                Spacer()
                ButtonContet()
                Spacer()
                PlayersScore()
                Spacer()
            }
            .padding(.vertical, 40)
        }
    }
    
    @ViewBuilder
    func LogoContent()-> some View {
        Image("logo")
    }
    
    @ViewBuilder
    func CardsContent()-> some View {
        HStack {
            Spacer()
            Image(playerCard)
            Spacer()
            Image(cpuCard)
            Spacer()
        }
    }
    
    @ViewBuilder
    func ButtonContet()-> some View {
        Button {
            deal()
        } label: {
            Image("button")
        }
    }
    
    @ViewBuilder
    func PlayersScore()-> some View {
        HStack {
            Spacer()
            VStack {
                Text("Player")
                    .font(.headline)
                    .padding(.bottom, 10.0)
                Text(String(playerScore))
                    .font(.largeTitle)
            }
            Spacer()
            VStack {
                Text("CPU")
                    .font(.headline)
                    .padding(.bottom, 10.0)
                Text(String(cpuScore))
                    .font(.largeTitle)
                    
            }
            Spacer()
        }
        .foregroundColor(.white)
    }
    
    func deal() {
        // randomize player card
        let playerNumberCard = Int.random(in: 2...14)
        playerCard = "card" + String(playerNumberCard)
        let cpuNumberCard = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuNumberCard)
        
        // Update the scores
        if (playerNumberCard > cpuNumberCard) {
            playerScore += 1
        } else if (playerNumberCard < cpuNumberCard) {
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}

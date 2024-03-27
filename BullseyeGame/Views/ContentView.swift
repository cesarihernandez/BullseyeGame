//
//  ContentView.swift
//  BullseyeGame
//
//  Created by Cesar Hernandez on 2/12/24.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false // we can remove Bool (type inference)
  @State private var sliderValue: Double = 50.0 // type literal, since we added a decimal we can remove double (type inference)
  @State private var game  = Game() //storing an instance of a game, we can

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea() //ignores the safe area which is where the batterey and time go to cover the entire screen
      VStack {
        Text("🎯🎯🎯\nPut the bullseye as close as you can to".uppercased())
          .bold()
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
          .kerning(2.0)
          .padding(.horizontal, 30)
        Text(String(game.target)) //want to display the target from Game property and will use dot syntax. But we need to convert integer to String
          .kerning(-1.0)
          .font(.largeTitle)
          .fontWeight(.black)
        HStack {
          Text("1")
            .bold()
          Slider(value: $sliderValue, in: 1.0...100.0)
          Text("100")
            .bold()
        }
        .padding() //between slider and hit me button
        Button("Hit me".uppercased()) {
          alertIsVisible = true
        }
        .padding(20) //Order matters, if padding was lower then it would not show
        .background(
          ZStack { // zstack is specifically overlayed on the button to give it a gradient
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom) // gradient goes from top to bottom and .leading / .trailing goes from left to right
          }
        )
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .bold()
        .font(.title3)
        .alert(
          "Hello there!",
          isPresented: $alertIsVisible,
          actions: {
            Button("Awesome") {
              print("Alert closed")
            }
          },
          message: {
            let roundedValue = Int(sliderValue.rounded())
            Text("""
                The slider's value is \(roundedValue).
                You scored \(game.points(sliderValue: roundedValue)) points this round.
                """)
            //Triple quotations assist with creating new lines in swift
          }
        )
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

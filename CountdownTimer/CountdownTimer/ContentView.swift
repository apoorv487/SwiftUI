//
//  ContentView.swift
//  CountdownTimer
//
//  Created by Apoorv Garg on 03/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Countdown Timer")
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
                .padding(.vertical, 20.0)
                        
            TimerView()
        }
        .background(Color.orange)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

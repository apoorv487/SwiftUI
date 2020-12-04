//
//  TimerView.swift
//  CountdownTimer
//
//  Created by Apoorv Garg on 03/12/20.
//

import SwiftUI

struct TimerView: View {
    //MARK: - PROPERTIES
    @State var timeRemaining = 24*60*60
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //MARK: - BODY
    var body: some View {
        
        Text("\(timeString(time: timeRemaining))")
            .font(.system(size: 60))
            .frame(height: 80.0)
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.black)
            .onReceive(timer){ _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }else{
                    self.timer.upstream.connect().cancel()
                }
            }
    }
    
    //Convert the time into 24hr (24:00:00) format
    func timeString(time: Int) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

//MARK: - PREVIEW
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .previewDevice("iPhone SE (2nd generation)")
    }
}


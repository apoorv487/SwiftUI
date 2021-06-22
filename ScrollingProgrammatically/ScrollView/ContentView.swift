//
//  ContentView.swift
//  ScrollView
//
//  Created by Apoorv Garg on 21/06/21.
//

import SwiftUI

enum ScrollType: String, CaseIterable, Identifiable {
    case manual
    case auto
    case loadNAuto

    var id: String { self.rawValue }
}

struct ContentView: View {
    @State private var listCount : Int = 0
    @State private var selectedOption = ScrollType.manual
    
    var body: some View {
        VStack{
            Picker(selection: $selectedOption, label: Text("Picker"), content: {
                Text("Manual").tag(ScrollType.manual)
                Text("Auto").tag(ScrollType.auto)
                Text("Load & Auto").tag(ScrollType.loadNAuto)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            switch selectedOption{
                case .manual: ManualScroll()
                case .auto: AutoScroll()
                case .loadNAuto: LoadNAuto()

                    
            }
        }
    }
}

//Manual Scroll
struct ManualScroll: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        Button("Scroll to row \(99 - i)") {
                            proxy.scrollTo(99-i)
                        }
                        Text("Row No : \(i)")
                            .frame(height: 32)
                            .id(i)  //Set the Id
                    }
                }
            }
        }
    }
}

//AutoScroll
struct AutoScroll: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        Text("Row No : \(i)")
                            .frame(height: 32)
                            .id(i)  //Set the Id
                    }
                }
            }
            .onAppear(perform: {
                proxy.scrollTo(99)
            })
        }
    }
}

//AutoScroll - when data is polulated after view appears
struct LoadNAuto: View {
    @State var listCount : Int = 0
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<listCount, id: \.self) { i in
                        Text("Row No : \(i)")
                            .frame(height: 32)
                            .id(i)  //Set the Id
                    }
                }
            }
            .onChange(of: listCount, perform: { value in
                proxy.scrollTo(99)
            })
            .onAppear(perform: {
                listCount = 100
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

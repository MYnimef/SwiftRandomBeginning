//
//  ContentView.swift
//  TestProject
//
//  Created by Ivan Markov on 12.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Screen1()
    }
}

struct FirstView: View {
    var body: some View {
        //VStack
        //HStack
        //ZStack
        
        ZStack {
            Color
                .red
                .ignoresSafeArea(.all)
            //Text("hmm").padding()
            //Text("1")
            //Text("2")
            //Text("3")
            Rectangle()
            
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                Text("Ok")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 14))
            }
        }
    }
}

struct Screen1: View {
    @State var show = false
    @State var text = ""
    
    var body: some View {
        VStack {
            Text("\(text)")
            Button(action: {
                self.text = "BOB"
                self.show.toggle()
                print(show)
            }){
                Text("button")
            }.fullScreenCover(isPresented: $show) {
                Screen2()
            }
            /*
            .sheet(isPresented: $show) {
                Screen2()
            }
             */
            
            /*
            NavigationView {
                NavigationLink(destination: Screen2()) {
                    Text("Move to screen 2")
                }.animation(.spring())
            }
            */
        }
    }
}

struct Screen2: View {
    @Environment(\.presentationMode) var present
    
    var body: some View {
        VStack {
            Text("Screen 2")
            Button(action: {
                self.present.wrappedValue.dismiss()
            }){
                Text("back")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

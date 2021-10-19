//
//  ContentView.swift
//  TestProject
//
//  Created by Ivan Markov on 12.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var getData = DataImport()
    
    var body: some View {
        NavigationView {
            List(getData.data) { i in
                ListRow(url: i.avatar_url, name: i.login)
            }.navigationTitle("JSON Data")
        }
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
    @State var text = "Dima"
    
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

struct LoginPage : View {
    @State var name = ""
    @State var surname = ""
    @State var show = false
    
    @State var name_saved = UserDefaults.standard.string(forKey: "Name")
    @State var surname_saved = UserDefaults.standard.string(forKey: "Surname")
    
    var body: some View {
        VStack {
            VStack(spacing: 60) {
                TextField("Name", text: $name)
                TextField("Surname", text: $surname)
            }
            .padding()
            
            Button(action: {
                if name_saved != "" && surname_saved != "" {
                    show.toggle()
                }
            }){
                Text("Move")
            }
            .sheet(isPresented: $show) {
                HomeView()
            }
            
            Button(action: {
                UserDefaults.standard.set(name, forKey: "Name")
                UserDefaults.standard.set(surname, forKey: "Surname")
            }){
                Text("Save")
            }
            
            Button(action: {
                UserDefaults.standard.removeObject(forKey: "Name")
                UserDefaults.standard.removeObject(forKey: "Surname")
            }){
                Text("Delete")
            }
        }
    }
}

struct HomeView : View {
    @State var name = UserDefaults.standard.string(forKey: "Name")
    @State var surname = UserDefaults.standard.string(forKey: "Surname")
    
    var body: some View {
        VStack {
            Text(name ?? "")
            Text(surname ?? "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

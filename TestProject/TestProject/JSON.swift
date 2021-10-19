//
//  JSON.swift
//  TestProject
//
//  Created by Ivan Markov on 19.10.2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct DataJson : Identifiable, Decodable {
    var id: Int
    var login: String
    var node_id: String
    var avatar_url: String
}

class DataImport : ObservableObject {
    @Published var data = [DataJson]()
    
    init() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "https://api.github.com/users/hadley/orgs")!) { (data, _, _) in
            do {
                let fetch = try JSONDecoder().decode([DataJson].self, from: data!)
                
                DispatchQueue.main.async {
                    self.data = fetch
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct ListRow : View {
    var url: String
    var name: String
    
    @Environment(\.colorScheme) var color
    
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: url))
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 10)
            Text(name)
                .foregroundColor(color == .dark ? .white : .black)
                .font(.system(size: 18))
                .fontWeight(.medium)
        }
    }
}


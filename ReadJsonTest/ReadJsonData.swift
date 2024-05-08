//
//  ReadJsonData.swift
//  ReadJsonTest
//
//  Created by Christopher Peralta on 6/05/24.
//

import Foundation

struct Joke: Codable, Identifiable {
    var id: String
    var joke: String
    var status: Int
}

class ReadJsonData: ObservableObject {
    @Published var jokes = [Joke]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "output", withExtension: "json") else {
            print ("json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let jokes = try JSONDecoder().decode([Joke].self, from: data)
            self.jokes = jokes
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

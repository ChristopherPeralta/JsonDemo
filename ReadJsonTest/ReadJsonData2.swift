//
//  ReadJsonData2.swift
//  ReadJsonTest
//
//  Created by Christopher Peralta on 8/05/24.
//

import Foundation

struct Joke2: Codable, Identifiable {
    var id: String
    var joke: String
    var status: Int
    var category: String
    var author: Author
    var tags: [String]
}

struct Author: Codable {
    var name: String
    var country: String
}

class ReadJsonData2: ObservableObject {
    @Published var jokes = [Joke2]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "output2", withExtension: "json") else {
            fatalError("No se pudo encontrar el archivo JSON en el paquete principal.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let jokes = try JSONDecoder().decode([Joke2].self, from: data)
            self.jokes = jokes
        } catch {
            fatalError("Error al decodificar JSON: \(error)")
        }
    }
}

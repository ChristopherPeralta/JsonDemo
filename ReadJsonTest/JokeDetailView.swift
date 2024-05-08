//
//  JokeDetailView.swift
//  ReadJsonTest
//
//  Created by Christopher Peralta on 8/05/24.
//

import SwiftUI

struct JokeDetailView: View {
    var joke: Joke2
    
    var body: some View {
        VStack {
            Text("Detalles de la Broma")
                .font(.title)
            
            HStack {
                Text("ID: \(joke.id)")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text("Status: \(joke.status)")
                    .foregroundStyle(.gray)
            }
            
                
            Text(joke.joke)
                .bold()
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(8)
            
            Text("Author: \(joke.author.name) - \(joke.author.country)")
            Text("Category: \(joke.category)")
            HStack {
                ForEach(joke.tags, id: \.self) { tag in
                    TagCard(tag: tag)
                }
            }
            
        }
        .padding(.horizontal, 40)
    }
    
    struct TagCard: View {
        var tag: String
        var body: some View {
            Text(tag)
                .font(.caption)
                .bold()
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.orange.opacity(0.8)))
                .foregroundColor(.white)
        }
    }
}
    


struct JokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        JokeDetailView(joke: Joke2(id: "A", joke: "Test joke", status: 200, category: "Test category", author: Author(name: "Test name", country: "Test country"), tags: ["Test tag"]))
    }
}

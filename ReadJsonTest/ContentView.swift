//
//  ContentView.swift
//  ReadJsonTest
//
//  Created by Christopher Peralta on 6/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data2 = ReadJsonData2()
    
    var body: some View {
            NavigationView {
                VStack {
                    Text("Lista de Bromas")
                        .font(.title)
                        .padding(.horizontal, 24)
                    
                    List(data2.jokes) { joke in
                        NavigationLink(destination: JokeDetailView(joke: joke)) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(joke.joke)
                                    .lineLimit(nil)
                                    .font(.title2)
                                    .bold()
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                HStack {
                                    ForEach(joke.tags, id: \.self) { tag in
                                        TagCard(tag: tag)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    
    struct TagCard: View {
        var tag: String
        
        var body: some View {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.orange.opacity(0.8))
                .overlay(
                    Text(tag)
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(8)
                )
                .padding(.vertical, 16)
        }
    }
}

#Preview {
    ContentView()
}

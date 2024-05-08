//
//  ContentView.swift
//  ReadJsonTest
//
//  Created by Christopher Peralta on 6/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = ReadJsonData()
    
    var body: some View {
        VStack {
            List(data.jokes) { joke in
                VStack(alignment: .leading) {
                    Text(joke.id)
                    Text(joke.joke)
                    Text("\(joke.status)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

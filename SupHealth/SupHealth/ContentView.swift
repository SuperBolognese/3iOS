//
//  ContentView.swift
//  SupHealth
//
//  Created by Student Supinfo on 30/03/2021.
//  Copyright © 2021 SonicDuCoït. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       TabView {
           MainList()
               .tabItem {
                   Image(systemName: "square")
                   Text("Global Informations")
           }
           CountryList()
               .tabItem{
                   Image(systemName: "list.bullet")
                   Text("List of countries")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

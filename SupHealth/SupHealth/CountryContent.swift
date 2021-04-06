//
//  CountryContent.swift
//  SupHealth
//
//  Created by Student Supinfo on 30/03/2021.
//  Copyright © 2021 SonicDuCoït. All rights reserved.
//

import SwiftUI

struct CountryContent: View {
    
    let countryName: String
    let cases: Int
    let recovered: Int
    let todayCases: Int
    let population: Int
    let totalDeaths: Int
    
    var body: some View {
        VStack{
            HStack{
                Text("Country : ").bold()
                Text(String(countryName))
            }
            HStack{
                Text("Population : ").bold()
                Text(String(population))
            }
            HStack{
                Text("Today's cases : ").bold()
                Text(String(todayCases))
            }
            HStack{
                Text("Total cases : ").bold()
                Text(String(cases))
            }
            HStack{
                Text("Death count : ").bold()
                Text(String(totalDeaths))
            }
            HStack{
                Text("Recovered : ").bold()
                Text(String(recovered))
            }
        }
    }
}

struct CountryContent_Previews: PreviewProvider {
    static var previews: some View {
        CountryContent(countryName: "", cases: 0, recovered: 0, todayCases: 0, population: 0, totalDeaths: 0)
    }
}

//
//  CountryList.swift
//  SupHealth
//
//  Created by Student Supinfo on 30/03/2021.
//  Copyright © 2021 SonicDuCoït. All rights reserved.
//

import SwiftUI

struct CountryList: View {
    @State var countries: [CountryInfo] = []

    var body: some View {
        NavigationView{
            VStack{
                List(self.countries){ (model) in
                    NavigationLink(destination: CountryContent(countryName: model.country, cases: model.cases, recovered: model.recovered, todayCases: model.todayCases, population: model.population, totalDeaths: model.deaths)){
                        HStack{
                            Text(flag(country: String(model.countryInfo.iso2 ?? "")))
                            Text(model.country).bold()
                        }.contentShape(Rectangle())
                    }
                }
            }.navigationBarTitle("Informations")
                .onAppear(){
                    API().getCountries { (countries) in
                        self.countries = countries
                }
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}

func flag(country:String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return String(s)
}

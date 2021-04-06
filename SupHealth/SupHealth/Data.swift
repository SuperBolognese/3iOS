//
//  Data.swift
//  SupHealth
//
//  Created by Student Supinfo on 30/03/2021.
//  Copyright © 2021 SonicDuCoït. All rights reserved.
//

import SwiftUI

struct Flags: Decodable {
    var iso2: String?
    var iso3: String?
    var lat: Float?
    var long: Float?
    var flag: String?
}

class CountryInfo: Decodable, Identifiable {
    var updated: Int?
    var country: String
    var countryInfo: Flags
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var recovered: Int
    var active: Int?
    var critical: Int?
    var casesPerOneMillion: Float?
    var deathsPerOneMillion: Float?
    var tests: Int?
    var testsPerOneMillion: Float?
    var population: Int
    var continent: String?
    var onCasePerPeople: Float?
    var oneDeathPerPeople: Float?
    var activePerOneMillion: Float?
    var recoveredPerOneMillion: Float?
    var criticalPerOneMillion: Float?
}

class GlobalInfo: Decodable, Identifiable {
    var updated: Int?
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recovered: Int
    var todayRecovered: Int
    var casesPerOneMillion: Float?
    var deathsPerOneMillion: Float?
    var tests: Int?
    var Population: Int?
    var affectedCountries: Int?
}

class API{
    
    func getCountries(completion: @escaping([CountryInfo]) -> ()){
        guard let url = URL(string: "https://corona.lmao.ninja/v2/countries?yesterday&sort") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let countries = try! JSONDecoder().decode([CountryInfo].self, from: data!)
            
            DispatchQueue.main.async {
                completion(countries)
            }
        }
        .resume()
    }
    
    
    func getGlobal(completion: @escaping(GlobalInfo) -> ()){
        guard let url = URL(string: "https://disease.sh/v3/covid-19/all") else { return }
            
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let infos = try! JSONDecoder().decode(GlobalInfo.self, from: data!)
            
            DispatchQueue.main.async {
                completion(infos)
            }
        }
        .resume()
    }
}

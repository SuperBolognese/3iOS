//
//  MainList.swift
//  SupHealth
//
//  Created by Student Supinfo on 30/03/2021.
//  Copyright © 2021 SonicDuCoït. All rights reserved.
//

import SwiftUI

struct MainList: View {
    @State var global: GlobalInfo?
    
    var body: some View {
        VStack{
            HStack{
                Text("Total cases (worldwide) : ").bold()
                Text(String(global?.cases ?? 0))
            }
            HStack{
                Text("Today's new cases : ").bold()
                Text(String(global?.todayCases ?? 0))
            }
            HStack{
                Text("Total deaths (worldwide) : ").bold()
                Text(String(global?.deaths ?? 0))
            }
            HStack{
                Text("Today's confirmed deaths : ").bold()
                Text(String(global?.todayDeaths ?? 0))
            }
            HStack{
                Text("Total recovered (worldwide) : ").bold()
                Text(String(global?.recovered ?? 0))
            }
            HStack{
                Text("Today's recovered : ").bold()
                Text(String(global?.todayRecovered ?? 0))
            }
        }.onAppear(){
            API().getGlobal { (infos) in
                self.global = infos
            }
        }
    }
}

struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList()
    }
}

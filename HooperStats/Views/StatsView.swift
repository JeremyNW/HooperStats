//
//  StatsView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            Text("James Smith")
                .padding()
            VStack(alignment: .leading) {
                Image(systemName: "person.circle")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 200.0, height: 200.0)
            Text("PPG:")
                .padding()
            Text("APG:")
                .padding()
            Text("RPG:")
                .padding()
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}

//
//  ContactView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/3/22.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        NavigationView {
            VStack{
            Text("Tell us what you think about HooperStats+!")
                .padding()
            Text("You can reach us at https://macrina.tech/")
                
            }
        }
        .navigationTitle("Contact Us")
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}

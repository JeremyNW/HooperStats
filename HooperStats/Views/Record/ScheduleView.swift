//
//  ScheduleView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/14/22.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject var viewModel = ScheduleViewModel()
    
    
    var body: some View {
        NavigationView {
            
            
                CalendarChooser(calendars: $viewModel.calenders, eventStore: viewModel.store)
                
            
            .navigationBarTitle("Schedule", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}

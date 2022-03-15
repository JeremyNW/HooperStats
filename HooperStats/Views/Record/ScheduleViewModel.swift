//
//  ScheduleViewModel.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/14/22.
//

import Foundation
import EventKit

class ScheduleViewModel: ObservableObject {
    @Published var calenders: Set<EKCalendar>?
    var store = EKEventStore()
    
    func onAppear() {
        store.requestAccess(to: .reminder) { granted, error in
            if let error = error {
                print(error)
            }
        }
    }
    
}

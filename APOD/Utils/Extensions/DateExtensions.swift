//
//  DateExtensions.swift
//  APOD
//
//  Created by David Molina on 4/05/22.
//

import Foundation

extension Date {
    
    func toString(dateFormat: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    func removing(days: Int, dateFormat: String = "yyyy-MM-dd") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dayComp = DateComponents(day: -days)
        guard let startDate = Calendar.current.date(byAdding: dayComp, to: self) else { return nil }
        return dateFormatter.string(from: startDate)
    }
    
}

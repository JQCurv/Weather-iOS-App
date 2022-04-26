//
//  ConvertingFunctions.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-03.
//

import Foundation

func celciusToFarenheit (tempCel: Double) -> Double {
    return tempCel*(9/5) + 32
}

func unixToDate (unixTime: Int64) -> Date {
    let epocTime = TimeInterval(unixTime)
    let myDate = Date(timeIntervalSince1970: epocTime)
    return myDate
}

func dateToComponents (date: Date, timeZone: Int) -> DateComponents {
    let calendar = Calendar.current
    var components: DateComponents
    if let timeZone = TimeZone(secondsFromGMT: timeZone) {
        components = calendar.dateComponents(in: timeZone, from: date)
    } else {
        components = calendar.dateComponents(in: .current, from: date)
    }
    return components
}

func unixToDateComps (unixTime: Int64, timeZone: Int) -> DateComponents {
    let epocTime = TimeInterval(unixTime)
    let date = Date(timeIntervalSince1970: epocTime)
    
    let calendar = Calendar.current
    var components: DateComponents
    if let timeZone = TimeZone(secondsFromGMT: timeZone) {
        components = calendar.dateComponents(in: timeZone, from: date)
    } else {
        components = calendar.dateComponents(in: .current, from: date)
    }
    return components
}

func dateFormat (unixTime: Int64) {
    let epocTime = TimeInterval(unixTime)
    let date = Date(timeIntervalSince1970: epocTime)

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm Z"
    
}

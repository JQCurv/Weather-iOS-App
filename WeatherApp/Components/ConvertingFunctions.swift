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

func dateToTime (unixTime: Int64, timeZone: Int) -> (hours: Int, minutes: Int) {
    //need to adjust for eastern timezone cause Calendar tries to put times in ET
    let adjustment = 14400
    let adjustedUnixTime = unixTime + Int64(timeZone) + Int64(adjustment)
    let date = Date(timeIntervalSince1970: TimeInterval(adjustedUnixTime))

    let calendar = Calendar.current
    
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    
    return (hour, minute)
}

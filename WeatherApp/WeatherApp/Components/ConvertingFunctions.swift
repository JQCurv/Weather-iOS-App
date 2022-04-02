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

func unixToDate (unixTime: Int64) {
    //TODO: Get just the hour and minute from unixTime
    let epocTime = TimeInterval(unixTime)
    
    let myDate = NSDate(timeIntervalSince1970: epocTime)
    print("Converted Time \(myDate)")
}

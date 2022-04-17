//
//  HighAndLowTemps.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-14.
//

import SwiftUI

struct HighAndLowTemps: View {
    @Binding var lowTemp: Double
    @Binding var highTemp: Double
    var font: Font = Font.body
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "thermometer")
                .foregroundColor(.blue)
            TempText(temp: $lowTemp)
            TempText(temp: $highTemp)
            Image(systemName: "thermometer")
                .foregroundColor(.red)
        }
        .font(font)
    }
}

struct HighAndLowTemps_Previews: PreviewProvider {
    @State static var lowTemp = -1.0
    @State static var highTemp = 1.0
    static var font = Font.title3
    
    static var previews: some View {
        HighAndLowTemps(
            lowTemp: $lowTemp,
            highTemp: $highTemp,
            font: font
        )
    }
}

//
//  TempText.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-02-24.
//

import SwiftUI

struct TempText: View {
    //The temperature value
    @Binding var temp: Double
    
    var body: some View {
        Text("\(negZeroCheck, specifier: "%.0f")ºC")
    }
    
    //Variable prevents the glitch of -0 appearing
    var negZeroCheck: Double {
        if temp < 0 && temp >= -0.5 {
            return -temp
        }
        return temp
    }
}

struct TempText_Previews: PreviewProvider {
    @State static var temp = -12.0
    
    static var previews: some View {
        TempText(temp: $temp)
    }
}

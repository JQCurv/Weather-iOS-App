//
//  WeatherImage.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-03-14.
//

import SwiftUI

struct WeatherImage: View {
    @Binding var image: String
    @Binding var newColor: Color

    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(newColor)
        }
    }
}

struct WeatherImage_Previews: PreviewProvider {
    @State static var image = "cloud.fill"
    @State static var newColor = Color.gray
    static var previews: some View {
        WeatherImage(
            image: $image,
            newColor: $newColor
        )
    }
}

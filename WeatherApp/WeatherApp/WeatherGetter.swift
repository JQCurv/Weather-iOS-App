//
//  WeatherGetter.swift
//  WeatherApp
//
//  Created by Joshua Quittner on 2022-02-15.
//

import Foundation

class WeatherGetter {
    
    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "dc46e75444b4039411cd07684b42c9a7"
    
    func getWeather(city: String) {
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        let weatherRequestURL = NSURL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!

        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL as URL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
//                let dataString = String(data: data!, encoding: String.Encoding.utf8)
//                print("Human-readable data:\n\(dataString!)")
                
                do {
                    // Try to convert that data into a Swift dictionary
                    let weatherData = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    
                    // If we made it to this point, we've successfully converted the
                    // JSON-formatted weather data into a Swift dictionary.

                    //Print all values to the console
                    //cordinates
                    print("\n\nLongitude: \(weatherData["coord"]!["lon"]!!)")
                    print("Latitude: \(weatherData["coord"]!["lat"]!!)")
                    
                    //weather
                    print("\nWeather ID: \((weatherData["weather"]![0]! as! [String:AnyObject])["id"]!)")
                    print("Weather main: \((weatherData["weather"]![0]! as! [String:AnyObject])["main"]!)")
                    print("Weather description: \((weatherData["weather"]![0]! as! [String:AnyObject])["description"]!)")
                    print("Weather icon: \((weatherData["weather"]![0]! as! [String:AnyObject])["icon"]!)")
                    
                    //base
                    print("\nBase: \(weatherData["base"]!)")
                    
                    //main temp data
                    print("\nTemperature: \(weatherData["main"]!["temp"]!!)")
                    print("Feels like: \(weatherData["main"]!["feels_like"]!!)")
                    print("Temp min: \(weatherData["main"]!["temp_min"]!!)")
                    print("Temp max: \(weatherData["main"]!["temp_max"]!!)")
                    print("Pressure: \(weatherData["main"]!["pressure"]!!)")
                    print("Humidity: \(weatherData["main"]!["humidity"]!!)")
                    
                    //visibility
                    print("\nVisibility: \(weatherData["visibility"]!)")

                    //wind
                    print("\nWind direction: \(weatherData["wind"]!["deg"]!!) degrees")
                    print("Wind speed: \(weatherData["wind"]!["speed"]!!)")

                    //clouds
                    print("\nCloud cover: \(weatherData["clouds"]!["all"]!!)")
                    
                    //date and time
                    print("\nDate and time: \(weatherData["dt"]!)")

                    //city
                    print("\nCity: \(weatherData["name"]!)")
                    
                    //system readouts
                    print("\nCountry: \(weatherData["sys"]!["country"]!!)")
                    print("Sunrise: \(weatherData["sys"]!["sunrise"]!!)")
                    print("Sunset: \(weatherData["sys"]!["sunset"]!!)")
                    print("Timzone: \(weatherData["timezone"]!)")
                }
                catch let jsonError as NSError {
                    // An error occurred while trying to convert the data into a Swift dictionary.
                    print("JSON error description: \(jsonError.description)")
                }

            }
        }
        
        // The data task is set up...launch it!
        dataTask.resume()
    }
    
}

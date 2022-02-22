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
    
    public var longitude: Double
    public var latitude: Double

    public var weatherID: Int
    public var weatherMain: String
    public var weatherDescription: String
    public var weatherIcon: String
    
    public var base: String
    
    public var temp: Double
    public var feelsLike: Double
    public var tempMin: Double
    public var tempMax: Double
    public var pressure: Double
    public var humidity: Double
    
    public var visibility: Double
    
    public var windSpeed: Double
    public var windDegree: Double
    
    public var cloudCover: [String: Double]
    
    public var dateAndTime: Int64
    
    public var city: String
    
    public var country: String
    public var sunrise: Int64
    public var sunset: Int64
    public var timezone: Int
    
    public init () {
        longitude = 0.0
        latitude = 0.0
        
        weatherID = 0
        weatherMain = ""
        weatherDescription = ""
        weatherIcon = ""
        
        base = ""
        
        temp = 0.0
        feelsLike = 0.0
        tempMin = 0.0
        tempMax = 0.0
        pressure = 0.0
        humidity = 0.0
        
        visibility = 0.0
        
        windSpeed = 0.0
        windDegree = 0.0
        
        cloudCover = ["": 0.0]
        
        dateAndTime = 0
        
        city = ""
        
        country = ""
        sunrise = 0
        sunset = 0
        timezone = 0
    }
    
    func printWeatherData () {
        print("\n\nPrinting weather data...")
        
        print("\nLongitude: \(longitude)")
        print("Latitude: \(latitude)")
        
        //weather
        print("\nWeather ID: \(weatherID)")
        print("Weather main: _\(weatherMain)_")
        print("Weather description: _\(weatherDescription)_")
        print("Weather icon: _\(weatherIcon)_")
        
        //base
        print("\nBase: _\(base)_")
        
        //main temp data
        print("\nTemperature: \(temp)")
        print("Feels like: \(feelsLike)")
        print("Temp min: \(tempMin)")
        print("Temp max: \(tempMax)")
        print("Pressure: \(pressure)")
        print("Humidity: \(humidity)")
        
        //visibility
        print("\nVisibility: \(visibility)")
        
        //wind
        print("\nWind direction: \(windDegree) degrees")
        print("Wind speed: \(windSpeed)")
        
        //clouds
        print("\nCloud cover: \(cloudCover)")
        
        //date and time
        print("\nDate and time: \(dateAndTime)")
        
        //city
        print("\nCity: _\(city)_")
        
        //system readouts
        print("\nCountry: _\(country)_")
        print("Sunrise: \(sunrise)")
        print("Sunset: \(sunset)")
        print("Timzone: \(timezone)")
    }
    
    
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

                    //Assigned all dictonary values to their respective values in the class
                    //cordinates
                    self.longitude = weatherData["coord"]!["lon"]!! as! Double
                    self.latitude = weatherData["coord"]!["lon"]!! as! Double
//                    print("\n\nLongitude: \(weatherData["coord"]!["lon"]!!)")
//                    print("Latitude: \(weatherData["coord"]!["lat"]!!)")
                    
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

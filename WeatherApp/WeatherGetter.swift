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
    private let units = "metric"
    
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
    
    public var cloudCover: Int
    
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
        
        cloudCover = 0
        
        dateAndTime = 0
        
        city = ""
        
        country = ""
        sunrise = 0
        sunset = 0
        timezone = 0
    }
    
    func getWeather(city: String = "Toronto", afterDataLoaded: @escaping () -> Void) {
        //TODO: Use geo location API instead of using city
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        let weatherRequestURL = NSURL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)&units=\(units)")!
        
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
                
                do {
                    // Try to convert that data into a Swift dictionary
                    let weatherData = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    
                    // If we made it to this point, we've successfully converted the
                    // JSON-formatted weather data into a Swift dictionary.
                    
                    //Assign all dictonary values to their respective values in the class
                    self.assignValues(weatherData: weatherData)
                    
                    afterDataLoaded()
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

    
    func printWeatherData () {
        print("\n\nPRINTING WEATHER DATA...")
        
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
    
    func assignValues (weatherData: [String: AnyObject]) {
        //coordinates
        self.longitude = weatherData["coord"]!["lon"]!! as! Double
        self.latitude = weatherData["coord"]!["lon"]!! as! Double
        
        //weather
        self.weatherID = ((weatherData["weather"]![0]! as! [String:AnyObject])["id"]!).integerValue
        self.weatherMain = (weatherData["weather"]![0]! as! [String:AnyObject])["main"]! as! String
        self.weatherDescription = (weatherData["weather"]![0]! as! [String:AnyObject])["description"]! as! String
        self.weatherIcon = (weatherData["weather"]![0]! as! [String:AnyObject])["description"]! as! String
        
        //base
        self.base = weatherData["base"]! as! String
        
        //main temp data
        self.temp = weatherData["main"]!["temp"]!! as! Double
        self.feelsLike = weatherData["main"]!["feels_like"]!! as! Double
        self.tempMin = weatherData["main"]!["temp_min"]!! as! Double
        self.tempMax = weatherData["main"]!["temp_max"]!! as! Double
        self.pressure = weatherData["main"]!["pressure"]!! as! Double
        self.humidity = weatherData["main"]!["humidity"]!! as! Double
        
        //visibility
        self.visibility = weatherData["visibility"]! as! Double
        
        //wind
        self.windDegree = weatherData["wind"]!["deg"]!! as! Double
        self.windSpeed = weatherData["wind"]!["speed"]!! as! Double
        
        //clouds
        self.cloudCover = weatherData["clouds"]!["all"]!! as! Int
        
        //date and time
        self.dateAndTime = weatherData["dt"]! as! Int64
        
        //city
        self.city = weatherData["name"]! as! String
        
        //system readouts
        self.country = weatherData["sys"]!["country"]!! as! String
        self.sunrise = weatherData["sys"]!["sunrise"]!! as! Int64
        self.sunset = weatherData["sys"]!["sunset"]!! as! Int64
        self.timezone = weatherData["timezone"]! as! Int
    }
}

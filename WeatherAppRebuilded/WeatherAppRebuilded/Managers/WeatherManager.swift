//
//  WeatherManager.swift
//  WeatherAppRebuilded
//
//  Created by Павел Курзо on 21.09.22.
//

import Foundation

enum APIError: Error {
    case genericError
    case urlCreationError
}

class WeatherManager {
    
    private let baseUrl = "api.openweathermap.org/data/2.5/"
    private let appid = "0058adaff3893eb760cbbf2c877c6e7d"
    
    func getCurrentWeather(_ city: String) async throws -> ResponseBody {
        
        let parameters = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "lang", value: "eng"),
            URLQueryItem(name: "units", value: "metric")
        ]
        guard let weatherURL = makeUrl("weather", parameter: parameters) else { throw APIError.urlCreationError }
        
        let urlRequest = URLRequest(url: weatherURL)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
    private func makeUrl(_ method: String, parameter: [URLQueryItem]) -> URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.path = baseUrl + method
        
        var queryItems = [
            URLQueryItem(name: "appid", value: appid)
        ]
        queryItems.append(contentsOf: parameter)
        component.queryItems = queryItems
        return component.url
    }
}

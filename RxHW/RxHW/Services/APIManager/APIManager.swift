//
//  APIManager.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 20/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation

/// Enum с одним кейсом состоящим из базового url и пути
///
/// - Current: кейсом состоящим из базового url и пути
public enum RequestType: FinalURLPoint {
    
    case starships
    case vehicles
    case planets
    
    var baseURL: URL {
        return URL(string: "https://swapi.co/api")!
    }
    
    var path: String {
        switch self {
        case .starships:
            return "/starships/"
        case .vehicles:
            return "/vehicles/"
        case .planets:
            return "/planets/"
        }
    }
    
    var fields: [String] {
        switch self {
        case .starships:
            return ["name", "model"]
        case .vehicles:
            return ["name", "vehicle_class"]
        case .planets:
            return ["name", "orbital_period"]
        }
    }
    
    var request: URLRequest {
        let url = URL(string: baseURL.absoluteString + path)
        return URLRequest(url: url!)
    }
}

class APIManager: APIManagerProtocol {
    
    /// конфигурация сессии
    let sessionConfiguration: URLSessionConfiguration
    /// Сессия строящаяся по конфигурации
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
    /// инициализация конфигурации
    ///
    /// - Parameter sessionConfiguration: принимает конфигурацию
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    /// Получение результата
    ///
    /// - Parameters:
    ///   - term: то, что ищем
    ///   - settings: Settings, по которым ищем
    ///   - completionHandler: completionHandler
    func fetchResultWith(requestType: RequestType, completionHandler: @escaping (APIResult<FoundedItem>) -> Void) {
        
        let request = requestType.request
        
        fetch(request: request, parse: { (json) -> [FoundedItem]? in
            if let dictionary = json["results"] as? [[String: AnyObject]] {
                var founded: [FoundedItem] = []
                
                for item in dictionary {
                    founded.append(FoundedItem(requestType: requestType, JSON: item)!)
                }
                return founded
            } else {
                return nil
            }
        }, completionHandler: completionHandler)
        
    }
    
    
}

//
//  CompanyTarget.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation
import Alamofire

struct CompanyTarget: MakeableTargetType {
    // MARK: - Nested
    
    enum EndpointType {
        case people
        case rooms
    }
    
    // MARK: - Properties
    
    let host: String
    let headers: [String: String]?
    
    var method: HTTPMethod {
        switch endpoint {
        case .people, .rooms:
            return .get
        }
    }
    
    var path: String {
        let path: String
        
        switch endpoint {
        case .people:
            path = "/people"
        case .rooms:
            path = "/rooms"
        }
        
       return "/api/\(apiVersion)" + path
    }
    
    private let apiVersion: String
    private let endpoint: EndpointType
    
    // MARK: - Constructor
    
    init(
        host: String,
        apiVersion: String,
        endpointType: EndpointType,
        headers: [String: String]? = nil
    ) {
        self.host = host
        self.apiVersion = apiVersion
        self.endpoint = endpointType
        self.headers = headers
    }
}


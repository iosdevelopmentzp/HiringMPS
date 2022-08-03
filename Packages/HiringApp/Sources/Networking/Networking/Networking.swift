//
//  Networking.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation
import RxAlamofire
import RxCocoa
import RxSwift

final class Networking {
    func perform<T: Decodable>(target: TargetType, decoder: JSONDecoder = .api) -> Single<T> {
        RxAlamofire
            .request(target.method, target, parameters: target.parameters, headers: target.asHTTPHeaders)
            .validate(statusCode: 200 ... 399)
            .validate(contentType: ["application/json"])
            .data()
            .map { try decoder.decode(T.self, from: $0) }
            .asSingle()
    }
}

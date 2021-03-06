//
//  URLSession-CustomRetry.swift
//  Frontend
//
//  Created by Julian Schiavo on 21/11/2020.
//

import Combine
import Foundation

extension URLSession.DataTaskPublisher {
    func retryIfNeeded() -> Publishers.Retry<Publishers.TryMap<URLSession.DataTaskPublisher,  Data>> {
        self
            .tryMap { data, response -> Data in
                if isError(data: data) {
                    Swift.print("---X", request.url!.lastPathComponent, String(data: data, encoding: .utf8)!, response)
                    throw Errors.unknown
                }
                return data
            }
            .retry(3)
    }
    
    private func isError(data: Data) -> Bool {
        do {
            try _ = JSONDecoder.default.decode(ErrorResponse.self, from: data)
            return true
        } catch {
            return false
        }
    }
}

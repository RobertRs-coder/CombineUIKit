//
//  File.swift
//  CombineUIKit
//
//  Created by Roberto Rojo Sahuquillo on 3/11/22.
//
import Foundation

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse{
            return httpResponse.statusCode
        }
        return nil
    }
}

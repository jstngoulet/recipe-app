//
//  RequestMethod.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import Foundation

/**
 Different request methods (HTTP)
 */
@frozen
public enum RequestMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
    case patch  = "PATCH"
}

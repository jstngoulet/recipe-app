//
//  Hosts.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import Foundation

/**
 List of hosts for the domain, includes parent path.
 - Note:    This list of hosts should be updated based on domain, subdomain and path provided
 elsewhere when more requests are provided
 */
enum Hosts {
    static let api = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net")!
}

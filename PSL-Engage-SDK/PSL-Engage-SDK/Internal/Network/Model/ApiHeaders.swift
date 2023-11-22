//
//  ApiHeaders.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

/// APIHeader
internal struct APIHeaderNames {
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let cookies = "Cookie"
    static let authorization = "Authorization"
}

/// APIHeaderValues
internal enum APIHeaderValues {
    static let contentType = "application/json"
    static let accept = "application/json"
    static let cookies = "_tring_session=LfX4JsELv4oY37q%2B0Rao%2BTzZIWFd8sCtdLVl9OflxeiPjdXsDLzOoZTY9P%2BL%2BVDqmNtxUji4O%2FN68cbMZlmcWS17xUO7k0mBBDc8DNurhjBdaUSQ6pAJgKKAApxu1nLs9yHMoyo48l%2FVzLb5c60VqlKhLbk15yNUISOfZzplcyXxycHVqbWZ9RyGS32pH0JqroSohWkkVKSlXoE%2BoQBsenn8k%2FrNoS4tPnvMqtXcxqElCEfxTuYQrR3h7WMlqcwyLI%2Fcsgz64ysPviVGyGvYYdHulJlNjg%3D%3D--hWef3VVxGTqAfNwL--bhNTvlqNx%2BCIYa4v7sKDyw%3D%3D"
    static let authorization = "Bearer eyJhY2Nlc3MtdG9rZW4iOiJzYUNMNTJ5VjF3TC0wQV95ZHlGZ2dnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IlFkUC0zd2ZfYnk4RWJtUURxcE1hY1EiLCJleHBpcnkiOiIxNzA1ODI2MzM5IiwidWlkIjoicm9zaGFuX2RoYWJla2FyQHBlcnNpc3RlbnQuY29tIn0="
}

//
//  TataNetworkRequest.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal class TataNetworkRequest<T: Codable>: BaseNetworkRequest<T> {
    var authToken: String?
    
    override func setupHeaders() {
        let headers = [
            APIHeaderNames.contentType: APIHeaderValues.contentType,
            APIHeaderNames.cookies: APIHeaderValues.cookies,
            APIHeaderNames.authorization: APIHeaderValues.authorization
        ]
        self.headers = headers
    }
    
    override func generateUrlComponents() throws -> URLComponents {
        let BaseURL: String? = "http://alb-set2-414339619.ap-south-1.elb.amazonaws.com:3050" /// Add Base URL in common file
        guard let baseUrl = BaseURL, let urlComponents = URLComponents(string: baseUrl + path) else {
            throw SDKError.failed(reason: "Failed to construct URLComponents in TataNetworkRequest.")
        }
        return urlComponents
    }
    
    init(path: String, httpMethod: HTTPMethod, queryParameters: [String : String]? = nil, body: T? = nil, headers: Headers? = nil, authToken: String? = nil) {
        super.init(path: path, httpMethod: httpMethod, queryParameters: queryParameters, body: body, headers: headers)
        self.authToken = authToken
    }
}

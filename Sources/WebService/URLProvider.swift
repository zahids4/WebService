import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

fileprivate struct Constants {
    static let version3 = "v3"
    static let https = "https"
    static let wattpadBaseURL = "wattpad.com"
}

extension Endpoint {
    static func storiesEndpoint(offset: String = "0",
                                limit: String = "50",
                                fields: String = "stories(id,title,cover,user)",
                                filter: String = "new") -> Endpoint {
        return Endpoint(
            path: "/api/\(Constants.version3)/stories",
            queryItems: [
                URLQueryItem(name: "offset", value: offset),
                URLQueryItem(name: "limit", value: limit),
                URLQueryItem(name: "fields", value: fields),
                URLQueryItem(name: "filter", value: filter),
            ]
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.https
        components.host = Constants.wattpadBaseURL
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}


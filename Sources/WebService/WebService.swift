import Foundation
import UIKit

public protocol WebServiceProviding {
    func fetchStories() async -> Result<Data, NetworkError>
}

public class WebServiceProvider: WebServiceProviding {
    public init() {}
    
    public func fetchStories() async -> Result<Data, NetworkError> {
        guard let storiesURL = Endpoint.storiesEndpoint().url else {
            return .failure(.invalidURL)
        }
        
        return await getRequest(withURL: storiesURL)
    }
}

public enum NetworkError: Error {
    case invalidURL
    case invalidData
}

fileprivate extension WebServiceProvider {
    func getRequest(withURL url: URL) async -> Result<Data, NetworkError> {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return .success(data)
        } catch {
            return .failure(.invalidData)
        }
    }
}

//
//  NetworkTest.swift
//  MovieOn
//
//  Created by Alam Alonzo on 23/12/24.
//

import Foundation


final class NetworkTest: URLProtocol {
    var testURL: URL {
        Bundle.main.url(forResource: "previewData", withExtension: "json")!
    }

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        if let url = request.url {
            if url.lastPathComponent == "now_playing" {
                guard let data = try? Data(contentsOf: testURL),
                      let response = HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: nil,
                        headerFields: nil
                      ) else { return }
                
                client?.urlProtocol(self, didLoad: data)
                client?.urlProtocol(
                    self,
                    didReceive: response,
                    cacheStoragePolicy: .notAllowed
                )
            }
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
}

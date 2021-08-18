//
//  NetworkManager.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import Foundation
import Moya

protocol Networkable {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
    func getListBook(completion: @escaping ([ListBook]) ->())
    func getDetailBook(params: Dictionary<String, Any>, completion: @escaping ([ModelDetail]) ->())
    func getListImage(params: Dictionary<String, Any>, completion: @escaping ([ListImage]) ->())
}

public class NetworkManager: Networkable {
    
    static var shared: NetworkManager = NetworkManager()
    
    let provider = MoyaProvider<MovieApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func getListBook(completion: @escaping ([ListBook]) -> ()) {
        provider.request(.listbook(params: [:]), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([ListBook].self, from: response.data)
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func getDetailBook(params: Dictionary<String, Any>,completion: @escaping ([ModelDetail]) -> ()) {
        provider.request(.listDetailBook(params: params), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([ModelDetail].self, from: response.data)
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
            
        })
    }
    
    func getListImage(params: Dictionary<String, Any>, completion: @escaping ([ListImage]) -> ()) {
        provider.request(.listImage(params: params), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([ListImage].self, from: response.data)
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
            
        })
    }
    
    private var images = NSCache<NSString, NSData>()
    
    private func download(imageURL: URL, completion: @escaping (Data?, Error?) -> (Void)) {
      if let imageData = images.object(forKey: imageURL.absoluteString as NSString) {
        print("using cached images")
        completion(imageData as Data, nil)
        return
      }
    }
    
    
    func image(post: ListBook, completion: @escaping (Data?, Error?) -> (Void)) {
        let url = URL(string: post.linkAnh)!
      download(imageURL: url, completion: completion)
    }
}

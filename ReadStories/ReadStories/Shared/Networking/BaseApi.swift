//
//  BaseApi.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import Foundation
import Moya

enum BaseURL: String {
    case listbook
    case detailListBook
    case listImage
}
enum MovieApi {
    case recommended(id:Int)
    case popular(page:Int)
    case newMovies(page:Int)
    case video(id:Int)
    case listbook(params: Dictionary<String, Any>)
    case listDetailBook(params: Dictionary<String, Any>)
    case listImage(params: Dictionary<String, Any>)
}

extension MovieApi: TargetType {
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://minhkhang2020.000webhostapp.com/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .recommended(let id):
            return "\(id)/recommendations"
        case .popular:
            return "popular"
        case .newMovies:
            return "now_playing"
        case .video(let id):
            return "\(id)/videos"
        case .listbook:
            return "layTruyen.php"
        case .listDetailBook:
            return "layChap.php"
        case .listImage:
            return "layAnh.php"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .listbook:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .recommended, .video:
            return .requestParameters(parameters: ["api_key":  ""], encoding: URLEncoding.queryString)
        case .popular(let page), .newMovies(let page):
            return .requestParameters(parameters: ["page":page, "api_key": "NetworkManager.MovieAPIKey"], encoding: URLEncoding.queryString)
        case .listbook:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .listDetailBook(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .listImage(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
//    var headers: [String : String]? {
//        return ["Content-type": "application/json"]
//    }
    
    // stuff
}

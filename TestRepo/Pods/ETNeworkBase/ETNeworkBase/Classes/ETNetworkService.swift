//
//  ETNetworkService.swift
//  MoyaDemo
//
//  Created by 戴运鹏 on 2018/12/21.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import Foundation
import Moya
public enum MyNetwork {
    case userList(page:String,pagesize:String)
}
 extension MyNetwork:TargetType
{
    public var baseURL:URL {return URL(string: "http://192.168.3.219:8181")!}
    public var path:String {
        switch self {
        case .userList(_,_):
            return "/v1/vendor/list"
        }
    }
    public var method: Moya.Method{
        switch self {
        case .userList:
            return .get
        }
    }
    
    public var task :Task{
        switch self {
        case let .userList(page,pagesize):
            return .requestParameters(parameters: ["page":page,"pagesize":pagesize], encoding: URLEncoding.queryString)
        }
    }
    public var sampleData:Data{
        switch self {
        case .userList:
            return Data()
        }
    }
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}


//adapter
public struct NetworkService {
     public static let provider = MoyaProvider<MyNetwork>()
    public static func request(_ target:MyNetwork, success successCallBack:@escaping(Data) -> Void,error errorCallBack:@escaping (Int)->Void,failure failureCallBack:@escaping (MoyaError)->Void){
        provider.request(target) { (result) in
            switch result{
            case let .success(response):
                do {
                    _ = try response.filterSuccessfulStatusCodes()
                    successCallBack(response.data)
                }catch let error {
                    errorCallBack((error as! MoyaError).response!.statusCode)
                }
            case let .failure(error):
                failureCallBack(error)
            }
        }
    }
    
   public init() {
        
    }
}

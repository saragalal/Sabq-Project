//
//  NetworkCall.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import Moya
extension NetworkManager{
    func getHomePageMaterial(completion: @escaping (
        _ result: Swift.Result<HomeMaterialResponse, MoyaError>,
        _ statusCode: StatusCode?
        ) -> Void){
        provider.request(MultiTarget(HomeService.homePage)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        print(response.data)
                        let resp = try JSONDecoder().decode(HomeMaterialResponse.self, from: response.data)
                        dump(resp)
                        completion(.success(resp), response.statusCode)
                    } catch {
                       // completion(.failure(<#Failure#>), response.statusCode)
                    }
                }
//                else {
//                    // 300-399 ,400-499
//                    do {
//                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
//                        businessError.type = .business
//                        completion(.failure(businessError), response.statusCode)
//                    } catch {
//                        completion(.failure(NetworkError.parseError), response.statusCode)
//                    }
          //    }
                
            case .failure(let error):
                print(error)
//                let customError = NetworkError(error: error)
//                completion(.failure(customError), nil)
            }
        }
    }
    func getHomePageVideo(completion: @escaping (
        _ result: Swift.Result<HomeImagesVideoResponse, MoyaError>,
        _ statusCode: StatusCode?
        ) -> Void){
        provider.request(MultiTarget(HomeService.homeVideo)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        print(response.data)
                        let resp = try JSONDecoder().decode(HomeImagesVideoResponse.self, from: response.data)
                        dump(resp)
                        completion(.success(resp), response.statusCode)
                    } catch {
                        print("codable error")
                        // completion(.failure(Failure), response.statusCode)
                    }
                }
                //                else {
                //                    // 300-399 ,400-499
                //                    do {
                //                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                //                        businessError.type = .business
                //                        completion(.failure(businessError), response.statusCode)
                //                    } catch {
                //                        completion(.failure(NetworkError.parseError), response.statusCode)
                //                    }
                //    }
                
            case .failure(let error):
                print(error)
                //                let customError = NetworkError(error: error)
                //                completion(.failure(customError), nil)
            }
        }
    }
    func getHomePageImages(completion: @escaping (
        _ result: Swift.Result<HomeImagesVideoResponse, MoyaError>,
        _ statusCode: StatusCode?
        ) -> Void){
        provider.request(MultiTarget(HomeService.homeImage)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        print(response.data)
                        let resp = try JSONDecoder().decode(HomeImagesVideoResponse.self, from: response.data)
                        dump(resp)
                        completion(.success(resp), response.statusCode)
                    } catch {
                       
                        // completion(.failure(<#Failure#>), response.statusCode)
                    }
                }
                //                else {
                //                    // 300-399 ,400-499
                //                    do {
                //                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                //                        businessError.type = .business
                //                        completion(.failure(businessError), response.statusCode)
                //                    } catch {
                //                        completion(.failure(NetworkError.parseError), response.statusCode)
                //                    }
                //    }
                
            case .failure(let error):
                print(error)
                //                let customError = NetworkError(error: error)
                //                completion(.failure(customError), nil)
            }
        }
    }
    func getHomePageArticles(completion: @escaping (
        _ result: Swift.Result<HomeArticlesResponse, MoyaError>,
        _ statusCode: StatusCode?
        ) -> Void){
        provider.request(MultiTarget(HomeService.homeArticle)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        print(response.data)
                        let resp = try JSONDecoder().decode(HomeArticlesResponse.self, from: response.data)
                        dump(resp)
                        completion(.success(resp), response.statusCode)
                    } catch {
                        // completion(.failure(<#Failure#>), response.statusCode)
                    }
                }
                //                else {
                //                    // 300-399 ,400-499
                //                    do {
                //                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                //                        businessError.type = .business
                //                        completion(.failure(businessError), response.statusCode)
                //                    } catch {
                //                        completion(.failure(NetworkError.parseError), response.statusCode)
                //                    }
                //    }
                
            case .failure(let error):
                print(error)
                //                let customError = NetworkError(error: error)
                //                completion(.failure(customError), nil)
            }
        }
    }
}

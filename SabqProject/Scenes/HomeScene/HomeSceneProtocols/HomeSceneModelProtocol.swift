//
//  HomeSceneModelProtocol.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import Moya
protocol HomeSceneModelProtocol: BaseModelProtocol {
    
    func getHomeMaterialData(compelation: @escaping ((Result<HomeMaterialResponse, MoyaError>) -> Void))
    func getHomeVideosData(compelation: @escaping ((Result<HomeImagesVideoResponse, MoyaError>) -> Void))
    func getHomeImagesData(compelation: @escaping ((Result<HomeImagesVideoResponse, MoyaError>) -> Void))
    
     func getHomeArticlesData(compelation: @escaping ((Result<HomeArticlesResponse, MoyaError>) -> Void)) 
}

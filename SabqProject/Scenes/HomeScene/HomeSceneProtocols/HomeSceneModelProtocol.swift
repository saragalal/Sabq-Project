//
//  HomeSceneModelProtocol.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

protocol HomeSceneModelProtocol: BaseModelProtocol {
    
    func getHomeMaterialData(compelation: @escaping ((Result<HomeMaterialResponse, Error>) -> Void))
    func getHomeVideosData(compelation: @escaping ((Result<HomeImagesVideoResponse, Error>) -> Void))
    func getHomeImagesData(compelation: @escaping ((Result<HomeImagesVideoResponse, Error>) -> Void))
    
     func getHomeArticlesData(compelation: @escaping ((Result<HomeArticlesResponse, Error>) -> Void)) 
}

//
//  HomeSceneViewProtocol.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

protocol HomeSceneViewProtocol: BaseViewProtocol {
    func addHomeResponse(response: HomeMaterialResponse?)
    func addVideoArray(videos: [Comics?]?)
    func addImagesArray(images: [Comics?]?)
    func addArticleArray(articles: [Materials?]?)
}

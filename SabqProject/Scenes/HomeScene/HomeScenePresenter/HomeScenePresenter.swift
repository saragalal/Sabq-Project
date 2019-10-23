//
//  HomeScenePresenter.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

class HomeScenePresenter: HomeScenePresenterProtocol {

   var view: HomeSceneViewProtocol?
   var model: HomeSceneModelProtocol
   
   required init(view: HomeSceneViewProtocol, model: HomeSceneModelProtocol) {
        self.view = view
        self.model = model
    }
    func viewDidLoad() {
        model.getHomeMaterialData { (result) in
            switch result {
            case .success(let response):
                self.view?.addHomeResponse(response: response)
                self.model.getHomeVideosData(compelation: { (result) in
                    switch result{
                    case .success(let response):
                        self.view?.addVideoArray(videos: response.comics)
                        self.model.getHomeImagesData(compelation: { (result) in
                            switch result {
                            case .success(let response):
                                print(response)
                                self.view?.addImagesArray(images: response.comics)
                                self.model.getHomeArticlesData(compelation: { (result) in
                                    switch result {
                                    case .success(let response):
                                        self.view?.addArticleArray(articles: response.materials)
                                        print(response)
                                    case .failure(let error):
                                        print(error)
                                    }
                                })
                            case .failure(let error):
                                print(error)
                            }

                        })
                    case .failure(let error):
                        print(error)
                    }
                })
            case .failure(let error):
                print(error)
            }
        }
  }
}

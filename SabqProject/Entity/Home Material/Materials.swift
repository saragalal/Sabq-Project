//
//  Material.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
struct Materials : Codable {
    let id : String?
    let title : String?
    let secondaryTitle : String?
    let description : String?
    let publishDate : String?
    let publishDateHijryDate : String?
    let updateDate : String?
    let updateDateHijryDate : String?
    let categoryName : String?
    let parentCategoryName : String?
    let coverPhoto : String?
    let coverPhotoCaption : String?
    let authorName : String?
    let url : String?
    let materialType : String?
    let authorImg : String?
    let authorCity : String?
    let multipleAuthors : Bool?
    let imagesCount : Int?
    let videosCount : Int?
    let noOfLikes : Int?
    let noOfShares : Int?
    let noOfViews : Int?
    let noOfComments : Int?
    let liked : Bool?
    let readLater : Bool?
    let materialUpdated : Bool?
    let isEdit : Bool?
    let hasRelatedMaterials : Bool?
    let authors : [String]?
    let images : [Images]?
    let videos : [Videos]?
    let attachements : [Attachments]?
    let tags : [Tags]?
    let updates : [String]?
    let relatedMaterials : [String]?
    let matarialDisplayed : String?
    let comments : [String]?
    let descriptionString : String?
    let city : String?
    let commentsEnabled : Bool?
    let commentsMinCharacters : Int?
    let commentsMaxCharacters : Int?
    var type : String?
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case secondaryTitle = "secondaryTitle"
        case description = "description"
        case publishDate = "publishDate"
        case publishDateHijryDate = "publishDateHijryDate"
        case updateDate = "updateDate"
        case updateDateHijryDate = "updateDateHijryDate"
        case categoryName = "categoryName"
        case parentCategoryName = "parentCategoryName"
        case coverPhoto = "coverPhoto"
        case coverPhotoCaption = "coverPhotoCaption"
        case authorName = "authorName"
        case url = "url"
        case materialType = "materialType"
        case authorImg = "authorImg"
        case authorCity = "authorCity"
        case multipleAuthors = "multipleAuthors"
        case imagesCount = "imagesCount"
        case videosCount = "videosCount"
        case noOfLikes = "noOfLikes"
        case noOfShares = "noOfShares"
        case noOfViews = "noOfViews"
        case noOfComments = "noOfComments"
        case liked = "liked"
        case readLater = "readLater"
        case materialUpdated = "materialUpdated"
        case isEdit = "isEdit"
        case hasRelatedMaterials = "hasRelatedMaterials"
        case authors = "authors"
        case images = "images"
        case videos = "videos"
        case attachements = "attachements"
        case tags = "tags"
        case updates = "updates"
        case relatedMaterials = "relatedMaterials"
        case matarialDisplayed = "matarialDisplayed"
        case comments = "comments"
        case descriptionString = "descriptionString"
        case city = "city"
        case commentsEnabled = "commentsEnabled"
        case commentsMinCharacters = "commentsMinCharacters"
        case commentsMaxCharacters = "commentsMaxCharacters"
    }
    init(type: String) {
        id = "id"
        title = "title"
        secondaryTitle = "secondaryTitle"
        description = "description"
        publishDate = "publishDate"
        publishDateHijryDate = "publishDateHijryDate"
        updateDate = "updateDate"
        updateDateHijryDate = "updateDateHijryDate"
        categoryName = "categoryName"
        parentCategoryName = "parentCategoryName"
        coverPhoto = "coverPhoto"
        coverPhotoCaption = "coverPhotoCaption"
        authorName = "authorName"
        url = "url"
        materialType = "materialType"
        authorImg = "authorImg"
        authorCity = "authorCity"
        multipleAuthors = false
        imagesCount = 0
        videosCount = 0
        noOfLikes = 0
        noOfShares = 0
        noOfViews = 0
        noOfComments = 0
        liked = false
        readLater = false
        materialUpdated = false
        isEdit = false
        hasRelatedMaterials = false
        authors = [String]()
        images = [Images]()
        videos = [Videos]()
        attachements = [Attachments]()
        tags = [Tags]()
        updates = [String]()
        relatedMaterials = [String]()
        matarialDisplayed = "matarialDisplayed"
        comments = [String]()
        descriptionString = "descriptionString"
        city = "city"
        commentsEnabled = false
        commentsMinCharacters = 0
        commentsMaxCharacters = 0
        self.type = type
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        secondaryTitle = try values.decodeIfPresent(String.self, forKey: .secondaryTitle)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        publishDate = try values.decodeIfPresent(String.self, forKey: .publishDate)
        publishDateHijryDate = try values.decodeIfPresent(String.self, forKey: .publishDateHijryDate)
        updateDate = try values.decodeIfPresent(String.self, forKey: .updateDate)
        updateDateHijryDate = try values.decodeIfPresent(String.self, forKey: .updateDateHijryDate)
        categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
        parentCategoryName = try values.decodeIfPresent(String.self, forKey: .parentCategoryName)
        coverPhoto = try values.decodeIfPresent(String.self, forKey: .coverPhoto)
        coverPhotoCaption = try values.decodeIfPresent(String.self, forKey: .coverPhotoCaption)
        authorName = try values.decodeIfPresent(String.self, forKey: .authorName)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        materialType = try values.decodeIfPresent(String.self, forKey: .materialType)
        authorImg = try values.decodeIfPresent(String.self, forKey: .authorImg)
        authorCity = try values.decodeIfPresent(String.self, forKey: .authorCity)
        multipleAuthors = try values.decodeIfPresent(Bool.self, forKey: .multipleAuthors)
        imagesCount = try values.decodeIfPresent(Int.self, forKey: .imagesCount)
        videosCount = try values.decodeIfPresent(Int.self, forKey: .videosCount)
        noOfLikes = try values.decodeIfPresent(Int.self, forKey: .noOfLikes)
        noOfShares = try values.decodeIfPresent(Int.self, forKey: .noOfShares)
        noOfViews = try values.decodeIfPresent(Int.self, forKey: .noOfViews)
        noOfComments = try values.decodeIfPresent(Int.self, forKey: .noOfComments)
        liked = try values.decodeIfPresent(Bool.self, forKey: .liked)
        readLater = try values.decodeIfPresent(Bool.self, forKey: .readLater)
        materialUpdated = try values.decodeIfPresent(Bool.self, forKey: .materialUpdated)
        isEdit = try values.decodeIfPresent(Bool.self, forKey: .isEdit)
        hasRelatedMaterials = try values.decodeIfPresent(Bool.self, forKey: .hasRelatedMaterials)
        authors = try values.decodeIfPresent([String].self, forKey: .authors)
        images = try values.decodeIfPresent([Images].self, forKey: .images)
        videos = try values.decodeIfPresent([Videos].self, forKey: .videos)
        attachements = try values.decodeIfPresent([Attachments].self, forKey: .attachements)
        tags = try values.decodeIfPresent([Tags].self, forKey: .tags)
        updates = try values.decodeIfPresent([String].self, forKey: .updates)
        relatedMaterials = try values.decodeIfPresent([String].self, forKey: .relatedMaterials)
        matarialDisplayed = try values.decodeIfPresent(String.self, forKey: .matarialDisplayed)
        comments = try values.decodeIfPresent([String].self, forKey: .comments)
        descriptionString = try values.decodeIfPresent(String.self, forKey: .descriptionString)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        commentsEnabled = try values.decodeIfPresent(Bool.self, forKey: .commentsEnabled)
        commentsMinCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMinCharacters)
        commentsMaxCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMaxCharacters)
        type = "news"
    }
    
}

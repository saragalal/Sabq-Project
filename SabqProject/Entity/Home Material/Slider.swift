//
//  Slider.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
struct Slider: Codable {
    let id: String?
    let title: String?
    let secondaryTitle: String?
    let description: String?
    let publishDate: String?
    let publishDateHijryDate: String?
    let updateDate: String?
    let updateDateHijryDate: String?
    let categoryName: String?
    let parentCategoryName: String?
    let coverPhoto: String?
    let coverPhotoCaption: String?
    let authorName: String?
    let url: String?
    let materialType: String?
    let authorImg: String?
    let authorCity: String?
    let multipleAuthors: Bool?
    let imagesCount: Int?
    let videosCount: Int?
    let noOfLikes: Int?
    let noOfShares: Int?
    let noOfViews: Int?
    let noOfComments: Int?
    let liked: Bool?
    let readLater: Bool?
    let materialUpdated: Bool?
    let isEdit: Bool?
    let hasRelatedMaterials: Bool?
    let authors: [String]?
    let images: [Images]?
    let videos: [Videos]?
    let attachements: [String]?
    let tags: [Tags]?
    let updates: [String]?
    let relatedMaterials: [String]?
    let matarialDisplayed: String?
    let comments: [String]?
    let descriptionString: String?
    let city: String?
    let commentsEnabled: Bool?
    let commentsMinCharacters: Int?
    let commentsMaxCharacters: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case secondaryTitle
        case description
        case publishDate
        case publishDateHijryDate
        case updateDate
        case updateDateHijryDate
        case categoryName
        case parentCategoryName
        case coverPhoto
        case coverPhotoCaption
        case authorName
        case url
        case materialType
        case authorImg
        case authorCity
        case multipleAuthors
        case imagesCount
        case videosCount
        case noOfLikes
        case noOfShares
        case noOfViews
        case noOfComments
        case liked
        case readLater
        case materialUpdated
        case isEdit
        case hasRelatedMaterials
        case authors
        case images
        case videos
        case attachements
        case tags
        case updates
        case relatedMaterials
        case matarialDisplayed
        case comments
        case descriptionString
        case city
        case commentsEnabled
        case commentsMinCharacters
        case commentsMaxCharacters
    }
    //    swiftlint:disable function_body_length
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
        attachements = try values.decodeIfPresent([String].self, forKey: .attachements)
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
    }
    
}

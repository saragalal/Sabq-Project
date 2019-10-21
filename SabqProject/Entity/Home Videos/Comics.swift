//
//  Comics.swift
//  SabqProject
//
//  Created by sara.galal on 10/21/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
struct Comics : Codable {
    let id : String?
    let title : String?
    let secondaryTitle : String?
    let description : String?
    let publishDate : String?
    let publishDateHijryDate : String?
    let updateDate : String?
    let updateDateHijryDate : String?
    let coverPhoto : String?
    let coverPhotoCaption : String?
    let authorName : String?
    let authorImg : String?
    let authorCity : String?
    let imagesCount : Int?
    let noOfLikes : Int?
    let noOfShares : Int?
    let noOfViews : Int?
    let noOfComments : Int?
    let liked : Bool?
    let readLater : Bool?
    let isEdit : Bool?
    let url : String?
    let images : [String]?
    let tags : [Tags]?
    let comicsType : String?
    let vid : String?
    let videoCaption : String?
    let comments : [String]?
    let commentsEnabled : Bool?
    let commentsMinCharacters : Int?
    let commentsMaxCharacters : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case secondaryTitle = "secondaryTitle"
        case description = "description"
        case publishDate = "publishDate"
        case publishDateHijryDate = "publishDateHijryDate"
        case updateDate = "updateDate"
        case updateDateHijryDate = "updateDateHijryDate"
        case coverPhoto = "coverPhoto"
        case coverPhotoCaption = "coverPhotoCaption"
        case authorName = "authorName"
        case authorImg = "authorImg"
        case authorCity = "authorCity"
        case imagesCount = "imagesCount"
        case noOfLikes = "noOfLikes"
        case noOfShares = "noOfShares"
        case noOfViews = "noOfViews"
        case noOfComments = "noOfComments"
        case liked = "liked"
        case readLater = "readLater"
        case isEdit = "isEdit"
        case url = "url"
        case images = "images"
        case tags = "tags"
        case comicsType = "comicsType"
        case vid = "vid"
        case videoCaption = "videoCaption"
        case comments = "comments"
        case commentsEnabled = "commentsEnabled"
        case commentsMinCharacters = "commentsMinCharacters"
        case commentsMaxCharacters = "commentsMaxCharacters"
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
        coverPhoto = try values.decodeIfPresent(String.self, forKey: .coverPhoto)
        coverPhotoCaption = try values.decodeIfPresent(String.self, forKey: .coverPhotoCaption)
        authorName = try values.decodeIfPresent(String.self, forKey: .authorName)
        authorImg = try values.decodeIfPresent(String.self, forKey: .authorImg)
        authorCity = try values.decodeIfPresent(String.self, forKey: .authorCity)
        imagesCount = try values.decodeIfPresent(Int.self, forKey: .imagesCount)
        noOfLikes = try values.decodeIfPresent(Int.self, forKey: .noOfLikes)
        noOfShares = try values.decodeIfPresent(Int.self, forKey: .noOfShares)
        noOfViews = try values.decodeIfPresent(Int.self, forKey: .noOfViews)
        noOfComments = try values.decodeIfPresent(Int.self, forKey: .noOfComments)
        liked = try values.decodeIfPresent(Bool.self, forKey: .liked)
        readLater = try values.decodeIfPresent(Bool.self, forKey: .readLater)
        isEdit = try values.decodeIfPresent(Bool.self, forKey: .isEdit)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        images = try values.decodeIfPresent([String].self, forKey: .images)
        tags = try values.decodeIfPresent([Tags].self, forKey: .tags)
        comicsType = try values.decodeIfPresent(String.self, forKey: .comicsType)
        vid = try values.decodeIfPresent(String.self, forKey: .vid)
        videoCaption = try values.decodeIfPresent(String.self, forKey: .videoCaption)
        comments = try values.decodeIfPresent([String].self, forKey: .comments)
        commentsEnabled = try values.decodeIfPresent(Bool.self, forKey: .commentsEnabled)
        commentsMinCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMinCharacters)
        commentsMaxCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMaxCharacters)
    }
    
}

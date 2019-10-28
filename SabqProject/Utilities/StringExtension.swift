//
//  StringExtension.swift
//  SabqProject
//
//  Created by sara.galal on 10/21/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
return try NSAttributedString(data: data,
                              options: [.documentType: NSAttributedString.DocumentType.html,
                                        .characterEncoding: String.Encoding.utf8.rawValue],
                              documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    /// Returns a date from a string in MMMM dd, yyyy. Will return today's date if input is invalid.
    var asDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm ss"
        return formatter.date(from: self) ?? Date()
    }
    
   //Static String
   static func newsTableCellIdentifier() -> String {
        return "HomeTableViewCell"
    }
   static func sliderTableCellIdentifier() -> String {
        return "SliderTableViewCell"
    }
   static func videoTableCellIdentifier() -> String {
        return "HomeVideoTableViewCell"
    }
   static func imageTableCellIdentifier() -> String {
        return "ImagesTableViewCell"
    }
    static func articleTableCellIdentifier() -> String {
        return "ArticleTableViewCell"
    }
   static func sliderViewSection() -> String {
        return "HomeFirstSectionViewController"
    }
   static func videoCollectionCellIdentifier() -> String {
        return "HomeVideosCollectionViewCell"
    }
   static func imageCollectionCellIdentifier() -> String {
        return "ImagesCollectionViewCell"
    }
   static func articleCollectionCellIdentifier() -> String {
        return "ArticlesCollectionViewCell"
    }
   static func news() -> String {
        return "news"
    }
   static func videos() -> String {
           return "video"
       }
   static func articles() -> String {
           return "article"
       }
   static func images() -> String {
        return "image"
    }
   static func slider() -> String {
        return "slider"
    }
   static func materials() -> String {
           return "materials"
       }
}

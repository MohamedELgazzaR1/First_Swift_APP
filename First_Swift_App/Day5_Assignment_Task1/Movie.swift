//
//  Friend.swift
//  Day5_Assignment_Task1
//
//  Created by Mohamed Elgazzar on 2/15/22.
//  Copyright © 2022 Mohamed Elgazzar. All rights reserved.
//

import Foundation


class Movie {
    
  var  title : String
  var  rating : Float
  var releaseYear : Int
  var  image : String
  var  genre : [String]
    
    init(title : String , rating : Float , releaseYear : Int , image : String ,genre : [String]) {
        self.title = title
        self.rating = rating
        self.releaseYear = releaseYear
        self.image = image
        self.genre = genre
        }
    
}

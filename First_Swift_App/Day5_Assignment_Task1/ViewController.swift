//
//  ViewController.swift
//  Day5_Assignment_Task1
//
//  Created by Mohamed Elgazzar on 2/15/22.
//  Copyright © 2022 Mohamed Elgazzar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myRating: UILabel!
    
    @IBOutlet weak var myReleaseYear: UILabel!
    @IBOutlet weak var myImage: UILabel!
    @IBOutlet weak var myGenre: UILabel!
    var movie : Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTitle.text = movie?.title
        self.myRating.text = "\(movie.rating)"
        self.myReleaseYear.text = "\(movie.releaseYear)"
        self.myImage.text = movie?.image
        var str : String = ""
        for i in 0...(movie?.genre.count)!-1 {
            str += (movie?.genre[i])!
            str += " "
        }
        
        self.myGenre.text = str
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
          self.myTitle.text = movie?.title
          self.myRating.text = "\(movie.rating)"
          self.myReleaseYear.text = "\(movie.releaseYear)"
          self.myImage.text = movie?.image
         
        var str : String = ""
        for i in 0...(movie?.genre.count)!-1 {
            str += (movie?.genre[i])!
            str += " "
        }
        
        self.myGenre.text = str
       
          
    }

}


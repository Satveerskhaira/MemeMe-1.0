//
//  Meme.swift
//  MemeMe 1.0
//
//  Created by Satveer Singh on 6/12/17.
//  Copyright © 2017 Satveer Singh. All rights reserved.
//

import Foundation
import UIKit
struct Meme {
    let topText:String
    let bottomText: String
    let oldImage: UIImage
    let memeImage :UIImage
    
    init(topText: String, bottomText: String, oldImage: UIImage, memeImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.oldImage = oldImage
        self.memeImage = memeImage
    }
}

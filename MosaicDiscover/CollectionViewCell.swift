//
//  CollectionViewCell.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/20/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    public func setupCell(_ imageUrl: String, _ caption: String) {
        self.backgroundColor = UIColor(colorLiteralRed: Float(arc4random() % 100) / 100.0,
                                       green: Float(arc4random() % 100) / 100.0,
                                       blue: Float(arc4random() % 100) / 100.0,
                                       alpha: 1)
        
        captionLabel.text = caption
        imageView.sd_setImage(with: URL(string: imageUrl)) {
            [weak self] (image: UIImage?, error: Error?, type: SDImageCacheType, url: URL?) in
            guard let strongSelf = self else { return }
            
            if error == nil {
                strongSelf.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
}

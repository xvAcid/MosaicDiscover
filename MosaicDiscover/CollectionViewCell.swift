//
//  CollectionViewCell.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/20/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = getRandomColorBackground()
    }
    
    public func fill(model: ImageModel) {
        captionLabel.text = model.caption
        
        guard let data = model.data else { return }
        imageView.image = UIImage(data: data)
        backgroundColor = UIColor.white
    }
    
    override func prepareForReuse() {
        captionLabel.text   = ""
        imageView.image     = nil
        backgroundColor     = getRandomColorBackground()
    }
    
    private func getRandomColorBackground() -> UIColor {
        return UIColor(red: CGFloat(arc4random() % 100) / 100.0,
                       green: CGFloat(arc4random() % 100) / 100.0,
                       blue: CGFloat(arc4random() % 100) / 100.0,
                       alpha: 1)
    }
}

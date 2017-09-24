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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(colorLiteralRed: Float(arc4random() % 100) / 100.0,
                                       green: Float(arc4random() % 100) / 100.0,
                                       blue: Float(arc4random() % 100) / 100.0,
                                       alpha: 1)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateImageData),
                                               name: NSNotification.Name(rawValue: "cell:updateImageData"),
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func setupCell(_ index: Int, _ viewModel: MainViewModel?) {
        let (caption, data) = (viewModel?.getData(by: index))!
        
        captionLabel.text = caption
        if data != nil {
            imageView.image = UIImage(data: data!)
            backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    public func updateImageData(notification: Notification) {
        let data = notification.object as? (String, Data)
        if data != nil && data?.0 == captionLabel.text {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.imageView.image = UIImage(data: (data?.1)!)
                strongSelf.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
}

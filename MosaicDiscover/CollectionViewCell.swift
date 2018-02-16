//
//  CollectionViewCell.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/20/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    private var disposable: Disposable? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = getRandomColorBackground()
    }
    
    public func fill(model: ImageModel) {
        captionLabel.text = model.caption
    
        disposable = model.data.asObservable().observeOn(MainScheduler.instance).subscribe(onNext: { data in
            guard let data = data else { return }
            self.backgroundColor = UIColor.white
            if model.firstLoaded {
                model.firstLoaded       = false
                let animation           = CABasicAnimation(keyPath: "opacity")
                animation.fromValue     = 0.0
                animation.toValue       = 1.0
                animation.duration      = 0.1 + Double(arc4random() % 20) / 20.0
                self.imageView.image    = UIImage(data: data)
                self.imageView.layer.add(animation, forKey: nil)
            } else {
                self.imageView.image = UIImage(data: data)
            }
        }, onError: { error in
            self.imageView.image = nil
            self.backgroundColor = self.getRandomColorBackground()
        })
    }
    
    override func prepareForReuse() {
        captionLabel.text   = ""
        imageView.image     = nil
        backgroundColor     = getRandomColorBackground()
        disposable?.dispose()
    }
    
    private func getRandomColorBackground() -> UIColor {
        return UIColor(red: CGFloat(arc4random() % 100) / 100.0,
                       green: CGFloat(arc4random() % 100) / 100.0,
                       blue: CGFloat(arc4random() % 100) / 100.0,
                       alpha: 1)
    }
}

//
//  ViewController.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/20/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mosaicLayout: TRMosaicLayout!
    
    fileprivate let model = MainModel.init("http://lorempixel.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mosaicLayout.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - TRMosaicLayoutDelegate
extension MainViewController : TRMosaicLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:IndexPath) -> TRMosaicCellType {
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView:UICollectionView,
                        layout collectionViewLayout: TRMosaicLayout,
                        insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return UIScreen.main.bounds.height / 5.0
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.getCaptionDataCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionLayoutCell", for: indexPath) as! CollectionViewCell
        let (loadUrl, loadCaption) = self.model.getLoadData(indexPath.row)
        cell.setupCell(loadUrl, loadCaption)
        return cell
    }
}


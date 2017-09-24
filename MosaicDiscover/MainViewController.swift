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

    fileprivate var viewModel: MainViewModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mosaicLayout.delegate = self
        self.viewModel = MainViewModel()
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
        let offset: CGFloat = 1
        return UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset)
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
        return (self.viewModel?.getImageCount())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionLayoutCell", for: indexPath) as! CollectionViewCell
         cell.setupCell(indexPath.row, self.viewModel)
        return cell
    }
}


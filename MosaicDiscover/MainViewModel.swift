//
//  MainViewModel.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/24/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import Foundation

class MainViewModel: NSObject {
    fileprivate var model: MainModel? = nil
    fileprivate var imageContainer = [String: Data?]()
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loadedImageData),
                                               name: NSNotification.Name(rawValue: "mainViewModel:loadedData"),
                                               object: nil)

        model = MainModel("http://lorempixel.com/")
        model?.loadDataFromServer()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    func getImageCount() -> Int {
        return (model?.getImageCount())!
    }
    
    func getData(by index: Int) -> (String, Data?) {
        let caption = (model?.getImageCaption(by: index))!
        let data    = self.imageContainer[caption]
        if data != nil {
            return (caption, data!)
        }
        return (caption, nil)
    }

    func loadedImageData(notification: Notification) {
        let (caption, data) = (notification.object as? (String, Data))!
        self.imageContainer[caption] = data
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cell:updateImageData"),
                                        object: (caption, data))
    }
}

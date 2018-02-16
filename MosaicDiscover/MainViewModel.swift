//
//  MainViewModel.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/24/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel: NSObject {
    var dataImages      = Variable<[ImageModel]>([])
    private let queue   = OperationQueue()
    private let model   = MainModel()
    
    func obtainData() {
        model.createCaptions()
        queue.maxConcurrentOperationCount = 3
        
        for caption in model.captions {
            let model = ImageModel()
            model.caption = caption
            dataImages.value.append(model)
            
            let randWidth       = 150 + arc4random() % 350
            let randHeight      = 150 + arc4random() % 350
            let loadServerUrl   = "http://placekitten.com/\(randWidth)/\(randHeight)"
            
            let operation = BlockOperation(block: {
                model.data.value = try? Data(contentsOf: URL(string: loadServerUrl)!)
                if model.data.value == nil {
                }
            })
            
            queue.addOperation(operation)
        }
    }
    
    deinit {
        queue.cancelAllOperations()
    }
}

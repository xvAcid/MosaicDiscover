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
    var dataImages = Variable<[ImageModel]>([])
    let disposeBag = DisposeBag()
    
    private let model = MainModel()

    override init() {
        super.init()
    }
    
    func obtainData() {
        let url = URL(string: "http://lorempixel.com/")
        model.createCaptions()
        
        let observable = loadingData(url: url!)
        
        observable.subscribe(onNext: { [weak self] data in
            self?.dataImages.value.append(data)
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    private func loadingData(url: URL) -> Observable<ImageModel> {
        return Observable.create({ [weak self] observer -> Disposable in
            guard let `self` = self else { return Disposables.create() }

            for caption in self.model.captions {
                let randWidth       = 150 + arc4random() % 300
                let randHeight      = 150 + arc4random() % 300
                let loadServerUrl   = url.absoluteString + "/\(randWidth)/\(randHeight)"
                print("starting loading \(loadServerUrl)")
                do {
                    let data        = ImageModel()
                    data.caption    = caption
                    data.data       = try Data(contentsOf: URL(string: loadServerUrl)!)
                    observer.onNext(data)
                    print("loaded success \(loadServerUrl)")
                } catch let error {
                    observer.onError(error)
                }
            }
            
            observer.onCompleted()
            return Disposables.create()
        }).share(replay: 0, scope: .forever)
    }
}

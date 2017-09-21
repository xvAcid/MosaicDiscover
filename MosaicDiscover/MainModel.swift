//
//  MainModel.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/20/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import Foundation

class MainModel: NSObject {
    private var serverUrl: String?
    private var captionData : Array<String> = []

    init(_ serverUrl: String?) {
        self.serverUrl = serverUrl
        self.captionData = [
            "Tree Of The Sea",
            "Hero Of The Ancestors",
            "Witches Of The Gods",
            "Turtles Without Shame",
            "Invaders And Traitors",
            "Turtles And Rats",
            "Source Without A Conscience",
            "Inception Of The Forsaken",
            "Helping Technology",
            "Prepare For My Husband",
            "Agent With Honor",
            "Foe Of Earth",
            "Serpents Of Fortune",
            "Foes Of The Light",
            "Vultures And Men",
            "Soldiers And Lions",
            "Future Of The Sea",
            "Annihilation Of Fortune",
            "Escaping My Future",
            "Temptations In The Shadows",
            "Witch With Strength",
            "Raven Of Reality",
            "Swindlers Of Fire",
            "Creators Of The Void",
            "Creators And Butchers",
            "Vultures And Rats",
            "Staff Of The Stars",
            "Surprise Of Yesterday",
            "Guarded By My Dreams",
            "Begging In The City"
        ]
    }
    
    public func getCaptionDataCount() -> Int {
        return self.captionData.count
    }
    
    public func getLoadData(_ index: Int) -> (String, String) {
        let randWidth       = 200 + arc4random() % 250
        let randHeight      = 200 + arc4random() % 200
        let loadServerUrl   = self.serverUrl! + "/" + String(randWidth) + "/" + String(randHeight)
        let result = (loadServerUrl, self.captionData[index])
        return result
    }
}

//
//  MainModel.swift
//  MosaicDiscover
//
//  Created by xvAcid on 9/20/17.
//  Copyright © 2017 WSG4FUN. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ImageModel {
    var caption = ""
    var data = Variable<Data?>(nil)
    var firstLoaded = true
}

class MainModel: NSObject {
    var captions : Array<String> = []
    
    func createCaptions() {
        captions = [
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
            "Begging In The City",
            "In The City",
            "Raven Of",
            "Future Of Lions"]
    }
}

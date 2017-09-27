//
//  Bug.swift
//  tableView
//
//  Created by kaori hirata on 2017-09-26.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit
struct Bugs {
    var name:String
    var bugArray = [ScaryBug]()
}
struct SetBugs {
    static func notScarySet() -> Bugs{
        var notScarybugs = [ScaryBug]()
        notScarybugs.append(ScaryBug(withName: "Ladybug", imageName: "ladybug.jpg", howScary: .NotScary))
        notScarybugs.append(ScaryBug(withName: "Caterpillar", imageName: "caterpillar.jpg", howScary: .NotScary))
        notScarybugs.append(ScaryBug(withName: "Fly", imageName: "fly.jpg", howScary: .NotScary))
        notScarybugs.append(ScaryBug(withName: "Fly", imageName: "fly.jpg", howScary: .NotScary))
        notScarybugs.append(ScaryBug(withName: "Fly", imageName: "fly.jpg", howScary: .NotScary))
        notScarybugs.append(ScaryBug(withName: "Fly", imageName: "fly.jpg", howScary: .NotScary))
        let notScaryBugs = Bugs(name:"notScaryBugs",bugArray: notScarybugs)
        return notScaryBugs
    }
    
    static func alittleScarySet() -> Bugs{
        var alittlebugs = [ScaryBug]()
        alittlebugs.append(ScaryBug(withName: "Beetle", imageName: "beetle.jpg", howScary: .ALittleScary))
        alittlebugs.append(ScaryBug(withName: "Stink Bug", imageName: "stinkbug.jpg", howScary: .ALittleScary))
        alittlebugs.append(ScaryBug(withName: "Stink Bug", imageName: "stinkbug.jpg", howScary: .ALittleScary))
        let alittleBugs = Bugs(name:"AlittleBugs",bugArray: alittlebugs)
        return alittleBugs
    }

    
    static func averageScarySet() -> Bugs {
        var averageScarybugs = [ScaryBug]()
        averageScarybugs.append(ScaryBug(withName: "Centipede", imageName: "centipede.jpg", howScary: .AverageScary))
        averageScarybugs.append(ScaryBug(withName: "Cicada", imageName: "cicada.jpg", howScary: .AverageScary))
        averageScarybugs.append(ScaryBug(withName: "Giant Moth", imageName: "giantMoth.jpg", howScary: .AverageScary))
        averageScarybugs.append(ScaryBug(withName: "Shield Bug", imageName: "shieldBug.jpg", howScary: .AverageScary))
        averageScarybugs.append(ScaryBug(withName: "Stag Beetle", imageName: "stagBeetle.jpg", howScary: .AverageScary))
        averageScarybugs.append(ScaryBug(withName: "Stink Bug", imageName: "stinkbug.jpg", howScary: .ALittleScary))
        let averageScaryBugs = Bugs(name: "AverageScarybugs", bugArray: averageScarybugs)
        return averageScaryBugs
    }
    
    static func scaryBugSet() -> [Bugs] {
        // because of static function ,dosent need instace
        return [notScarySet(), alittleScarySet(),averageScarySet()]
    }
}

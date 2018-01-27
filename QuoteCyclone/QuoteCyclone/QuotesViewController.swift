//
//  QuotesViewController.swift
//  QuoteCyclone
//
//  Created by Alexander on 2017-09-04.
//  Copyright © 2017 Alexander Sundiev. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension QuotesViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> QuotesViewController {
        //1. Get a reference to Main.storyboard
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        //2. Create a Scene identifier that matches the one you set before
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "QuotesViewController")
        //3. Instantiate QuotesViewController and return it
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}

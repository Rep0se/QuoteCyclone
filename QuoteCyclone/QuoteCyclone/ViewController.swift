//
//  ViewController.swift
//  QuoteCyclone
//
//  Created by Alexander on 2017-09-02.
//  Copyright © 2017 Alexander Sundiev. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    //Arrays & Dictionaries Declaration
    var quotesArray: [String] = []
    
    //Outlets
    
    @IBOutlet var quoteLabel: NSTextField!
    @IBOutlet weak var versionLabel: NSTextField!
    
    //Actions
    @IBAction func refresh(_ sender: Any) {
        outputQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSApp.activate(ignoringOtherApps: true)     //brings app to Front
        
        versionLabel.stringValue = version()
        
        outputQuote()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func showHide(_ sender: Any?) {
        if NSApp.isHidden{
            NSApp.unhide(nil)
            NSApp.activate(ignoringOtherApps: true)
        } else {
            NSApp.hide(nil)
        }
    }

    @objc func outputQuote(){
        //Read Quotes File
        quotesArray = arrayFromContentsOfFileWithName(fileName: "QuotesFile")!
        
        //Generate Random Number for Array Index from Total Array Cells
        let randomNumberQ = Int(arc4random_uniform(UInt32(quotesArray.count)))
        
        //Write Quote to Label
        quoteLabel.stringValue = quotesArray[randomNumberQ]

    }
    
    func arrayFromContentsOfFileWithName(fileName: String) -> [String]? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else {
            return nil
        }
        
        do {
            let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
            return content.components(separatedBy: "\n\n")
        } catch _ as NSError {
            return nil
        }
    }
    
    func version() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "Version: \(version) Build: \(build)"
    }

}

class CustomWindow: NSWindow {
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing bufferingType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: bufferingType, defer: flag)
        
        // Set the opaque value off,remove shadows and fill the window with clear (transparent)

        self.isOpaque = false
        self.hasShadow = false                  // Checkmark at attributes inspector overides this (causes residual text from shadow when window is transparent)
        self.backgroundColor = NSColor.clear // NSColor.clear
        self.backgroundColor = NSColor.init(calibratedHue: 0, saturation: 0, brightness: 0, alpha: 0.4)
    
        
        /*// Change the title bar appereance
        self.title = ""
        self.titleVisibility = .hidden
        self.titlebarAppearsTransparent = true
        //self.styleMask.insert(.fullSizeContentView)       //Control buttons without Title Bar
        */
        
        // Move window by background
        self.isMovableByWindowBackground  = true
    }
    
}
/* // Sublass of imageview to enable window dragging
class movableImageView: NSImageView {
    
    override var mouseDownCanMoveWindow:Bool {
        return true
    }
    
}
*/

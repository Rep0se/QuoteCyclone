//
//  AppDelegate.swift
//  QuoteCyclone
//
//  Created by Alexander on 2017-09-02.
//  Copyright © 2017 Alexander Sundiev. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    //creates a Status Item (aka application icon) in the menu bar with a fixed length
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    //let popover = NSPopover()
    //var eventMonitor: EventMonitor?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage-32"))
            //button.action = #selector(printQuote(_:))   // when user clicks menubar icon
        }
        
        //configure the status item with an icon of the image and an action for when you click on the item
        constructMenu()
        
        /*// code for menubar item popover
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage-32"))
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = QuotesViewController.freshController()
 
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            if let strongSelf = self, strongSelf.popover.isShown {
                strongSelf.closePopover(sender: event)
            }
        }
         */
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // print out the quote text to the console
    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
    
    @objc func showHide(_ sender: Any?) {
        if NSApp.isHidden{
            NSApp.unhide(nil)
            NSApp.activate(ignoringOtherApps: true)
        } else {
            NSApp.hide(nil)
        }
    }
    
    // create menubar menu
    func constructMenu() {
        let menu = NSMenu()
        
        // keyEquivalent is a keyboard shortcut and only works if the application is front-most and active. Lowercase letter uses Cmd as the modifier key and an uppercase letter uses Cmd+Shift
        //menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem(title: "Show/Hide", action: #selector(AppDelegate.showHide(_:)), keyEquivalent: "h"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    /*
    // togglePopover() is the action method that will either open or close the popover depending on its current state
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    // displays the popover to the user. You just need to supply a source rect and macOS will position the popover and arrow so it looks like it’s coming out of the menu bar icon
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
         eventMonitor?.start()
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
     eventMonitor?.stop()
    }
    */
}


//
//  AppDelegate.swift
//  EasyScreenshot
//
//  Created by Bolaji Olajide on 18/01/2025.
//

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusBarItem = NSStatusBar.system
            .statusItem(withLength: NSStatusItem.squareLength)
        
        if let statusBarItem = statusBarItem?.button {
            statusBarItem.image = NSImage(systemSymbolName: "cursorarrow.rays", accessibilityDescription: nil)
        }
        
        let mainMenu = NSMenu()
        statusBarItem?.menu = mainMenu
        
        let itemSelectArea = NSMenuItem(title: "Select an area", action: #selector(self.actionSelectArea(_:)), keyEquivalent: "")
        itemSelectArea.target = self
        itemSelectArea.image = NSImage(systemSymbolName: "rectangle.dashed", accessibilityDescription: nil)
        mainMenu.addItem(itemSelectArea)
        
        let itemCaptureEntireScreen = NSMenuItem(title: "Capture entire screen", action: #selector(self.actionCaptureEntireScreen(_:)), keyEquivalent: "")
        itemCaptureEntireScreen.target = self
        itemCaptureEntireScreen.image = NSImage(systemSymbolName: "macwindow.on.rectangle", accessibilityDescription: nil)
        mainMenu.addItem(itemCaptureEntireScreen)
        
        let itemCaptureWindow = NSMenuItem(title: "Capture a window", action: #selector(self.actionCaptureWindow(_:)), keyEquivalent: "")
        itemCaptureWindow.target = self
        itemCaptureWindow.image = NSImage(systemSymbolName: "macwindow", accessibilityDescription: nil)
        mainMenu.addItem(itemCaptureWindow)
        
        mainMenu.addItem(.separator())
        
        let itemQuit = NSMenuItem(title: "Quit completely", action: #selector(self.actionExitApp(_:)), keyEquivalent: "")
        itemQuit.target = self
        mainMenu.addItem(itemQuit)
    }
    
    @objc private func actionExitApp(_ sender: Any?) {
        NSApp.terminate(self)
    }
    
    @objc private func actionSelectArea(_ sender: Any?) {
        ScreenCaptureUtil.capture(mode: .AreaSelection)
    }
    
    @objc private func actionCaptureEntireScreen(_ sender: Any?) {
        ScreenCaptureUtil.capture(mode: .EntireScreen)
    }
    
    @objc private func actionCaptureWindow(_ sender: Any?) {
        ScreenCaptureUtil.capture(mode: .WindowSelection)
    }
}

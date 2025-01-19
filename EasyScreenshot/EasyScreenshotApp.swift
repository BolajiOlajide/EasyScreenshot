//
//  EasyScreenshotApp.swift
//  EasyScreenshot
//
//  Created by Bolaji Olajide on 18/01/2025.
//

import SwiftUI

@main
struct EasyScreenshotApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

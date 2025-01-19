//
//  ScreenCaptureUtil.swift
//  EasyScreenshot
//
//  Created by Bolaji Olajide on 19/01/2025.
//

import Foundation

enum ScreenCaptureMode {
    case EntireScreen
    case WindowSelection
    case AreaSelection
}

class ScreenCaptureUtil {
    static func capture(mode: ScreenCaptureMode) {
        let task = Process()
        
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
    
        switch mode {
        case .EntireScreen:
            task.arguments = ["-cm"]
        case .WindowSelection:
            task.arguments = ["-cw"]
        case .AreaSelection:
            task.arguments = ["-cs"]
        }
        
        do {
            try task.run()
            task.waitUntilExit()
        } catch {
            print("Failed to launch process: \(error)")
        }
    }
}

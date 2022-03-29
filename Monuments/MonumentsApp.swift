//
//  MonumentsApp.swift
//  Monuments
//
//  Created by Arnau Rivas Rivas on 18/3/22.
//

import SwiftUI
import GoogleMaps

@main
struct MonumentsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey(googleMapsAPI)
        return true
    }
}

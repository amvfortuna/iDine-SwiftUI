//
//  iDineApp.swift
//  iDine
//
//  Created by Anna Maria Fortuna on 2/03/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}

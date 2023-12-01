//
//  OnboardingViewModel.swift
//  RabbitHole
//
//  Created by Anthony Nasser on 2/19/23.
//

import Foundation
import Combine
import SwiftUI
import RevenueCat

class OnboardingViewModel : ObservableObject {
    @Published var chosenHops: [String] = []
    @Published var isSubscriptionActive = false
    @Published var currentScreen: String = "screen1"
    
    @Published var demoInput: String = ""
    @Published var paywallLoading: Bool = false
    
    init() {
        self.chosenHops = Array(repeating: "", count: 100)
        currentScreen = "screen1"
//        getSubscriptionStatus()
    }
    
    func addHopToChoosenHops(hop: String) -> Void {
        chosenHops.append(hop)
    }
    
    func switchScreen(to: String) {
        withAnimation { self.currentScreen = to }
        print(self.currentScreen)
    }
    
    func getSubscriptionStatus() {
        Purchases.shared.getCustomerInfo { (customerInfo, error) in
            self.isSubscriptionActive = customerInfo?.entitlements.all["pro"]?.isActive == true
        }
    }
}

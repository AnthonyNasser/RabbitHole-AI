//
//  ContentView.swift
//  RabbitHole
//
//  Created by Anthony Nasser on 2/18/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @AppStorage("onboarded") var onboarded: Bool = false
    
    @StateObject var sVM: SettingsViewModel = SettingsViewModel()
    @StateObject var oVM: OnboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        if (onboarded) {
            HomeView()
                .environmentObject(self.sVM)
        } else {
            OnboardingCore()
                .environmentObject(self.sVM)
                .environmentObject(self.oVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

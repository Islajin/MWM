//
//  ContentView.swift
//  MWM
//
//  Created by yeonjin on 4/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var loginSuccess: Bool = false
    
    var body: some View {    
        if loginSuccess {
            HomeView()}
        else {
            LoginView(loginSuccess : $loginSuccess)
        }
    }
}

#Preview {
    ContentView()
}

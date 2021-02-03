//
//  MoviesApp.swift
//  Shared
//
//  Created by judongseok on 2021/02/02.
//

import SwiftUI
@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(_movie: _movies, _genre: _genres)
        }
    }
}

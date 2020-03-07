//
//  ContentView.swift
//  Referencer
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    var game: VideoGame
    var body: some View {
        DetailView(game: game)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(game: VideoGame(title: "Minecraft", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93))
    }
}

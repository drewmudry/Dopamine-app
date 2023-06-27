//
//  ContentView.swift
//  dopamine
//
//  Created by Drew on 6/26/23.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AVKit

struct ContentView: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "gameplay", withExtension: "mp4")!)
        @State var isPlaying: Bool = false

    
    var body: some View {
        NavigationSplitView {
            List {
                Image("ic_home_selected")

            }
            .navigationSplitViewColumnWidth(70)
            .navigationTitle("g")
        } detail: {
            VStack {
                VideoPlayer(player: player)
                    .frame(width: 406, height: 720, alignment: .center)
                
                Button {
                    isPlaying ? player.pause() : player.play()
                        //player.isMuted=true
                        
                    isPlaying.toggle()
                    player.seek(to: .zero)
                    //player.volume=0.0
                } label: {
                    Image(systemName: isPlaying ? "stop" : "play")
                        .padding()
                }
            }
        } .frame(width:406)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  swiftui-marathon-3-skip-song
//
//  Created by Vladislav Shakhray on 05/10/2023.
//

import SwiftUI

struct Skipper: View {
    var shouldAnimate = false
    
    var body: some View {
        HStack(spacing: 0.0) {
            Image(systemName: "arrowtriangle.right.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: shouldAnimate ? 20.0 : 0.0)
            Image(systemName: "arrowtriangle.right.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 20.0)
            Image(systemName: "arrowtriangle.right.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: shouldAnimate ? 0.0 : 20.0)
        }
        .frame(maxWidth: 40.0)
        .animation(.bouncy(duration: 0.4, extraBounce: 0.2), value: shouldAnimate)
    }
}

struct ContentView: View {
    @State var shouldAnimate = false
    @State private var viewID = 0
    
    var body: some View {
        Button {
            viewID += 1
            shouldAnimate = false
            withAnimation {
                shouldAnimate = true
            }
        } label: {
            Skipper(shouldAnimate: shouldAnimate)
                .id(viewID)
        }
    }
}

#Preview {
    ContentView()
}

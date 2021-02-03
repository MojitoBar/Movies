//
//  ContentView.swift
//  Shared
//
//  Created by judongseok on 2021/02/02.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.4)
                .foregroundColor(Color.white)
            Circle()
                // 차있는 정도
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270))
        }
    }
}

struct ContentView: View {
    @State private var progress: Float = 0
    @State private var showMainView = false
    var _movie: [movies]
    var _genre: [Genres]
    var body: some View {
        if showMainView{
            NextView(_movies: _movie, _genres: _genre, rating: 4)
        }
        else{
            ZStack{
                Rectangle()
                    .ignoresSafeArea(.all)
                HStack{
                    Text("M")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 50, design: .rounded))
                    
                    ProgressBar(progress: self.$progress)
                        .frame(width: 30)
                    Text("VIES")
                        .foregroundColor(.white)
                        .font(.system(size: 50, design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            .onAppear(){
                withAnimation(.linear(duration: 2)){
                    for i in stride(from: 0, to: 1, by: 0.1){
                        progress = Float(i)
                    }
                }
                withAnimation(Animation.linear(duration: 0.75).delay(2)){
                    showMainView = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(_movie: _movies, _genre: _genres)
    }
}

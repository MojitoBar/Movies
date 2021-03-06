import SwiftUI
import Combine

func get_genre(gen_ids: [Int], _genres: [Genres]) -> some View{
    ForEach (_genres, id: \.self){ item in
        if(gen_ids.contains(item.id)){
            Text(item.name)
                .padding(.horizontal, 15)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .foregroundColor(Color.gray)
                .font(Font.custom("RobotoCondensed-Light", size: 15))
        }
    }
}

struct NextView: View {
    @State private var selectedItem = 0
    
    var _movies: [movies]
    var _genres: [Genres]
    
    
    var rating: Int
    var offImage = "star"
    var onImage = "star.fill"
    
    
    var body: some View {
        HStack{
            TabView(selection: $selectedItem){
                ForEach (0..<_movies.count) { i in
                    ZStack{
                        VStack{
                            Image(_movies[i].poster_path)
                                .resizable()
                                .frame(width: 460, height: 700)
                                .ignoresSafeArea(.all)
                                .blur(radius: 10)
                                .padding(-10)
                            Spacer()
                        }
                        HStack{
                            ZStack{
                                Image(_movies[i].poster_path)
                                    .resizable()
                                    .frame(width: 260, height: 440)
                                    .cornerRadius(20)
                                    .padding(.top, -200)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.white ,lineWidth: 40)
                                            .frame(width: 300, height: 480)
                                            .padding(.top, -200)
                                    )
                                Text(_movies[i].title)
                                    .font(Font.custom("RobotoCondensed-Bold", size: 30))
                                    .frame(width: 340)
                                    .padding(.vertical, 25)
                                    .background(Color.white)
                                    .offset(y: 140)
                                HStack{
                                    get_genre(gen_ids: _movies[i].genre_ids, _genres: _genres)
                                        .offset(y: 180)
                                }
                                
                                HStack{
                                    Text(String(_movies[i].vote_average))
                                        .offset(y: 1)
                                        .padding(.trailing, 10)
                                    ForEach(1..<6){ number in
                                        Image(systemName: number < Int(_movies[i].vote_average) / 2 + 1 ? self.onImage : self.offImage)
                                            .resizable()
                                            .frame(width: 15, height: 15)
                                    }
                                }
                                .padding(.top, 430)
                                .font(Font.custom("RobotoCondensed-Light", size: 18))
                            }
                        }
                        
                        
                        modalView(i: i, _movie: _movies, _genre: _genres)
                    }.tag(i)
                    .frame(height: 1100)
                }
            }
            .onAppear(perform: {
                UIScrollView.appearance().bounces = false
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView(_movies: _movies, _genres: _genres, rating: 4)
    }
}

struct modalView: View {
    @State private var showModal = false
    var i: Int
    var _movie: [movies]
    var _genre: [Genres]
    var body: some View{
        
        Button(action: {
            showModal = true
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.black)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 50)
                Text("More...")
                    .font(Font.custom("RobotoCondensed-Light", size: 25))
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
            }
        }
        .offset(y: 300)
        
        HalfModalView(isShown: $showModal, modalHeight: 800) {
            VStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 90, height: 6)
                    .opacity(0.8)
                HStack{
                    Image(_movie[i].poster_path)
                        .resizable()
                        .frame(width: 150, height: 230)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                    
                    VStack(alignment: .leading){
                        Text("Title")
                            .font(Font.custom("RobotoCondensed-Regular", size: 35))
                        Text(_movie[i].title)
                            .font(Font.custom("RobotoCondensed-Light", size: 25))
                            .frame(width: 200, height: 60, alignment: .leading)
                            .padding(.bottom, 5)
                        Text("Genres")
                            .font(Font.custom("RobotoCondensed-Regular", size: 25))
                        VStack(alignment: .leading){
                            get_genre(gen_ids: _movie[i].genre_ids, _genres: _genre)
                                .padding(.top, 0.1)
                        }
                    }
                }
                .padding(.top, 20)
                Text(_movie[i].overview)
                    .font(Font.custom("RobotoCondensed-Light", size: 20))
                    .padding()
                Spacer()
            }
        }
    }
}

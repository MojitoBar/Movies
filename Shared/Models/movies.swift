import Foundation
import SwiftUI

struct movies: Hashable, Codable, Identifiable{
    var adult: Bool
    var backdrop_path: String
    var genre_ids: [Int]
    var id: CGFloat
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
}

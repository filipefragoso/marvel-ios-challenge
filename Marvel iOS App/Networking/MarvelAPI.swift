import Foundation

class MarvelAPI {

    func fetchHeroesListing(completion: @escaping (Result<[HeroInformation], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let heroes = [
                HeroInformation(name: "Aegis (Trey Rollins)", imageURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/5/e0/4c0035c9c425d.gif")!),
                HeroInformation(name: "Warstar", imageURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/2/e0/4c003a73b6673.jpg")!),
                HeroInformation(name: "Unus", imageURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/6/00/4c003a847f5d2.jpg")!),
                HeroInformation(name: "Thena", imageURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/8/a0/4c002f2a83a8c.jpg")!),
                HeroInformation(name: "Turbo", imageURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/00/4c00322ddea0c.jpg")!)
            ]
            completion(.success(heroes))
        }
    }
}

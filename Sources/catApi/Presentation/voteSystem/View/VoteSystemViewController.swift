import Foundation
class VoteSystemViewController {

    var breedsList : [Breed]?

    static let instance: VoteSystemViewController = VoteSystemViewController()
    let breedsDataService: BreedsDataService = BreedsDataService()
    let token = "live_xzKzFQLuwMs9Jt6qvOXY2RsyZ3Uw4mH55waERmUbb1wL49B3eUIdmdFxvxtNMfb6"
    let urlAllBreeds = "https://api.thecatapi.com/v1/breeds"

    func loadBreeds(){

        var gato : [Breed]?
        print("###inicio de la carga de razas")
        breedsDataService.getFromApi(url: urlAllBreeds,type: [Breed].self ,onComplete:{ breedLoaded in
        gato = breedLoaded
        print(breedLoaded)
        readLine()!
        print(breedLoaded)

        })
        print("###tèrmino del llamado callBack")
        readLine()!
        print(gato!)
    }
}
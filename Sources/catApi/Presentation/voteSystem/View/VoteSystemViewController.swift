import Foundation
class VoteSystemViewController {

    var breedsList : [BreedStruct]?

    static let instance: VoteSystemViewController = VoteSystemViewController()
    let token = "live_xzKzFQLuwMs9Jt6qvOXY2RsyZ3Uw4mH55waERmUbb1wL49B3eUIdmdFxvxtNMfb6"
    let breedsDataService: BreedsDataService = BreedsDataService()

    func loadBreeds(){

        breedsDataService.loadBreeds(callBack: { breedLoaded in
        breedList = breedLoaded
        print(breedList)
        })
    }
}
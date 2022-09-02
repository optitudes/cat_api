class BreedPresenter {

    let token = "live_xzKzFQLuwMs9Jt6qvOXY2RsyZ3Uw4mH55waERmUbb1wL49B3eUIdmdFxvxtNMfb6"
    static let instance: BreedPresenter = BreedPresenter()
    let breedsDataService: BreedsDataService = BreedsDataService()

    func show(){
        breedsDataService.getCatBreeds()
        print("data \(breedsDataService.breedList)")

    }


    

}
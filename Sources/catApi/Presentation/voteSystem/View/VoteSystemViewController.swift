import Foundation
import Foundation
class VoteSystemViewController {

    var breedsList : [BLBreed] = []
    var totalBreedsLoaded : Int = 0 
    let urlAllBreeds = "https://api.thecatapi.com/v1/breeds"
    let userDefaults = UserDefaults()

    static let instance: VoteSystemViewController = VoteSystemViewController()
    let breedsDataService: BreedsDataService = BreedsDataService()


    func loadBreeds(){

        breedsDataService.getFromApi(url: urlAllBreeds,type: [BLBreed].self ,onComplete:{ breedsLoaded in

        self.breedsList = breedsLoaded
        self.totalBreedsLoaded = breedsLoaded.count

        })
    }
    func getIntInInterval(message: String, lowerLimit: Int, upperLimit: Int)-> Int{
        print(message)
        guard let readLineString = readLine(), let integer = Int(readLineString) else { 
            NotificationView.showErrorMessage(message: "Ha ocurrido un error al leer la opciòn, intente nuevamente")
            return -1
        }
        let isValidInt : Bool = integer>lowerLimit && integer<upperLimit
        if(isValidInt){
            return integer
        }
        return -1
    } 


    func isBreedsEmpty()-> Bool {
        return totalBreedsLoaded == 0
    }
    func getRandomVotationBreed()->PLVotationBreed {

        var breedSelected : PLVotationBreed = PLVotationBreed()

        if(!isBreedsEmpty()){

            let indexRandomForBreedsListrBreeds : Int = Int.random(in: 0...totalBreedsLoaded)
            breedSelected = PLBreedConverter.parsePLVotationBreed(bLBreed: breedsList[indexRandomForBreedsListrBreeds])
        }
        return breedSelected

    }
    func addVoteLike(breedId: String){
        addVote(breedId: breedId, voteValue: 1)
    }
    func addVoteDislike(breedId: String){
        addVote(breedId: breedId,voteValue: -1)
    }
    func addVote(breedId: String,voteValue: Int){
        let acumulado : Int = userDefaults.integer(forKey: breedId) 
        let totalVotes = acumulado + voteValue
        userDefaults.set( totalVotes, forKey: breedId)
    }
    func getDescriptionBreed(index: Int)->PLDescriptionBreed {
        let breedSelected : PLDescriptionBreed = PLBreedConverter.parsePLDescriptionBreed(bLBreed: breedsList[index]) 
        return breedSelected
    }
    func getScoreBreed(index: Int)-> PLScoreBreed {
        let breedSelected : PLScoreBreed = PLBreedConverter.parsePLScoreBreed(bLBreed: breedsList[index]) 
        return breedSelected
    }

    func getBreedId(index: Int)->String {
        let id: String = breedsList[index].id
        return id 

    }
    func getBreedScore(id: String)-> Int {
        let totalScore : Int = userDefaults.integer(forKey: id) 
        return totalScore 
    }

}
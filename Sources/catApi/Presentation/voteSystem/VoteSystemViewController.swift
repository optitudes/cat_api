import Foundation
import Foundation
class VoteSystemViewController {

    var breedsLoaded : [BLBreed] = []
    var totalBreedsLoaded : Int = 0
    var isBreedsAvailable : Bool = false

    let urlAllBreeds = "https://api.thecatapi.com/v1/breeds"

    static let instance: VoteSystemViewController = VoteSystemViewController()
    let breedsDataService: BreedsDataService = BreedsDataService()


    func loadBreeds(){
        breedsDataService.getFromApi(url: urlAllBreeds,type: [BLBreed].self ,onComplete:{ breedsLoaded in

        self.breedsLoaded = breedsLoaded
        self.totalBreedsLoaded = breedsLoaded.count
        self.isBreedsAvailable = self.totalBreedsLoaded > 0
        })
    }
    func getIntFromUser(message: String, minimunAllowedInteger: Int, maximumAllowedInteger: Int)-> Int{
        var isValidIntegerFromUser : Bool = false

        while true {
            print(message)
            
            let integerEntered : Int = getIntFromTerminal()
            
            isValidIntegerFromUser = integerEntered>=minimunAllowedInteger && integerEntered<=maximumAllowedInteger

            if(isValidIntegerFromUser){
                return integerEntered
            }  
            VoteSystemElementsView.showErrorMessage(message: "The allowed options are between \(minimunAllowedInteger) and \(maximumAllowedInteger), try again...")
        }
    } 
     
    func getIntFromTerminal()->Int {
        guard let integerEnteredInString = readLine(), let integerEntered = Int(integerEnteredInString) else { 
            return -10
        }
        return integerEntered
    }


    func addVoteLike(breedId: String){
        addVote(breedId: breedId, voteValue: 1)
    }
    
    func addVoteDislike(breedId: String){
        addVote(breedId: breedId,voteValue: -1)
    }

    func addVote(breedId: String,voteValue: Int){
        breedsDataService.addBreedVote(voteValue: voteValue,forKey: breedId)
    }
    func getPLDescriptionBreed(indexForSelectedBreed: Int)->PLDescriptionBreed {
        let breedSelected : PLDescriptionBreed = PLBreedConverter.parsePLDescriptionBreed(bLBreed: breedsLoaded[indexForSelectedBreed]) 
        return breedSelected
    
    }
    func getPLScoreBreed(indexForSelectedBreed: Int)-> PLScoreBreed {
        let breedSelected : PLScoreBreed = PLBreedConverter.parsePLScoreBreed(bLBreed: breedsLoaded[indexForSelectedBreed]) 
        return breedSelected
    }

    func getRandomVotationBreed()->PLVotationBreed {

        var breedSelected : PLVotationBreed = PLVotationBreed()

        if(self.isBreedsAvailable){

            let indexRandomForBreedsListrBreeds : Int = Int.random(in: 0...totalBreedsLoaded-1)
            breedSelected = PLBreedConverter.parsePLVotationBreed(bLBreed: breedsLoaded[indexRandomForBreedsListrBreeds])
        }
        return breedSelected

    }
    func getBreedScore(id: String)-> Int {
        let totalScore : Int = breedsDataService.getScoreFromBreed (forKey: id)
        return totalScore 
    }

}
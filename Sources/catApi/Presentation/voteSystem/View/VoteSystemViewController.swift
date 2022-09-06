import Foundation
import Foundation
class VoteSystemViewController {

    var breedsList : [BLBreed] = []
    var totalBreedsLoaded : Int = 0 
    let urlAllBreeds = "https://api.thecatapi.com/v1/breeds"

    static let instance: VoteSystemViewController = VoteSystemViewController()
    let breedsDataService: BreedsDataService = BreedsDataService()


    func loadBreeds(){
        breedsDataService.getFromApi(url: urlAllBreeds,type: [BLBreed].self ,onComplete:{ breedsLoaded in

        self.breedsList = breedsLoaded
        self.totalBreedsLoaded = breedsLoaded.count

        })
    }
    func getIntInInterval(message: String, lowerLimit: Int, upperLimit: Int)-> Int{
        var isValidInteger : Bool = false
        while true {
        print(message)
        
        let integer : Int = getInt()
        
        isValidInteger = integer>=lowerLimit && integer<=upperLimit

        if(isValidInteger){
            return integer
        } 
        VoteSystemElementsView.showErrorMessage(message: "The allowed range is between \(lowerLimit) and \(upperLimit), try again...")
        }
    } 
     
    func getInt()->Int {
        guard let readLineString = readLine(), let integer = Int(readLineString) else { 
            return -10
        }
        return integer
    }


    func isBreedsEmpty()-> Bool {
        return totalBreedsLoaded == 0
    }
    func getRandomVotationBreed()->PLVotationBreed {

        var breedSelected : PLVotationBreed = PLVotationBreed()

        if(!isBreedsEmpty()){

            let indexRandomForBreedsListrBreeds : Int = Int.random(in: 0...totalBreedsLoaded-1)
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
        let acumulado : Int = breedsDataService.getScoreFromBreed (forKey: breedId) 
        let totalVotes = acumulado + voteValue
        breedsDataService.addBreedVote(totalVotes:totalVotes,forKey: breedId)
    }
    func getPLDescriptionBreed(index: Int)->PLDescriptionBreed {
        let breedSelected : PLDescriptionBreed = PLBreedConverter.parsePLDescriptionBreed(bLBreed: breedsList[index]) 
        return breedSelected
    }
    func getPLScoreBreed(index: Int)-> PLScoreBreed {
        let breedSelected : PLScoreBreed = PLBreedConverter.parsePLScoreBreed(bLBreed: breedsList[index]) 
        return breedSelected
    }

    func getBreedId(index: Int)->String {
        let id: String = breedsList[index].id
        return id 

    }
    func getBreedScore(id: String)-> Int {
        let totalScore : Int = breedsDataService.getScoreFromBreed (forKey: id)
        return totalScore 
    }

}
import Foundation

class VoteSystemView {

    var viewActionType : TipeOfActionEnum?
    var isExit : Bool = false

    let voteSystemViewController : VoteSystemViewController = VoteSystemViewController.instance


    func mainLoop (){

        isExit = false
        viewActionType = TipeOfActionEnum.goToMainMenu

        loadBreeds()
        VoteSystemElementsView.showWelcomeMessage()

        while !isExit {
            
            switch viewActionType {
            case .goToMainMenu : goToMainMenu()
            case .goToVotationMenu : goToVotationMenu()
            case .goToBreedsGroupedByInitialLetter : showBreedsGroupedByInitialLetter()
                                                     let indexForSelectedBreed : Int = voteSystemViewController
                                                     .inputIntFromUser(message:"seleccione una posiciòn",minimunAllowedInteger: 0,maximumAllowedInteger: voteSystemViewController.totalBreedsLoaded)
                                                     showBreedDescription(indexForSelectedBreed: (indexForSelectedBreed-1))
            case .goToBreedsAndScore : showBreedsAndScore()
            case .goToExit : isExit = true
                             VoteSystemElementsView.showExitMessage() 
            case .none : isExit = true
                         VoteSystemElementsView.showExitMessage() 
            }
        }
    }

    func goToMainMenu(){
        VoteSystemElementsView.showMainMenu()
        let mainMenuOption : Int = voteSystemViewController.inputIntFromUser(message: "Choose an action :",minimunAllowedInteger: 1,maximumAllowedInteger: 4)
        switch mainMenuOption{
            case CAConstans.viewMainMenu                     : viewActionType = TipeOfActionEnum.goToVotationMenu
            case CAConstans.viewBreedsGroupedByInitialLetter : viewActionType = TipeOfActionEnum.goToBreedsGroupedByInitialLetter
            case CAConstans.viewBreedsAndScore               : viewActionType = TipeOfActionEnum.goToBreedsAndScore
            case CAConstans.viewExit                         : viewActionType = TipeOfActionEnum.goToExit
        default: VoteSystemElementsView.showErrorMessage(message: "A problem was founded, please contact for support ")
        }
    }
    func showBreedsGroupedByInitialLetter(){

        print("to exit tipe 0")
        for indexForBreedToSelect in 0...(voteSystemViewController.totalBreedsLoaded-1){
            let pLDescriptionBreed : PLDescriptionBreed = voteSystemViewController.getPLDescriptionBreed(indexForSelectedBreed: indexForBreedToSelect)
            VoteSystemElementsView.showBreedPosAndName(indexForBreedSelected: indexForBreedToSelect,breedName: pLDescriptionBreed.name)
        }
    }
    func showBreedDescription(indexForSelectedBreed: Int){

        if( indexForSelectedBreed>=0) {
            let breedSelected : PLDescriptionBreed = voteSystemViewController.getPLDescriptionBreed(indexForSelectedBreed: indexForSelectedBreed)
            print("Descripciòn de \(breedSelected.name) : \(breedSelected.description)")
        } 
        VoteSystemElementsView.waitUtilEnterIsPressed()
        viewActionType = TipeOfActionEnum.goToMainMenu
    }

    func showBreedsAndScore(){
        for indexForBreedToSelect in 0...(voteSystemViewController.totalBreedsLoaded-1){

            let pLScoreBreed : PLScoreBreed = voteSystemViewController.getPLScoreBreed(indexForSelectedBreed: indexForBreedToSelect)
            let score : Int  = voteSystemViewController.getBreedScore(id: pLScoreBreed.id)

            VoteSystemElementsView.showBreedAndScore(pLScoreBreed: pLScoreBreed, score: score)

        }
        VoteSystemElementsView.waitUtilEnterIsPressed()
        viewActionType = TipeOfActionEnum.goToMainMenu
    }
    func goToVotationMenu(){

        let isBreedsAvailable : Bool  = voteSystemViewController.isBreedsAvailable
        var optionSelected : Int = -1
        

        if(isBreedsAvailable){

            while(self.viewActionType == TipeOfActionEnum.goToVotationMenu){
                let breedSelected = voteSystemViewController.getRandomVotationBreed()
                VoteSystemElementsView.showBreedForVotation(breedSelected: breedSelected)

                optionSelected = voteSystemViewController.inputIntFromUser(message: "Choose the action :",minimunAllowedInteger: 1,maximumAllowedInteger: 4)
                switch optionSelected {
                    case CAConstans.viewMainMenu: viewActionType = TipeOfActionEnum.goToMainMenu
                    case CAConstans.voteLike    : voteSystemViewController.addVoteLike(breedId: breedSelected.id)
                    case CAConstans.voteDisLike : voteSystemViewController.addVoteDislike(breedId: breedSelected.id)
                    default:VoteSystemElementsView.makeSpaceInConsole() 
                }
                VoteSystemElementsView.makeSpaceInConsole()
            }
            } else {
                print("## loading breeeds")
            }

        }
    func loadBreeds(){
    voteSystemViewController.loadBreeds()
    }

}
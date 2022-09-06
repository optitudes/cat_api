import Foundation

class VoteSystemView {

    var tipe : TipeOfActionEnum?
    var isExit : Bool = false

    let voteSystemViewController : VoteSystemViewController = VoteSystemViewController.instance


    func mainLoop (){

        isExit = false
        tipe = TipeOfActionEnum.goToMainMenu

        loadBreeds()
        VoteSystemElementsView.showWelcomeMessage()

        while !isExit {
            
            switch tipe {
            case .goToMainMenu : goToMainMenu()
            case .goToVotationMenu : goToVotationMenu()
            case .goToBreedsGroupedByInitialLetter : showBreedsGroupedByInitialLetter()
                                                     let index : Int = voteSystemViewController.getIntInInterval(message:"seleccione una posiciòn",lowerLimit: 0,upperLimit: voteSystemViewController.totalBreedsLoaded)
                                                     showBreedDescription(index: (index-1))
            case .goToBreedsAndScore : showBreedsAndScore()
            case .goToExit : isExit = true 
            case .none : isExit = true 
            }
        }
    }

    func goToMainMenu(){
        VoteSystemElementsView.showMainMenu()
        let mainMenuOption : Int = voteSystemViewController.getIntInInterval(message: "Input",lowerLimit: 1,upperLimit: 4)
        switch mainMenuOption{
            case 1 : tipe = TipeOfActionEnum.goToVotationMenu
            case 2 : tipe = TipeOfActionEnum.goToBreedsGroupedByInitialLetter
            case 3 : tipe = TipeOfActionEnum.goToBreedsAndScore
            case 4 : tipe = TipeOfActionEnum.goToExit
        default: VoteSystemElementsView.showErrorMessage(message: "Ocurriò un problema inesperado, contacte con el soporte ")
        }
    }
    func showBreedsGroupedByInitialLetter(){

        print("to exit tipe 0")
        for posicion in 0...(voteSystemViewController.totalBreedsLoaded-1){
            let pLDescriptionBreed : PLDescriptionBreed = voteSystemViewController.getPLDescriptionBreed(index: posicion)
            print("pos :\(posicion+1) name :\(pLDescriptionBreed.name)")
        }
    }
    func showBreedDescription(index: Int){

        if( index>=0) {
            let breedSelected : PLDescriptionBreed = voteSystemViewController.getPLDescriptionBreed(index: (index))
            print("Descripciòn de \(breedSelected.name) : \(breedSelected.description)")
        } 
        VoteSystemElementsView.waitUtilEnterIsPressed()
        tipe = TipeOfActionEnum.goToMainMenu
    }

    func showBreedsAndScore(){
        for index in 0...(voteSystemViewController.totalBreedsLoaded-1){
            let pLScoreBreed : PLScoreBreed = voteSystemViewController.getPLScoreBreed(index: index)
            let score : Int  = voteSystemViewController.getBreedScore(id: pLScoreBreed.id)
            print("id: \(pLScoreBreed.id) name: \(pLScoreBreed.name)  score : \(score)")
        }
        VoteSystemElementsView.waitUtilEnterIsPressed()
        tipe = TipeOfActionEnum.goToMainMenu
    }
    func goToVotationMenu(){

        let isBreedsEmpty : Bool  = voteSystemViewController.isBreedsEmpty()
        var breedSelected : PLVotationBreed = PLVotationBreed()
        var optionSelected : Int = -1
        

        if(!isBreedsEmpty){

            while(self.tipe == TipeOfActionEnum.goToVotationMenu){
                breedSelected = voteSystemViewController.getRandomVotationBreed()
                VoteSystemElementsView.showBreedForVotation(breedSelected: breedSelected)

                optionSelected = voteSystemViewController.getIntInInterval(message: "input :",lowerLimit: 1,upperLimit: 4)
                switch optionSelected {
                    case 1: voteSystemViewController.addVoteLike(breedId: breedSelected.id)
                    case 2: voteSystemViewController.addVoteDislike(breedId: breedSelected.id)
                    case 3: tipe = TipeOfActionEnum.goToMainMenu
                    default: print("\n")
                }
                VoteSystemElementsView.makeSpaceInConsole()
            }
            }

        }
    func loadBreeds(){
    voteSystemViewController.loadBreeds()
    }

}
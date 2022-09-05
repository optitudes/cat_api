import Foundation

class VoteSystemView {

    var tipe : TipeOfActionEnum?
    var isExit : Bool = false

    let voteSystemViewController : VoteSystemViewController = VoteSystemViewController.instance


    func mainLoop (){

        isExit = false
        tipe = TipeOfActionEnum.goToMainMenu

        loadBreeds()
        readLine()!
        showWelcomeMessage()

        while !isExit {
            
            switch tipe {
            case .goToMainMenu : showMainMenu()
            case .goToVotationMenu : showVotationMenu()
            case .goToBreedsGroupedByInitialLetter : showBreedsGroupedByInitialLetter()
            case .goToBreedsAndScore : showBreedsAndScore()
            case .goToExit : isExit = true 
            case .none : isExit = true 
            }
        }
    }

    func showMainMenu(){


        print("------------------------------------------------------------")
        print("-----------------🐈MAIN MENÙ OPTIONS🐈----------------------")
        print("------------------------------------------------------------")
        print("1  ---> SHOW VOTATION MENÙ<--------------------------------")
        print("2  ---> DISPLAY CAT BREEDS GROUPED BY INITIAL LETTER<--------")
        print("3  ---> DISPLAY CAT BREEDS AND VOTATION SCORE<--------------")
        print("4----->EXIT-------------------------------------------------")


        let mainOption : Int = voteSystemViewController.getIntInInterval(message: "Input",lowerLimit: 0,upperLimit: 5)

        switch mainOption{
            case 1 : tipe = TipeOfActionEnum.goToVotationMenu
                     showVotationMenu()
            case 2 : tipe = TipeOfActionEnum.goToBreedsGroupedByInitialLetter
                     showBreedsGroupedByInitialLetter()
            case 3 : tipe = TipeOfActionEnum.goToBreedsAndScore
                     showBreedsAndScore()
            case 4 : tipe = TipeOfActionEnum.goToExit
        default: NotificationView.showErrorMessage(message: "Ocurriò un problema inesperado, contacte con el soporte ")
        }
    }
    func showBreedsGroupedByInitialLetter(){
        print("to exit tipe 0")
        for posicion in 0...(voteSystemViewController.totalBreedsLoaded-1){
            let pLDescriptionBreed : PLDescriptionBreed = voteSystemViewController.getDescriptionBreed(index: posicion)
            print("pos :\(posicion+1) name :\(pLDescriptionBreed.name)")
        }
        let option : Int = voteSystemViewController.getIntInInterval(message:"seleccione una posiciòn",lowerLimit: -1,upperLimit: voteSystemViewController.totalBreedsLoaded+1)
        if( !(option==0) ){
            let breedSelected : PLDescriptionBreed = voteSystemViewController.getDescriptionBreed(index: (option-1))
            print("Descripciòn de \(breedSelected.name) : \(breedSelected.description)")
        } 
        tipe = TipeOfActionEnum.goToMainMenu

    }
    func showBreedsAndScore(){
        for index in 0...(voteSystemViewController.totalBreedsLoaded-1){
            let pLScoreBreed : PLScoreBreed = voteSystemViewController.getScoreBreed(index: index)
            let score : Int  = voteSystemViewController.getBreedScore(id: pLScoreBreed.id)
            print("id: \(pLScoreBreed.id) name: \(pLScoreBreed.name)  score : \(score)")
        }
 

        readLine()!
        tipe = TipeOfActionEnum.goToMainMenu
    }
    func showVotationMenu(){

        let isBreedsEmpty : Bool  = voteSystemViewController.isBreedsEmpty()
        var breedSelected : PLVotationBreed = PLVotationBreed()
        var optionSelected : Int = -1
        

        if(!isBreedsEmpty){

            while(self.tipe == TipeOfActionEnum.goToVotationMenu){
                breedSelected = voteSystemViewController.getRandomVotationBreed()
                showBreedForVotation(breedSelected: breedSelected)
                optionSelected = voteSystemViewController.getIntInInterval(message: "input :",lowerLimit: 0,upperLimit: 5)
                switch optionSelected {
                    case 1: voteSystemViewController.addVoteLike(breedId: breedSelected.id)
                    case 2: voteSystemViewController.addVoteDislike(breedId: breedSelected.id)
                    case 3: tipe = TipeOfActionEnum.goToMainMenu
                    default: print("\n")
                }
                NotificationView.makeSpaceInConsole()
            }
            }

        }

    func showBreedForVotation(breedSelected: PLVotationBreed){
        NotificationView.makeSpaceInConsole()
        print("------------------------------------------------------------")
        print("----------------- \(breedSelected.name.uppercased())-----------------------")
        print("------------------------------------------------------------")
        print("temperament ---> \(breedSelected.temperament) <---")
        print("origin ---> \(breedSelected.origin) <---")
        print("------------------------------------------------------------")
        print("1 --> 👍\n\n2--> 👎\n\n3-->Main menù \n\n4-->No vote")
    }


    func showWelcomeMessage(){
        print("------------------------------------------------------------")
        print("----------------- WELCOME TO CAT API-----------------------")
        print("------------------------------------------------------------")
    }
    
    
    func loadBreeds(){
    voteSystemViewController.loadBreeds()

    }

}
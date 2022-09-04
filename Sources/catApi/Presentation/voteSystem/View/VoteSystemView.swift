import Foundation

class VoteSystemView {

    var input : String?
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
        print("3  ---> display cat breeds and votations score<--------------")
        print("4----->EXIT-------------------------------------------------")

        guard let mainOptionString = readLine(), let mainOption = Int(mainOptionString) else { 
            showErrorMessage(message: "Ha ocurrido un error al leer la opciòn, intente nuevamente")
                        return } 


    let isValidOption : Bool = mainOption>0 && mainOption<5

        if(!isValidOption){
            showErrorMessage(message: "La opciòn debe estar entre 1 y 4")
            return 
        }
        print(mainOption)
    }

    func showWelcomeMessage(){
        print("------------------------------------------------------------")
        print("----------------- WELCOME TO CAT API-----------------------")
        print("------------------------------------------------------------")
    }
    
    func cleanConsole(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }

    func makeSpaceInConsole(){
        print("\n\n\n")
    }

    func showErrorMessage (message : String){
        cleanConsole()
        NotificationsView.showAlert(header: "ERROR", content: message , tipe: .Warning)
        makeSpaceInConsole()


    }
    func loadBreeds(){
    voteSystemViewController.loadBreeds()

    }

}
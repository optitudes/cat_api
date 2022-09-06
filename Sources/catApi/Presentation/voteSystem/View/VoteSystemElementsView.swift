import Foundation
class VoteSystemElementsView {

    static func showAlert (header: String, content: String, tipe: TipeNotificationEnum){

        print("-----------------------------------------------------------------------")
        print("\(tipe.icon)-->| \(header)  |<--\(tipe.icon)")
        print("-----------------------------------------------------------------------")
        print("-----------------------------------------------------------------------")
        print("\(tipe.icon)\(tipe.icon)\(tipe.icon)-->| \(content)  |<--\(tipe.icon)\(tipe.icon)\(tipe.icon)")
        print("-----------------------------------------------------------------------")
    }
    static func cleanConsole(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }

    static func makeSpaceInConsole(){
        print("\n")
    }

    static func showErrorMessage (message : String){
        makeSpaceInConsole()
        showAlert(header: "ERROR", content: message , tipe: .Errors)
        makeSpaceInConsole()
    }

    static func showMainMenu() {
        makeSpaceInConsole()
        print("------------------------------------------------------------")
        print("-----------------🐈MAIN MENÙ OPTIONS🐈----------------------")
        print("------------------------------------------------------------")
        print("1  ---> SHOW VOTATION MENÙ<--------------------------------")
        print("2  ---> DISPLAY CAT BREEDS GROUPED BY INITIAL LETTER<--------")
        print("3  ---> DISPLAY CAT BREEDS AND VOTATION SCORE<--------------")
        print("4----->EXIT-------------------------------------------------")
        print("------------------------------------------------------------")
    }
    static func waitUtilEnterIsPressed() {
        print("Press enter to continue")
        readLine()!

    }
    static func showWelcomeMessage(){
        print("------------------------------------------------------------")
        print("-----------------!!WELCOME TO CAT API!!-----------------------")
        print("------------------------------------------------------------")
    }

    static func showBreedForVotation(breedSelected: PLVotationBreed){
        makeSpaceInConsole()
        print("------------------------------------------------------------")
        print("----------------- \(breedSelected.name.uppercased())-----------------------")
        print("------------------------------------------------------------")
        print("temperament ---> \(breedSelected.temperament) <---")
        print("origin ---> \(breedSelected.origin) <---")
        print("------------------------------------------------------------")
        print("1 --> 👍\n\n2--> 👎\n\n3-->Main menù \n\n4-->Next breed")
    }

}
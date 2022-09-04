import Foundation
class NotificationView {

    static func showAlert (header: String, content: String, tipe: TipeNotificationEnum){

        print("|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||")
        print("-----------------------------------------------------------------------")
        print("\(tipe.icon)-->| \(header)  |<--\(tipe.icon)")
        print("-----------------------------------------------------------------------")
        print("|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||")
        print("-----------------------------------------------------------------------")
        print("\(tipe.icon)\(tipe.icon)\(tipe.icon)-->| \(content)  |<--\(tipe.icon)\(tipe.icon)\(tipe.icon)")
        print("-----------------------------------------------------------------------")
        print("|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||")
    }
    static func cleanConsole(){
        print("\u{1B}[1;1H", "\u{1B}[2J")
    }

    static func makeSpaceInConsole(){
        print("\n\n")
    }

    static func showErrorMessage (message : String){
        cleanConsole()
        showAlert(header: "ERROR", content: message , tipe: .Errors)
        makeSpaceInConsole()
    }

}
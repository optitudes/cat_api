import Foundation
import Foundation
class VoteSystemViewController {

    var breedsList : [Breed]?

    static let instance: VoteSystemViewController = VoteSystemViewController()
    let breedsDataService: BreedsDataService = BreedsDataService()
    let token = "live_xzKzFQLuwMs9Jt6qvOXY2RsyZ3Uw4mH55waERmUbb1wL49B3eUIdmdFxvxtNMfb6"
    let urlAllBreeds = "https://api.thecatapi.com/v1/breeds"

    func loadBreeds(){
        print("###inicio de la carga de razas")
        breedsDataService.getFromApi(url: urlAllBreeds,type: [Breed].self ,onComplete:{ breedLoaded in

        self.breedsList = breedLoaded
        print("###tèrmino del llamado callBack")

        })
    }
    func getIntInInterval(message: String, lowerLimit: Int, upperLimit: Int)-> Int{
        guard let optionString = readLine(), let option = Int(optionString), option>lowerLimit && option<upperLimit else { 
            NotificationView.showErrorMessage(message: "Ha ocurrido un error al leer la opciòn, intente nuevamente")
            return -1
        }
        return option
        } 

}
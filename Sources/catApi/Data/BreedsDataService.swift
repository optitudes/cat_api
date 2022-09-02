import Foundation
import FoundationNetworking

class BreedsDataService{

    static let instance: BreedsDataService = BreedsDataService()

    func loadBreeds()  {

        DispatchQueue.main.async {

            var breedList : [BreedStruct]?
            let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data, error == nil else {
                print("###here was a error")
                return }

            do{
                let breedsDecoded : [BreedStruct] = try JSONDecoder().decode([BreedStruct].self,from: data)
                breedList=breedsDecoded
                print(" breeds lent : \(breedsDecoded.count)")
                print(" breeds : \(breedsDecoded)")
                print("#### fin get")
            }catch{
                print("###### ERROR : \(error)")
            }
            }
            task.resume()
            print("###### llamando callBack ")
            callBack( breedsDecoded )
        }

    }


}
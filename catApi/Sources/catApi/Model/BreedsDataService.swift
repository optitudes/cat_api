import Foundation

class BreedsDataService{

    static let instance: BreedsDataService = BreedsDataService()
    var breedList = [BreedStruct]()

    func getCatBreeds(){

        let url = URL(string: "https://api.thecatapi.com/v1/breeds")

        var request = URLRequest(url: url)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(whit: request){ data, response, error in
        guard let data = data, error == nil else {return }
        
        do{
            let breedsDecoded : [BreedStruct] = try JSONDecoder().decode([BreedStruct].self,from: data)
        }catch{
            print("###### ERROR : \(error)")
        }
        }
        task.resume()
    }


}
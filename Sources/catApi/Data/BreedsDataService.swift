import Foundation
import FoundationNetworking

typealias Callback<T:Any> = (_ value:T)->Void;

class BreedsDataService{

    static let instance: BreedsDataService = BreedsDataService()


    func getFromApi<T : Decodable >(url: String,type: T.Type,onComplete: @escaping Callback<T> )  {


            let url = URL(string:url )!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data, error == nil else {
                return }

            do{
                let dataDecoded : T = try JSONDecoder().decode(T.self,from: data)
                print(dataDecoded)
                DispatchQueue.global().async {
                    onComplete( dataDecoded )
                }
            }catch{
                print("###### ERROR : \(error)")
            }
            }
            task.resume()

    }


}
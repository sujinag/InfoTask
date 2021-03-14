

import Foundation
import Alamofire
import UIKit
struct APIManager{
    var content = [ApiResponseModel]()
       
    func fetchDataFromURL(completion: @escaping ([ApiResponseModel])->())
    {
                let url = URL(string: "http://www.mocky.io/v2/5dc3f2c13000003c003477a0")
                URLSession.shared.dataTask(with: url!) { (data, response, error) in
                    
                    do { if error == nil {
                        let result = try JSONDecoder().decode([ApiResponseModel].self, from:
                                                    data!)
                      //  print("result",result)
                        completion(result)
                    }
                    }
        
                    catch {
                        
                        //completion("error in loading data")
                        print( "error in loading data",error.localizedDescription)
                    }
                }.resume()

    }
    }

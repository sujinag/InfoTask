
import Foundation
struct ApiResponseModel : Codable {
    var modelName:String?
    var id:String?
    var modelIdentifier:String?
    var group:String?
    var licensePlate:String?
    var innerCleanliness:String?
    var carImageUrl:String?
    let vehicleDetails: VehicleDetails?
    let location: Location?

    enum CodingKeys: String, CodingKey
    {
        case modelName = "modelName"
        case id = "id"
        case modelIdentifier = "modelIdentifier"
        case group = "group"
        case licensePlate = "licensePlate"
        case innerCleanliness = "innerCleanliness"
        case carImageUrl = "carImageUrl"
        case vehicleDetails = "vehicleDetails"
        case location = "location"

        
        
    }
}
    struct VehicleDetails: Codable{
        var name:String?
        var make:String?
        var color:String?
        var series:String?
        var fuel_type:String?
        var fuel_level:Double?
        var transmission:String?
        
        enum CodingKeys: String, CodingKey
        {
            case name = "name"
            case make = "make"
            case color = "color"
            case series = "series"
            case fuel_type = "fuel_type"
            case fuel_level = "fuel_level"
            case transmission = "transmission"

        }

    }

struct Location: Codable{
    var latitude:Double?
    var longitude:Double?
    
    enum CodingKeys: String, CodingKey
    {
        case latitude = "latitude"
        case longitude = "longitude"

    }

}

    
    


import Realm

public class Coordinates: RLMObject {
    // MARK: - Variables
    public let longitude: Double
    public let latitude: Double
    public let altitude: Double?
    
    public override var description: String {
        return self.longitude.description + "," + self.latitude.description
    }
    
    //MARK: - Initializers
    public init(latitude: Double, longitude: Double, altitude: Double? = nil) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        
        super.init()
    }
    
    public convenience init?(string: String) {
        let coordinatesArray = string.components(separatedBy: ",")
        
        switch coordinatesArray.count {
        case 3:
            if let longitude = coordinatesArray[0].toDouble(), let latitude = coordinatesArray[1].toDouble(), let altitude = coordinatesArray[2].toDouble() {
                self.init(latitude: latitude, longitude: longitude, altitude: altitude)
                return
            }
        case 2:
            if let longitude = coordinatesArray[0].toDouble(), let latitude = coordinatesArray[1].toDouble() {
                self.init(latitude: latitude, longitude: longitude)
                return
            }
        default:
            return nil
        }
        return nil
    }
}

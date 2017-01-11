import RealmSwift

class Coordinates: Object {
    // MARK: - Variables
    dynamic var longitude: Double = 0
    dynamic var latitude: Double = 0
    dynamic var altitude: Double = 0
    
    public override var description: String {
        return self.longitude.description + "," + self.latitude.description
    }
    
    //MARK: - Initializers
    convenience init(latitude: Double, longitude: Double, altitude: Double = 0) {
        self.init()
        
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
    }
    
    convenience init?(string: String) {
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

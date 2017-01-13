import RealmSwift
import MapKit

class Coordinates: Object {
    // MARK: - Variables
    fileprivate dynamic var id: String = ""
    
    dynamic var longitude: Double = 0
    dynamic var latitude: Double = 0
    dynamic var altitude: Double = 0
    dynamic var country: Country?
    dynamic var timestamp = Date()
    
    public override var description: String {
        return self.longitude.description + "," + self.latitude.description
    }
    
    //MARK: - Initializers
    convenience init(longitude: Double, latitude: Double, altitude: Double = 0) {
        self.init()
        
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.timestamp = Date()
        
        self.id = self.longitude.description + "," + self.latitude.description
    }
    
    convenience init?(string: String) {
        let coordinatesArray = string.components(separatedBy: ",")
        
        switch coordinatesArray.count {
        case 3:
            if let longitude = coordinatesArray[0].toDouble(), let latitude = coordinatesArray[1].toDouble(), let altitude = coordinatesArray[2].toDouble() {
                self.init(longitude: longitude, latitude: latitude, altitude: altitude)
                return
            }
        case 2:
            if let longitude = coordinatesArray[0].toDouble(), let latitude = coordinatesArray[1].toDouble() {
                self.init(longitude: longitude, latitude: latitude)
                return
            }
        default:
            return nil
        }
        return nil
    }
    
    convenience init(location: CLLocation) {
        self.init()
        
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        self.timestamp = location.timestamp
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    static func ==(lhs: Coordinates, rhs: Coordinates) -> Bool {
        return lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
    }
}

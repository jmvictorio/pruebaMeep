
import Foundation

// MARK: - Point
struct PointData: Codable {
    let id, name: String
    let x, y: Double
    let scheduledArrival, locationType: Int?
    let companyZoneID: Int
    let lat, lon: Double?
    let licencePlate: String?
    let range, batteryLevel, helmets: Int?
    let model: String?
    let resourceImageID: String?
    let realTimeData: Bool?
    let resourceType: String?
    let station: Bool?
    let availableResources, spacesAvailable: Int?
    let allowDropoff: Bool?
    let bikesAvailable: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, x, y, scheduledArrival, locationType, lat, lon, licencePlate, range, batteryLevel, helmets, model, realTimeData, resourceType, station, availableResources, spacesAvailable, allowDropoff, bikesAvailable
        case companyZoneID = "companyZoneId"
        case resourceImageID = "resourceImageId"
    }
}

typealias PointsData = [PointData]

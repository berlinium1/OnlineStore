

class BikeData {
    
    static let shared = BikeData()
    
    private let bikes = [
        Bike(name: "Ardis V10 Pro",
         price: 6599,
         description: "sjdifdhsgbfusdgbu dbfdshub fsduhbfdshfbis buhfs uihsfiu hsuihfiudh iuhsfui hsui fhusihf ui hiu hisufh uisdhf uishf iushdf uih sosifjidsf",
         imageNmae: "ArdisV10Pro"
    ),
        Bike(name: "Ardis V10 Pro",
             price: 6599,
             description: "sjdifdhsgbfusdgbu dbfdshub fsduhbfdshfbis buhfs uihsfiu hsuihfiudh iuhsfui hsui fhusihf ui hiu hisufh uisdhf uishf iushdf uih sosifjidsf",
             imageNmae: "ArdisV10Pro")]
    
    func bikeList() -> [Bike] {
        return bikes
    }
}

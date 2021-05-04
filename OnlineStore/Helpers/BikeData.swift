

class BikeData {
    
    static let shared = BikeData()
    
    private let bikes = [
        Bike(name: "Ardis V10 Pro",
         price: 6599,
         description: "довольно молодой развивающийся бренд велосипедов, основанный в Китае. Toprider производит экономные варианты современных велосипедов. Их продукт славится прочной рамой, изготовленной из стали.",
         imageNmae: "ArdisV10Pro",
         material: "алюминий",
         weight: 21,
         diametr: 27,
         type: "Спортивный",
         gears: "3х8"
    ),
        Bike(name: "Toprider 611",
         price: 3547,
         description: "довольно молодой развивающийся бренд велосипедов, основанный в Китае. Toprider производит экономные варианты современных велосипедов. Их продукт славится прочной рамой, изготовленной из стали.",
         imageNmae: "IMG_7824",
         
         material: "алюминий",
         weight: 22,
         diametr: 26,
         type: "горный",
         gears: "3х8"
    ),
        Bike(name: "Dorozhnik Rose",
         price: 7865,
         description: "довольно молодой развивающийся бренд велосипедов, основанный в Китае. Toprider производит экономные варианты современных велосипедов. Их продукт славится прочной рамой, изготовленной из стали.",
         imageNmae: "26-Dorozhnik-JADE-cherno-rozovyiy-2021-8989-1980x1360-1",
         material: "алюминий",
         weight: 22,
         diametr: 26,
         type: "горный",
         gears: "3х8"
    ),
        Bike(name: "Ardis V10 Pro",
         price: 6599,
         description: "довольно молодой развивающийся бренд велосипедов, основанный в Китае. Toprider производит экономные варианты современных велосипедов. Их продукт славится прочной рамой, изготовленной из стали.",
         imageNmae: "ArdisV10Pro",
         material: "алюминий",
         weight: 21,
         diametr: 27,
         type: "Спортивный",
         gears: "3х8"
    ),
        Bike(name: "Toprider 611",
         price: 3547,
         description: "довольно молодой развивающийся бренд велосипедов, основанный в Китае. Toprider производит экономные варианты современных велосипедов. Их продукт славится прочной рамой, изготовленной из стали.",
         imageNmae: "IMG_7824",
         
         material: "алюминий",
         weight: 22,
         diametr: 26,
         type: "горный",
         gears: "3х8"
    ),
        Bike(name: "Dorozhnik Rose",
         price: 7865,
         description: "довольно молодой развивающийся бренд велосипедов, основанный в Китае. Toprider производит экономные варианты современных велосипедов. Их продукт славится прочной рамой, изготовленной из стали.",
         imageNmae: "26-Dorozhnik-JADE-cherno-rozovyiy-2021-8989-1980x1360-1",
         material: "алюминий",
         weight: 22,
         diametr: 26,
         type: "горный",
         gears: "3х8"
    )]
    
    func bikeList() -> [Bike] {
        return bikes
    }
}

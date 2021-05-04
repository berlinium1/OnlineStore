
import UIKit

class CellController {
    func configure(_ cell: BikeTableViewCell, with bike: Bike) {
        cell.bikeTitle?.text = bike.name
        let index = bike.description.index(bike.description.startIndex, offsetBy: 70)
        let description = bike.description.count>70 ? String(bike.description[..<index]) + "..." : bike.description
        cell.bikeDescription.text = description
        cell.bikeImage.image = UIImage(named: bike.imageNmae)
    }
}

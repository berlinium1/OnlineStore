//
//  HomeViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var bikes: [Bike] = []
    let cellController = CellController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        bikes =  BikeData.shared.bikeList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailed" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let resultVC = segue.destination as! DetailedViewController
                resultVC.bikeImageName = bikes[indexPath.row].imageNmae
                resultVC.bikeNameOut = bikes[indexPath.row].name
                resultVC.bikeDescriptionOut = bikes[indexPath.row].description
                resultVC.bikePriceOut = bikes[indexPath.row].price
                resultVC.bikeMaterialOut = bikes[indexPath.row].material
                resultVC.bikeWeightOut = bikes[indexPath.row].weight
                resultVC.bikeDiametrOut = bikes[indexPath.row].diametr
                resultVC.bikeTypeOut = bikes[indexPath.row].type
                resultVC.bikeGearOut = bikes[indexPath.row].gears
            }
        }
    }
}

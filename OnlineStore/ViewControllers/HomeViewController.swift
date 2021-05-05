//
//  HomeViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Outlets for HomeViewController
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var signOutButton: UIButton!
    
    var bikes: [Bike] = []
    let cellController = CellController()
    
    // MARK: Functions and Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleHollowButton(signOutButton)
        tableView.dataSource = self
        tableView.delegate = self
        bikes = BikeData.shared.bikeList()
    }
    
    // go to detailed information about selected bike
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
    
    @IBAction func signOutTapped() {
        performSegue(withIdentifier: "goMain", sender: nil)
    }
    
}

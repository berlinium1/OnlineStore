//
//  DetailedViewController.swift
//  OnlineStore
//
//  Created by admin2 on 04.05.2021.
//

import UIKit

class DetailedViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var bikeImage: UIImageView!
    @IBOutlet var bikeName: UILabel!
    @IBOutlet var bikePrice: UILabel!
    @IBOutlet var bikeDescription: UILabel!
    @IBOutlet var bikeMaterial: UILabel!
    @IBOutlet var bikeWeight: UILabel!
    @IBOutlet var bikeDiametr: UILabel!
    @IBOutlet var bikeType: UILabel!
    @IBOutlet var bikeGear: UILabel!
    
    //MARK: - public properties
    var bikeImageName: String = ""
    var bikeNameOut: String = ""
    var bikePriceOut: Int = 0
    var bikeDescriptionOut: String = ""
    var bikeMaterialOut: String = ""
    var bikeWeightOut: Int = 0
    var bikeDiametrOut: Int = 0
    var bikeTypeOut: String = ""
    var bikeGearOut: String = ""
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        bikeImage.image = UIImage(named: bikeImageName)
        bikeName.text = bikeNameOut
        bikePrice.text = String(bikePriceOut) + " UAH"
        bikeDescription.text = bikeDescriptionOut
        bikeMaterial.text = bikeMaterialOut
        bikeWeight.text = String(bikeWeightOut)
        bikeDiametr.text = String(bikeDiametrOut)
        bikeType.text = bikeTypeOut
        bikeGear.text = bikeGearOut
    }
    
    //MARK: - private methods
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    //MARK: - IBActions
    @IBAction func onClickOrder() {
        showAlert(title: "Заказ принят", message: "По почте с вами свяжется наш оператор.")
    }
    

}

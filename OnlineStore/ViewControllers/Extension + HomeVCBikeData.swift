

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    // creating necessary number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bikes.count
    }
    
    // filling cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeCell", for: indexPath) as! BikeTableViewCell
        
        let bike = bikes[indexPath.row]
        cellController.configure(cell, with: bike)
        
        return cell
    }
    
    // setting height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//首頁 顯示各地觀光景點資料table

import UIKit

class HomeTableViewController: UITableViewController {

    var tripData = [Info]() //要抓的資料
    //抓網路資料
    func catchData(){
        let urlstr = "https://gis.taiwan.net.tw/XMLReleaseALL_public/scenic_spot_C_f.json"
        if let url = URL(string: urlstr){
            URLSession.shared.dataTask(with: url) { data, respond, error in
                if let data = data{
                    do {
                        let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                        self.tripData = searchResponse.XML_Head.Infos.Info
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                           
                        }
                    } catch  {
                        print(error)
                    }
                }else{
                    print("error")
                }
            }.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        catchData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tripData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TripCellTableViewCell.self)", for: indexPath) as? TripCellTableViewCell else {return UITableViewCell()}
        
        let intem = tripData[indexPath.row]
        cell.tripLabel.text = intem.Name
        cell.tripCellImage.image = nil
        if let url = URL(string: intem.Picture1!){
            URLSession.shared.dataTask(with: url) { data, respond, error in
                if let data = data{
                    DispatchQueue.main.async {
                        cell.tripCellImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

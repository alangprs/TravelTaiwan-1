//
//  HomestayTableViewController.swift
//  TravelTaiwan-1
//
//  Created by 翁燮羽 on 2021/5/9.
//

import UIKit

class HomestayTableViewController: UITableViewController {

    var HomestayData = [HomestayInfo]()
    //抓網路資料func
    func catchHomeStayData(){
        let urlstr = "https://gis.taiwan.net.tw/XMLReleaseALL_public/hotel_C_f.json"
        if let url = URL(string: urlstr){
            URLSession.shared.dataTask(with: url) { data, respond, error in
                if let data = data{
                    do {
                        let searchResponse = try JSONDecoder().decode(HomestayResponse.self, from: data)
                        self.HomestayData = searchResponse.XML_Head.Infos.Info
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
    
    @IBSegueAction func showHomeStay(_ coder: NSCoder) -> ShowHomestayViewController? {
        if let item = tableView.indexPathForSelectedRow?.row{
            return ShowHomestayViewController(coder: coder,catchHomeStayData: HomestayData[item])
        }else{
            return nil
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catchHomeStayData()
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
        return HomestayData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(HomestayTableViewCell.self)", for: indexPath) as? HomestayTableViewCell else {return UITableViewCell()}
        let item = HomestayData[indexPath.row]
        cell.homeStayLabel.text = item.Name
        cell.homeStayImage.image = nil
        if let url = URL(string: item.Picture1!){
            URLSession.shared.dataTask(with: url) { data, respond, error in
                if let data = data{
                    DispatchQueue.main.async {
                        cell.homeStayImage.image = UIImage(data: data)
                       
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

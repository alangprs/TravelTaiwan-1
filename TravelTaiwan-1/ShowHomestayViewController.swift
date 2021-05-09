//
//  ShowHomestayViewController.swift
//  TravelTaiwan-1
//
//  Created by 翁燮羽 on 2021/5/9.
//

import UIKit

class ShowHomestayViewController: UIViewController {

    @IBOutlet weak var homeStayImageView: UIImageView!
    
    @IBOutlet var homeStayTexLabel: [UILabel]!
    
    @IBOutlet weak var homeStayTexview: UITextView!
    
    var catchHomeStayData:HomestayInfo!
    
    init?(coder:NSCoder,catchHomeStayData:HomestayInfo){
        self.catchHomeStayData = catchHomeStayData
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //抓前一頁丟來的照片
    func catchHomeStayImage(){
        if let url = URL(string: catchHomeStayData.Picture1!){
            URLSession.shared.dataTask(with: url) { data, respind, error in
                if let data = data{
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.homeStayImageView.image = image
                    }
                }
            }.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catchHomeStayImage()
        homeStayTexLabel[0].text = catchHomeStayData.Name
        homeStayTexLabel[1].text = catchHomeStayData.Tel
        homeStayTexLabel[2].text = catchHomeStayData.Add
        homeStayTexview.text = catchHomeStayData.Description
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

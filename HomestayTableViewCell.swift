//
//  HomestayTableViewCell.swift
//  TravelTaiwan-1
//
//  Created by 翁燮羽 on 2021/5/9.
//

import UIKit

class HomestayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeStayImage: UIImageView!
    
    @IBOutlet weak var homeStayLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

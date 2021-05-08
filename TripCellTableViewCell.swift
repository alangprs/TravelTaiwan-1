//cell 資料

import UIKit

class TripCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tripCellImage: UIImageView!
    
    @IBOutlet weak var tripLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

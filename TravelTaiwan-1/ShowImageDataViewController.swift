//第二頁 顯示照片、介紹

import UIKit

class ShowImageDataViewController: UIViewController {

    @IBOutlet weak var showImageVIew: UIImageView!
    
    @IBOutlet var showTex: [UILabel]!
    
    @IBOutlet weak var showDataTex: UITextView!
    
    var showDatas:Info
    
    init?(coder:NSCoder,showDatas:Info){
        self.showDatas = showDatas
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //透過背景抓第一頁傳來的照片
    func catchImageData(){
        if let url = URL(string: showDatas.Picture1!){
            URLSession.shared.dataTask(with: url) { data, respond, error in
                if let data = data,
                   let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.showImageVIew.image = image
                    }
                }
            }.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catchImageData()
        showTex[0].text = showDatas.Name
        showTex[1].text = showDatas.Add
        showTex[2].text = showDatas.Tel
        showDataTex.text = showDatas.Toldescribe
        
        
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

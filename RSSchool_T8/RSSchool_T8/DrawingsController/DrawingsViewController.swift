//
//  DrawingsViewController.swift
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

import UIKit

@objc(ObjPicturePtorocol) protocol PictureProtocol {
    @objc func getPicture(pictureValue: String)
}

class DrawingsViewController: UIViewController {
    
    @IBOutlet weak var planetBtn: DrawingButton!
    @IBOutlet weak var headBtn: DrawingButton!
    @IBOutlet weak var treeBtn: DrawingButton!
    @IBOutlet weak var landscapeBtn: DrawingButton!
    
    @objc weak var delegate:PictureProtocol?
    
    weak var enabledButton: UIButton?
    let lblTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planetBtn.isSelected = false
        headBtn.isSelected = true
        treeBtn.isSelected = false
        landscapeBtn.isSelected = false
        
        self.enabledButton = self.headBtn;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.setupNavigationItems()
    }
    
    func setupNavigationItems() {
        
        lblTitle.text = "Drawings"
        lblTitle.textColor = UIColor.black
        lblTitle.font = UIFont(name: "Montserrat-Regular", size: 17.0)
        lblTitle.sizeToFit()
        
        self.navigationItem.titleView = lblTitle
    }
    
    @IBAction func choosePicture(_ sender: UIButton) {
        if (!sender.isSelected) {
            sender.isSelected = true;
            self.enabledButton?.isSelected = false;
            self.enabledButton = sender;
            
            delegate?.getPicture(pictureValue: (sender.titleLabel?.text)!)
        }
    }
    
}

//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

import UIKit

@objc(ObjTimerProtocol) protocol TimerProtocol {
    @objc func getTimer(timeValue: Float)
}

class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var saveTimerBtn: UIButton!
    
    @objc weak var delegate:TimerProtocol?
    
    var time:Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.timerLabel.text = String(format: "%.2f", sender.value)
        self.timerLabel.text?.append(" s")
        self.time = sender.value;
    }
    
    @IBAction func saveTimerBtn(_ sender: Any) {
        
        delegate?.getTimer(timeValue: self.time)
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}

//
//  ViewController.swift
//  StopWatch03
//
//  Created by dit03 on 2019. 4. 2..
//  Copyright © 2019년 201820028이혜윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimeLabel: UILabel!
    var count = 0
    var myTimer = Timer()
    
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TimeLabel.text = "00:00:00"
    }

    @IBAction func btnPlay(_ sender: Any) {
        if !myTimer.isValid {
            
            //myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            //후행클로저
            myTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {
                (Timer: Timer) -> Void in
                self.count += 1
                let min = self.count / 6000
                let sec = self.count / 100-(min*60)
                let msec = self.count % 100
                let output = String(format: "%02d:%02d:%02d", min, sec, msec)
                self.TimeLabel.text = output
            }
            changeButtonState(start: false, pause: true, stop: true)
        }
    }
    
    @IBAction func btnPause(_ sender: Any) {
        myTimer.invalidate()
        changeButtonState(start: true, pause: false, stop: true)
    }
    
    @IBAction func btnStop(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        TimeLabel.text = "00:00:00"
        changeButtonState(start: true, pause: false, stop: false)
    }
    
    //이거 대신 btnPlay 액션에사 클로저 쓴다
//    @objc func updateTime() {
//        count += 1
//        let min = count / 6000
//        let sec = count / 100-(min*60)
//        let msec = count % 100
//        let output = String(format: "%02d:%02d:%02d", min, sec, msec)
//        TimeLabel.text = output
//    }
    func changeButtonState(start: Bool, pause: Bool, stop: Bool) {
        startButton.isEnabled = start
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop
    }
    
}


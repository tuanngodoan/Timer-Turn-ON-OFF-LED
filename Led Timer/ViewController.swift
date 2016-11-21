//
//  ViewController.swift
//  Led Timer
//
//  Created by Doãn Tuấn on 11/21/16.
//  Copyright © 2016 doantuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _margin = 40
    var numberOfBall = 9
    var lastOnLed = -1
    var check = 0
    var Time:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBall()
        Time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func runningLed(){
        if lastOnLed != -1{
            turnOffLed()
        }
        if check == 0{
            runningLedLR()
        }else{
            runningLedRL()
        }
        
       
    }
    func runningLedRL(){
        if lastOnLed > 0 {
            lastOnLed = lastOnLed - 1
        }else{
            lastOnLed = 1
             check = 0
        }
        turnOnLed()
    }
    func runningLedLR(){
        if lastOnLed < numberOfBall - 1{
            lastOnLed = lastOnLed + 1
        }else{
            lastOnLed = numberOfBall - 2
            check = 1
        }
        turnOnLed()
    }
    
    func turnOnLed(){
        if let ball = self.view.viewWithTag(100+lastOnLed) as? UIImageView
        {
            ball.image = UIImage(named: "green")
        }
    }
    func turnOffLed(){
        if let ball = self.view.viewWithTag(100+lastOnLed) as? UIImageView
        {
            ball.image = UIImage(named: "gray")
        }
    }
    
    func drawBall(){
        
        for indexRow in 0..<numberOfBall {
            for indexCol in 0..<numberOfBall {
                let ball  = UIImage(named: "green")
                
                let ballImage = UIImageView(image: ball)
                
                ballImage.center  = CGPoint(x: CGFloat(indexRow)*spaceBetweenRow()+CGFloat(_margin), y: CGFloat(indexCol)*spaceBetweenCol()+CGFloat(_margin))
                ballImage.tag = indexRow + 100
                self.view.addSubview(ballImage)
            }
        }
        
    }

    
    func spaceBetweenRow() -> CGFloat {
        let width = self.view.bounds.width
        
        return (width-CGFloat(2*_margin))/CGFloat(numberOfBall)
    }
    
    func spaceBetweenCol() -> CGFloat {
        let height = self.view.bounds.height
        
        return (height-CGFloat(2*_margin))/CGFloat(numberOfBall)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}


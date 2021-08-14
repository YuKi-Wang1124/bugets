//
//  ViewController.swift
//  bugets
//
//  Created by 王昱淇 on 2021/8/14.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        // yellow
        addRing(percentage: 55, startAngle: 270, red: 239/255, green: 185/255, blue: 0, alpha: 1)
        addLabel(percentage: 55, startDegree: 270)
        addRing(percentage: 1, startAngle: 270 + (360 * 55/100), red: 0, green: 0, blue: 0, alpha: 0)
        
        // purple
        addRing(percentage: 13, startAngle: 270 + (360 * 56/100), red: 164/255, green: 0, blue: 1, alpha: 1)
        addLabel(percentage: 13, startDegree: 270 + (360 * 56/100))
        addRing(percentage: 1, startAngle: 270 + (360 * 69/100), red: 0, green: 0, blue: 0, alpha: 0)
        
        // pink
        addRing(percentage: 8, startAngle: 270 + (360 * 70/100), red: 248/255, green: 10/255, blue: 177/255, alpha: 1)
        addLabel(percentage: 8, startDegree: 270 + (360 * 70/100))
        addRing(percentage: 1, startAngle: 270 + (360 * 78/100), red: 0, green: 0, blue: 0, alpha: 0)
        
        // green
        addRing(percentage: 6, startAngle: 270 + (360 * 79/100), red: 45/255, green: 182/255, blue: 160/255, alpha: 1)
        addLabel(percentage: 6, startDegree: 270 + (360 * 79/100))
        addRing(percentage: 1, startAngle: 270 + (360 * 85/100), red: 0, green: 0, blue: 0, alpha: 0)
        
        // blue
        addRing(percentage: 5, startAngle: 270 + (360 * 86/100), red: 0/255, green: 174/255, blue: 239/255, alpha: 1)
        addLabel(percentage: 5, startDegree: 270 + (360 * 86/100))
        addRing(percentage: 1, startAngle: 270 + (360 * 91/100), red: 0, green: 0, blue: 0, alpha: 0)
        
        // white
        addRing(percentage: 7, startAngle: 270 + (360 * 92/100), red: 176/255, green: 196/255, blue: 221/255, alpha: 1)
        addLabel(percentage: 7, startDegree: 270 + (360 * 92/100))
        addRing(percentage: 1, startAngle: 270 + (360 * 99/100), red: 0, green: 0, blue: 0, alpha: 0)
        
        // radom color ring
        addRandomColorRing()
        
         }
    
    func addLabel(percentage: CGFloat, startDegree: CGFloat) {
        
        // 把文字放在部分圓環的中間
        let textCenterDegree = startDegree + 360 * percentage/100 * 1/2
        let aDegree = CGFloat.pi/180
        let radius: CGFloat = 100
        let lineWidth: CGFloat = 20
        
        let textPath = UIBezierPath(arcCenter: CGPoint(x: 80 + lineWidth + radius , y: 150 + lineWidth + radius), radius: radius, startAngle: aDegree * textCenterDegree, endAngle: aDegree * textCenterDegree, clockwise: true)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "\(percentage)%"
        label.sizeToFit()
        label.center = textPath.currentPoint
        view.addSubview(label)
    }

    
    func addRing(percentage: CGFloat, startAngle: CGFloat, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        
        let lineWidth: CGFloat = 20
        let radius: CGFloat = 100
        let aDegree = CGFloat.pi/180
        let percentage: CGFloat = percentage
        let startAngle: CGFloat = startAngle
        
        let percentagePath = UIBezierPath(arcCenter: CGPoint(x: 80 + lineWidth + radius , y: 150 + lineWidth + radius), radius: radius, startAngle: aDegree * startAngle, endAngle: aDegree * (startAngle + 360 * percentage/100), clockwise: true)
        
        let percentageLayer = CAShapeLayer()
        percentageLayer.path = percentagePath.cgPath
        percentageLayer.lineWidth = lineWidth
        percentageLayer.strokeColor = CGColor(red: red, green: green, blue: blue, alpha: alpha)
        percentageLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(percentageLayer)
        
    }
    
    func addRandomColorRing() {
        let aDegree = CGFloat.pi/180
        let lineWidth: CGFloat = 60
        let radius: CGFloat = 80
        var startDegree: CGFloat = 270
        let center = CGPoint(x: 60 + lineWidth + radius, y: 450 + lineWidth + radius)
        var percentages: [CGFloat] = [26, 14, 8, 32, 20]
        
        for percentage in percentages {
            let endDegree = startDegree + 360 * percentage / 100
            let percentagePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * endDegree, clockwise: true)
            
            let percentageLayer = CAShapeLayer()
            percentageLayer.path = percentagePath.cgPath
            percentageLayer.strokeColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 0.5).cgColor
            percentageLayer.fillColor = UIColor.clear.cgColor
            percentageLayer.lineWidth = lineWidth
            view.layer.addSublayer(percentageLayer)
            
            let textCenterDegree = startDegree + (360 * percentage/100) * 1/2
            let textPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * textCenterDegree, clockwise: true)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
            label.backgroundColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 14)
            label.text = "\(percentage)%"
            label.sizeToFit()
            label.center = textPath.currentPoint
            view.addSubview(label)
            
            startDegree = endDegree
            
        }
        
    }
    
}


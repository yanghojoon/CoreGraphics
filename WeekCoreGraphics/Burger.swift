//
//  Burger.swift
//  WeekCoreGraphics
//
//  Created by 양호준 on 2022/02/19.
//

import UIKit

@IBDesignable
class Burger: UIView { // ImageView로 그려지지 않음.
    @IBInspectable private var lineWidth: CGFloat = 10
    @IBInspectable private var pattyColor: UIColor = .systemBrown
    @IBInspectable private var lettuceColor: UIColor = .systemGreen
    @IBInspectable private var tomatoColor: UIColor = .systemRed
    @IBInspectable private var cheeseColor: UIColor = .systemOrange
    
    override func draw(_ rect: CGRect) {
        let width = frame.width
        let height = frame.height
        let pattyStartPoint = CGPoint(x: width * 0.1,
                                      y: height * 0.42)
        let pattyEndPoint = CGPoint(x: width * 0.9,
                                    y: height * 0.42)
        
        drawTopBread(start: pattyStartPoint, end: pattyEndPoint)
        drawButtomBread()
        drawPatty()
        for iterateNumber in 0...3 {
            let time = Double(iterateNumber) * 0.2
            drawLettuce(per: time)
        }
        drawTomato()
        for time in 0...22 {
            let interval = Double(time) * 0.035
            drawCheese(per: interval)
        }
    }
    
    func drawTopBread(start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        path.move(to: start) // 시작점을 정함
        pattyColor.set()
        path.addCurve(to: end,
                      controlPoint1: CGPoint(x: frame.width * 0.15, y: frame.height * 0.2),
                      controlPoint2: CGPoint(x: frame.width * 0.85, y: frame.height * 0.2))
        path.close()
        path.stroke()
    }
    
    func drawCheese(per: CGFloat) {
        let startX = frame.width * (0.1 + per)
        let endX = frame.width * (0.13 + per)
        
        let path = UIBezierPath()
        path.lineWidth = 5
        path.move(to: CGPoint(x: startX, y: frame.height * 0.45))
        path.addLine(to: CGPoint(x: endX, y: frame.height * 0.5))
        UIColor.systemOrange.set()
        path.stroke()
    }
    
    func drawTomato() {
        let pattern: [CGFloat] = [frame.width * 0.36, frame.width * 0.04]
        let path = UIBezierPath()
        path.lineWidth = 20
        path.move(to: CGPoint(x: frame.width * 0.12,
                              y: frame.height * 0.53))
        path.addLine(to:  CGPoint(x: frame.width * 0.88,
                                  y: frame.height * 0.53))
        path.setLineDash(pattern, count: 2, phase: 0)
        UIColor.systemRed.set()
        path.stroke()
    }
    
    func drawLettuce(per: CGFloat) {
        let startLineX = frame.width * 0.1 + frame.width * per
        let endLineX = frame.width * 0.3 + frame.width * per
        let controlPoint1X = frame.width * 0.15 + frame.width * per
        let controlPoint2X = frame.width * 0.25 + frame.width * per
        
        let path = UIBezierPath()
        path.lineWidth = 15
        path.lineCapStyle = .round
        path.move(to: CGPoint(x: startLineX,
                              y: frame.height * 0.58))
        path.addCurve(to: CGPoint(x: endLineX, y: frame.height * 0.58),
                      controlPoint1: CGPoint(x: controlPoint1X, y: frame.height * 0.61),
                      controlPoint2: CGPoint(x: controlPoint2X, y: frame.height * 0.55))
        UIColor.systemGreen.set()
        
        path.stroke()
    }
    
    func drawPatty() {
        let path = UIBezierPath()
        path.lineWidth = 30
        path.lineCapStyle = .round
        path.move(to: CGPoint(x: frame.width * 0.09, y: frame.height * 0.65))
        path.addLine(to: CGPoint(x: frame.width * 0.91, y: frame.height * 0.65))
        path.stroke()
    }
    
    func drawButtomBread() {
        let path = UIBezierPath(roundedRect: CGRect(x: frame.width * 0.1, y: frame.height * 0.7, width: frame.width * 0.8, height: frame.height * 0.1), cornerRadius: 10)
        path.lineWidth = lineWidth
        path.stroke()
    }
}

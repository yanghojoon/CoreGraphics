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
                                      y: height * 0.15)
        let pattyEndPoint = CGPoint(x: width * 0.9,
                                    y: height * 0.15)
        
        drawTopBread(start: pattyStartPoint, end: pattyEndPoint)
        drawButtomBread()
        drawPatty()
    }
    
    func drawTopBread(start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        path.move(to: start) // 시작점을 정함
        path.addArc(withCenter: CGPoint(x: frame.width / 2, y: frame.height * 0.15), radius: 15, startAngle: 0, endAngle: .pi, clockwise: false)
        pattyColor.set()
        path.stroke()
    }
    
    func drawPatty() {
        let path = UIBezierPath()
        path.lineWidth = 30
        path.lineCapStyle = .round
        path.move(to: CGPoint(x: frame.width * 0.09, y: frame.height * 0.63))
        path.addLine(to: CGPoint(x: frame.width * 0.91, y: frame.height * 0.63))
        path.stroke()
    }
    
    func drawButtomBread() {
        let path = UIBezierPath(roundedRect: CGRect(x: frame.width * 0.1, y: frame.height * 0.7, width: frame.width * 0.8, height: frame.height * 0.1), cornerRadius: 10)
        path.lineWidth = lineWidth
        path.stroke()
    }
}

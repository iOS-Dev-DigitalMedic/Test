//
//  barGraphView.swift
//  Test
//
//  Created by PNT001 on 2022/08/03.
//

import UIKit

class barGraphView: UIView {
    private let mainLayer: CALayer = CALayer()
    private let scrollView: UIScrollView = UIScrollView()
    let space: CGFloat = 50.0
    let barWidth: CGFloat = 30.0
    let contentSpace: CGFloat = 44.0
      
    var dataEntries: [TestData] = [] {
    didSet {
       mainLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
        scrollView.contentSize = CGSize(width: frame.size.width, height: frame.size.height)
       mainLayer.frame = CGRect(x: 0, y: 0, width:
       scrollView.contentSize.width, height:
       scrollView.contentSize.height)
        mainLayer.backgroundColor = UIColor.purple.cgColor
        drawLines()
       for i in 0..<dataEntries.count {
          showEntry(index: i, entry: dataEntries[i])
       }
     }
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupView()
    }
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
       scrollView.layer.addSublayer(mainLayer)
       addSubview(scrollView)
    }
    override func layoutSubviews() {
       scrollView.frame = CGRect(x: 0, y: 0, width: frame.size.width,
       height: frame.size.height)
    }
    
    private func showEntry(index: Int, entry: TestData) {
       
        let xPos: CGFloat = space + CGFloat(index) * (barWidth + space)
        let yPos: CGFloat = translateWidthValueToXPosition(value:
        Float(entry.score) / Float(10.0))
        
        
        
        drawBar(xPos: xPos, yPos: yPos)
        drawTextValue(xPos: xPos, yPos: self.frame.size.height - yPos - (35 + barWidth), textValue: "\(entry.score)")
        drawTitle(xPos: xPos, yPos: self.frame.size.height - 14, width: 70, height:
       150, title: entry.title)
    }
    
    private func drawTextValue(xPos: CGFloat, yPos: CGFloat, textValue: String) {
       let textLayer = CATextLayer()
       textLayer.frame = CGRect(x: xPos, y: yPos, width: barWidth, height: barWidth)
       textLayer.foregroundColor = UIColor.white.cgColor
       textLayer.backgroundColor = UIColor.black.cgColor
       textLayer.alignmentMode = CATextLayerAlignmentMode.center
       textLayer.contentsScale = UIScreen.main.scale
       textLayer.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 14.0).fontName as CFString, 0, nil)
       textLayer.fontSize = 20
       textLayer.string = textValue
        
        
       mainLayer.addSublayer(textLayer)
        
        let stickWidth = 2.0
        let stick = CALayer()
        stick.frame = CGRect(x: (textLayer.frame.size.width / 2) - (stickWidth / 2), y: textLayer.frame.size.height, width: stickWidth, height: 7.0)
        stick.backgroundColor = UIColor.black.cgColor
        textLayer.addSublayer(stick)
    
        
        
        
    }
    
    private func drawTitle(xPos: CGFloat, yPos: CGFloat, width: CGFloat, height: CGFloat = 22, title: String) {
       let textLayer = CATextLayer()
        print(xPos)
        print(yPos)
        textLayer.frame = CGRect(x: xPos - 20, y: yPos, width: width, height: height)
        
       textLayer.foregroundColor = UIColor.black.cgColor
       textLayer.backgroundColor = UIColor.clear.cgColor
       textLayer.alignmentMode = CATextLayerAlignmentMode.center
       textLayer.contentsScale = UIScreen.main.scale
       textLayer.font = CTFontCreateWithName(UIFont.boldSystemFont(ofSize: 14.0).fontName as CFString, 0, nil)
       textLayer.fontSize = 14
       textLayer.string = title
       mainLayer.addSublayer(textLayer)
    }
    
    private func translateWidthValueToXPosition(value: Float) -> CGFloat
    {

       let width = CGFloat(value) * (mainLayer.frame.width - space)
       return abs(width)
    }

    private func drawBar(xPos: CGFloat, yPos: CGFloat) {
        let barLayer = CALayer()
        barLayer.frame = CGRect(x: xPos, y: self.frame.size.height - yPos - 20, width: barWidth, height: yPos)
        barLayer.backgroundColor = UIColor.red.cgColor
        mainLayer.addSublayer(barLayer)
    }
    
    private func drawLines() {
        //horizontal
        let horizontalLineLayer = CALayer()
        horizontalLineLayer.frame = CGRect(x: 30, y: self.frame.size.height - 20, width: self.frame.size.width - 60, height: 2)
        horizontalLineLayer.backgroundColor = UIColor.black.cgColor
        mainLayer.addSublayer(horizontalLineLayer)
        
        //vertical
        let verticalLineLayer = CALayer()
        verticalLineLayer.frame = CGRect(x: 30, y: 30, width: 2, height: self.frame.size.height - 50)
        verticalLineLayer.backgroundColor = UIColor.black.cgColor
        mainLayer.addSublayer(verticalLineLayer)
    }
}

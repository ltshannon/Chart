//
//  PieChartData.swift
//  SwiftUI-PieChart
//
//  Created by Kent Winder on 3/17/20.
//  Copyright © 2020 Nextzy. All rights reserved.
//

import Foundation
import SwiftUI

class PieChartData: ObservableObject {
    @Published private(set) var data: [SlideData] = []
    
    init(data: [String : Double], state: String) {
        var currentAngle: Double = -90
        var slides: [SlideData] = []
        var total = 0.0
        var extra = 0.0
        var extraSlide = false
        
        for (_, value) in data {
            total += value
        }
        
        for (key, value) in data {
            
            let percentage = value / total * 100
            
            if percentage < 2 {
                extra += value
                if state == key {
                    extraSlide = true
                }
                continue
            }
            
            var slide = SlideData()
            slide.annotation = String(format: "%.1f%", percentage)
            let dataItem = DataItem(name: key, value: value)
            if state == key {
                dataItem.highlighted = true
            }
            slide.data = dataItem
            
            BuildSlide(slide: &slide, currentAngle: &currentAngle, value: value, total: total)
            slides.append(slide)
        }
        
        if extra > 0 {
            var slide = SlideData()
            let dataItem = DataItem(name: "", value: extra)
            if extraSlide {
                dataItem.highlighted = true
            }
            slide.data = dataItem
            slide.annotation = "< 2%"
            
            BuildSlide(slide: &slide, currentAngle: &currentAngle, value: extra, total: total)
            
            slides.append(slide)

        }
        
        self.data = slides
    }
    
    init(data: [SlideData]) {
        self.data = data
    }
    
    func BuildSlide( slide: inout SlideData, currentAngle: inout Double, value: Double, total: Double) {
        
        slide.startAngle = .degrees(currentAngle)
        let angle = value * 360 / total
        let alpha = currentAngle + angle / 2
        currentAngle += angle
        slide.endAngle = .degrees(currentAngle)
        
        let deltaX = CGFloat(cos(abs(alpha).truncatingRemainder(dividingBy: 90.0) * .pi / 180.0))
        let deltaY = CGFloat(sin(abs(alpha).truncatingRemainder(dividingBy: 90.0) * .pi / 180.0))
        var padding: CGFloat = 0.0
        var paddingX: CGFloat = 0.0
        var paddingY: CGFloat = 0.0
        if slide.data.highlighted {
            padding = 0.15
            paddingX = deltaX * 20.0
            paddingY = deltaY * 20.0
        }
        
        let annotationDeltaX = deltaX * (0.7 + padding)
        let annotationDeltaY = deltaY * (0.7 + padding)
        if -90 <= alpha && alpha < 0 {
            slide.deltaX = paddingX
            slide.deltaY = -paddingY
            slide.annotationDeltaX = annotationDeltaX
            slide.annotationDeltaY = -annotationDeltaY
        } else if 0 <= alpha && alpha < 90 {
            slide.deltaX = paddingX
            slide.deltaY = paddingY
            slide.annotationDeltaX = annotationDeltaX
            slide.annotationDeltaY = annotationDeltaY
        } else if 90 <= alpha && alpha < 180 {
            slide.deltaX = -paddingY
            slide.deltaY = paddingX
            slide.annotationDeltaX = -annotationDeltaY
            slide.annotationDeltaY = annotationDeltaX
        } else {
            slide.deltaX = -paddingX
            slide.deltaY = -paddingY
            slide.annotationDeltaX = -annotationDeltaX
            slide.annotationDeltaY = -annotationDeltaY
        }
        
    }
    
}

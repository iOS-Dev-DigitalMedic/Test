//
//  SwiftUIView.swift
//  Test
//
//  Created by PNT001 on 2022/08/16.
//

import SwiftUI
import Charts

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

var data: [ToyShape] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4)
]

struct SwiftUIView: View {
    var body: some View {
        Chart {
            BarMark(
                    x: .value("Shape Type", data[0].type),
                    y: .value("Total Count", data[0].count)
                )
                BarMark(
                     x: .value("Shape Type", data[1].type),
                     y: .value("Total Count", data[1].count)
                )
                BarMark(
                     x: .value("Shape Type", data[2].type),
                     y: .value("Total Count", data[2].count)
                )
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

//
//  ShapeCreator.swift
//  OOP
//
//  Created by Admin on 05.05.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import Foundation
import CoreGraphics

protocol ShapeCreator {
    func shape(stroke: Stroke, fill: Fill, firstPoint: CGPoint) -> Shape
    func shape(from container: KeyedDecodingContainer<ShapeExternalCodingKeys>) throws -> Shape
    func shapeName() -> String
}

//
//  TimeLineCellModel.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import Foundation

enum TextPosition: Int {
    case right = 0
    case left = 1
}

struct TimeLineCellModel
{
    var shouldLoad: Bool
    var isThisCurrentStep: Bool?
    var textPosition: TextPosition?
}


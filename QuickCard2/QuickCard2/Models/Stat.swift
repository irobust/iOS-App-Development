//
//  Stat.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import Foundation

struct Stat: Identifiable {
    let id = UUID()
    var requests: Int
    var completed: Int
    var satisfaction: Int
    var delayDays: Int
    var duration: Int
}

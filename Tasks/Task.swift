//
//  Task.swift
//  Tasks
//
//  Created by Dennis Dang on 6/9/19.
//  Copyright © 2019 Dennis Dang. All rights reserved.
//

import SwiftUI

struct Task: Equatable, Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}

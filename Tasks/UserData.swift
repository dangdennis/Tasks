//
//  UserData.swift
//  Tasks
//
//  Created by Dennis Dang on 6/9/19.
//  Copyright © 2019 Dennis Dang. All rights reserved.
//

import Combine
import SwiftUI

private let defaultTasks: [Task] = [
    Task(title: "Todo item 1", isDone: false),
    Task(title: "Todo Item 2", isDone: true)
]

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    @UserDefaultValue(key: "Tasks", defaultValue: defaultTasks)
    
    var tasks: [Task] {
        didSet {
            didChange.send(self)
        }
    }
}


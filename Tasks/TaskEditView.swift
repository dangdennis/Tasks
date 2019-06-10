//
//  TaskEditView.swift
//  Tasks
//
//  Created by Dennis Dang on 6/10/19.
//  Copyright © 2019 Dennis Dang. All rights reserved.
//

import SwiftUI

struct TastEditView: View {
    @EnvironmentObject var userData: UserData
    private let task: Task
    private var draftTitle: State<String>
    
    var body: some View {
        let inset = EdgeInsets(top: -8, leading: -10, bottom: -7, trailing: -10)
        return VStack(alignment: .leading, spacing: 0) {
            TextField(
                self.draftTitle.binding,
                placeholder: Text("Enter New Title..."),
                onEditingChanged: { _ in self.updateTask() },
                onCommit: {}
            )
            
        }
    }
    
    private func updateTask() {
        guard let index = self.userData.tasks.firstIndex(of: self.task) else { return }
        self.userData.tasks[index].title = self.draftTitle.value
    }
}

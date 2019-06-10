//
//  TaskItemView.swift
//  Tasks
//
//  Created by Dennis Dang on 6/9/19.
//  Copyright © 2019 Dennis Dang. All rights reserved.
//

import SwiftUI

struct TaskItemView: View {
    @EnvironmentObject var userData: UserData
    
    let task: Task
    @Binding var isEditing: Bool
    
    var body: some View {
        return HStack {
            Button(action: { self.toggleDone() }) {
                Text(self.task.title)
            }
        }
    }
    
    private func toggleDone() {
        guard !self.isEditing else { return }
        guard let index = self.userData.tasks.firstIndex(where: { $0.id == self.task.id }) else { return }
        self.userData.tasks[index].isDone.toggle()
    }
    
    private func delete() {
        self.userData.tasks.removeAll(where: { $0.id == self.task.id })
        if self.userData.tasks.isEmpty {
            self.isEditing = false
        }
    }
}



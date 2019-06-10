//
//  TaskListView.swift
//  Tasks
//
//  Created by Dennis Dang on 6/9/19.
//  Copyright © 2019 Dennis Dang. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var userData: UserData
    @State var draftTitle: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        List {
            TextField($draftTitle, placeholder: Text("Create a New Task..."), onCommit: self.createTask)
            ForEach(self.userData.tasks) { task in
                TaskItemView(task: task, isEditing: self.$isEditing)
            }
        }
        .navigationBarItem(title: Text("Tasks"))
        .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
            if !self.isEditing {
                Text("Edit")
            } else {
                Text("Done").bold()
            }
        })
    }
    
    private func createTask() {
        let newTask = Task(title: self.draftTitle, isDone: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.draftTitle = ""
    }
}

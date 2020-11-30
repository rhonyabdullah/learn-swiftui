//
//  ContentView.swift
//  Adding Items By State
//
//  Created by Rhony on 30/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var id = 0
    @State var tasks = [Task]()

    private func addTask() {
        tasks.append(Task(name: "Task for \(id)"))
        id = id + 1
    }

    var body: some View {
        List {
            Button(action: addTask, label: {
                Text("Add Task")
            })
            ForEach(tasks) { task in
                Text(task.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

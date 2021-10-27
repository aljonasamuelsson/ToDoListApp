//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Aljona Samuelsson on 2021-10-27.
//

import SwiftUI
import CoreData
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDO : String = ""
    
    var searchBar : some View {
        HStack {
            TextField("Enter new task", text: self.$newToDO)
            Button(action: self.addNewToDo, label: { Text("Add New")
                   })
        }
    }
    func addNewToDo(){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDO))
        self.newToDO = ""
        
        //Add auto generated id in the future.
    }
    
    var body: some View{
        NavigationView{
            VStack{
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks){
                        task in
                        Text(task.toDoItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                    }
                   
                }.navigationBarTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
            }
        }
    func move(from source : IndexSet, to destination : Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
}
    func delete(at offsets : IndexSet){
        taskStore.tasks.remove(atOffsets: offsets)
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

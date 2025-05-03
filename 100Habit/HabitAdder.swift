//
//  HabitAdder.swift
//  100Habit
//
//  Created by Kiran Shrestha on 5/3/25.
//

import SwiftUI

struct HabitAdder: View {
    @Environment(\.dismiss) var dismiss
    @State var showAlert : Bool = false;
    
    @State var name : String = ""
    @State var description : String = ""
    @Binding var habits : [Habit]
    
    var body: some View {
        Form {
            Section("Habit Name") {
                TextField("Name your habit", text: $name)
            }
            
            Section("Habit Description") {
                TextField("Description here", text: $description)
            }
            
            Button {
                if name.isEmpty || description.isEmpty {
                    showAlert = true
                }
                else {
                    habits.append(Habit(name: name, description: description, completionCount: 0))
                    dismiss()
                }
            } label: {
                Label("Add", systemImage: "plus.square.on.square")
                    .foregroundStyle(.white)
            }
            .padding()
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
            .listRowBackground(Color.clear)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .toolbar {
            Button("Cancel") {
                dismiss()
            }
        }
        .alert("Alert", isPresented: $showAlert, actions: {Button("Okay"){showAlert = false}}, message: {Text("You cannot leave the name or description empty. Please populate.")})
    }
}

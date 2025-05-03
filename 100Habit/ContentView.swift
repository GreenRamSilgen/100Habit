//
//  ContentView.swift
//  100Habit
//
//  Created by Kiran Shrestha on 5/2/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitManager = Tracker()
    @State var showHabitAdder = false
    var body: some View {
        NavigationStack{
            VStack {
                List(habitManager.allHabits){ habit in
                    NavigationLink("\(habit.name) - \(habit.completionCount)", value: habit.id)
                }.navigationDestination(for: UUID.self){ selection in
                    //TODO: Use HabitView, maybe need to create initializer to take habitview and get/set the data within the initializer.
                    Text(habitManager.allHabits.first{$0.id == selection}?.description ?? "Error")
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button("Add") {
                    showHabitAdder = true
                }
            }
            .sheet(isPresented: $showHabitAdder, content: {
                HabitAdder(habits: $habitManager.allHabits)
            })
        }
    }
}

#Preview {
    ContentView()
}

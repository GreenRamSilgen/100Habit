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
                    HabitView(habits: $habitManager.allHabits, currentHabitIdx: habitManager.allHabits.firstIndex(where: {
                        $0.id == selection
                    })!)
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

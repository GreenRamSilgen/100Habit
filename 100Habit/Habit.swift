//
//  Habit.swift
//  100Habit
//
//  Created by Kiran Shrestha on 5/2/25.
//

import Foundation

struct Habit : Identifiable {
    var name : String
    var description : String
    var completionCount : Int
    var id = UUID()
}

class Tracker : ObservableObject {
    @Published var allHabits : [Habit] = [Habit(name: "Hydration", description: "Drink 1 cup of water.", completionCount: 0),
                               Habit(name: "Meditation", description: "Meditation for 10 minutes.", completionCount: 0)]
}

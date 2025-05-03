//
//  HabitView.swift
//  100Habit
//
//  Created by Kiran Shrestha on 5/2/25.
//

import SwiftUI

struct HabitView: View {
    @Binding var habits : [Habit]
    var currentHabitIdx : Int
    
    var body: some View {
        VStack {
            Text(habits[currentHabitIdx].name)
                .font(.largeTitle)
            Text(habits[currentHabitIdx].description)
            HStack {
                Button {
                    habits[currentHabitIdx].completionCount -= 1
                } label: {
                    Image(systemName: "arrowshape.down.fill")
                        .foregroundColor(.red)
                    
                }
                Text("\(habits[currentHabitIdx].completionCount)")
                Button {
                    habits[currentHabitIdx].completionCount += 1
                } label: {
                    Image(systemName: "arrowshape.up.fill")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var habitManager = Tracker()
    HabitView(habits: $habitManager.allHabits, currentHabitIdx: 1)
}

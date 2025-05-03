//
//  HabitView.swift
//  100Habit
//
//  Created by Kiran Shrestha on 5/2/25.
//

import SwiftUI

struct HabitView: View {
    let name : String
    let description : String
    var count : Int
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
            Text(description)
            HStack {
                Button {
                    //TODO: DECREASE COUNT ACTION
                } label: {
                    Image(systemName: "arrowshape.down.fill")
                        .foregroundColor(.red)
                    
                }
                Text("\(count)")
                Button {
                    //TODO: DECREASE COUNT ACTION
                } label: {
                    Image(systemName: "arrowshape.up.fill")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

#Preview {
    HabitView(name: "Water", description: "Drink IT!", count: 50)
}

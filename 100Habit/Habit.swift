//
//  Habit.swift
//  100Habit
//
//  Created by Kiran Shrestha on 5/2/25.
//

import Foundation
import Combine

struct Habit : Identifiable, Decodable, Encodable {
    var name : String
    var description : String
    var completionCount : Int
    var id = UUID()
}

class Tracker : ObservableObject {
    @Published(key: "habits") var allHabits : [Habit] = [Habit(name: "Hydration", description: "Drink 1 cup of water.", completionCount: 0),
                                          Habit(name: "Meditation", description: "Meditation for 10 minutes.", completionCount: 0)] {
        didSet {
            
        }
    }
}

//private var cancellables = [String:AnyCancellable]()
//extension Published {
//    init(wrappedValue value: Value, key: String) {
//        let value = UserDefaults.standard.object(forKey: key) as? Value ?? value
//        self.init(initialValue: value)
//        cancellables[key] = projectedValue.sink { val in
//            UserDefaults.standard.set(val, forKey: key)
//        }
//    }
//}

private var cancellableSet: Set<AnyCancellable> = []

extension Published where Value: Codable {
    init(wrappedValue defaultValue: Value, key: String) {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let value = try JSONDecoder().decode(Value.self, from: data)
                self.init(initialValue: value)
            } catch {
                print("🐞🐞🐞Error while deconding yser data")
                self.init(initialValue: defaultValue)
            }
        } else {
            self.init(initialValue: defaultValue)
        }

        projectedValue
            .sink { val in
                do {
                    let data = try JSONEncoder().encode(val)
                    UserDefaults.standard.set(data, forKey: key)
                } catch {
                    print("Error while decoding user data")
                }
            }
            .store(in: &cancellableSet)
    }
}

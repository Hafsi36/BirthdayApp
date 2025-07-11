//
//  ContentView.swift
//  Birthday App
//
//  Created by Hafsa Ahmad on 11/07/2025.
//

import SwiftUI


struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Dani", birthday: .now),
        Friend(name: "Hani", birthday: .now)
    ]
    
    @State private var newName: String = ""
    @State private var newBirthday: Date = Date()
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 10) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)

                    DatePicker("Birthday", selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding(.horizontal)
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 5)
                
                }
                .padding()
                .background(Color(UIColor.systemBackground))
            }
        }
    }
}

#Preview {
    ContentView()
}

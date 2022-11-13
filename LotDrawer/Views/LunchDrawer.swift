//
//  LunchDrawer.swift
//  LotDrawer
//
//  Created by Jiaming Guo on 2022-11-13.
//

import SwiftUI

struct LunchDrawer: View {
    @StateObject var optionList = OptionList()
    @State private var showingAddForm = false
    @State private var newOptionName = ""
    @State private var selectionAmountIndex = 0
    @State private var selectedOptions: [Option] = []
    @State private var selectAlertShown = false
    @State private var selectionMessage = ""
    
    func pick() {
        if selectionAmountIndex == 0 || optionList.options.count <= 1 {
            selectedOptions = optionList.pick(number: 1)
        } else {
            selectedOptions = optionList.pick(number: 2)
        }
        if selectedOptions.count == 1 {
            selectionMessage = selectedOptions[0].name
        } else {
            selectionMessage = "\(selectedOptions[0].name) and \(selectedOptions[1].name)"
        }
        selectAlertShown = true
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section {
                        Picker(selection: $selectionAmountIndex, label: Text("Max Selection Amount")) {
                            ForEach(1..<3) {
                                Text("\($0)")
                            }
                        }
                    }
                    if optionList.options.count > 0 {
                        Section {
                            ForEach(optionList.options) { option in
                                Text(option.name)
                            }
                            .onDelete(perform: { offset in
                                optionList.remove(at: offset)
                            })
                        } header: {
                            Text("Options")
                        }
                        
                        Section {
                            Button("Pick \(selectionAmountIndex + 1)") {
                                pick()
                            }
                            Button("Reset", role: .destructive) {
                                optionList.reset()
                            }
                        }
                    }
                }
                .navigationTitle("Lunch Picker")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        newOptionName = ""
                        showingAddForm = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddForm) {
                    NavigationView {
                        Form {
                            Section {
                                TextField("name", text: $newOptionName)
                                    .keyboardType(.default)
                            } header: {
                                Text("Enter the name for the new option")
                            }
                        }
                        .navigationTitle("Add a new option")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            Button("Add") {
                                optionList.add(name: newOptionName)
                                showingAddForm = false
                            }
                            .disabled(newOptionName == "")
                        }
                    }
                }
                if optionList.options.count == 0 {
                    VStack {
                        Text("No options")
                            .font(.title)
                        Text("Tap + to add a new option")
                            .font(.subheadline)
                    }
                    .foregroundColor(.secondary)
                }
            }
        }
        .alert("Picked selection for you", isPresented: $selectAlertShown) {
            Button("OK", action: {})
        } message: {
            Text(selectionMessage)
        }
    }
}

struct LunchDrawer_Previews: PreviewProvider {
    static var previews: some View {
        LunchDrawer()
    }
}

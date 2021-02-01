//
//  ContentView.swift
//  Tamagotchi
//
//  Created by Zhenglong Wu on 22/01/2021.
//

import Foundation

import SwiftUI

struct ContentView: View {
    
    @StateObject var tamagotchi = Tamagotchi()
    @State var status: String = ""
    
    @State private var snack = false
    @State private var meal = false
    @State private var game = false
    @State private var medicine = false
    @State private var toilet = false
    
    var snackEnabled: Bool {
        if tamagotchi.hunger >= 5{
            return false
        }
        else{
            return true
        }
    }
    var mealEnabled: Bool {
        if tamagotchi.hunger >= 5{
            return false
        }
        else{
            return true
        }
    }
    var medicineEnabled: Bool {
        if tamagotchi.health >= 5{
            return false
        }
        else{
            return true
        }
    }
    
    
    
    let ageTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    let droppingsTimer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
     
    var body: some View {
    
        
        ZStack{
            VStack{
                Form{
                    VStack(alignment: .leading){
                        
                        Text("\(tamagotchi.displayStats())")
                            .onReceive(ageTimer) { _ in
                                if tamagotchi.age >= 0 {
                                    tamagotchi.age += 1
                                    status = "Tamagotchi grew!"
                                }
                            }
                            .onReceive(droppingsTimer) { _ in
                                if tamagotchi.droppings >= 0 {
                                    tamagotchi.droppings += 1
                                    status = "Tamagotchi needs to be cleaned!"
                                }
                            }
                            
                        Spacer()
                    }
                    .padding(.top, 5)
                    VStack{
                        Text(status)
                            .bold()
                            .font(.system(.title))
                    }
                    .padding()

                    Section{
                        Button("Give snack", action: {
                            tamagotchi.eatSnack()
                            status = "Ate snack!"
                        })
                        .disabled(!snackEnabled)
                        Button("Give meal", action: {
                            tamagotchi.eatMeal()
                            status = "Had a meal!"
                        })
                        .disabled(!mealEnabled)
                        Button("Play game", action: {
                            tamagotchi.playGame()
                            status = "Played game!"
                        })
                        Button("Give medicine", action: {
                            tamagotchi.takeMedicine()
                            status = "Took medicine!"
                        })
                        .disabled(!medicineEnabled)
                        Button("Clean up", action: {
                            tamagotchi.beCleanedUp()
                            status = "Mess cleaned up!"
                        })
                        Button("Go to toilet", action: {
                            tamagotchi.goToToilet()
                            status = "Went to toilet!"
                        })
                    }
                }

            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//
//  ContentView.swift
//  Tamagotchi
//
//  Created by Zhenglong Wu on 22/01/2021.
//

import Foundation

import SwiftUI

import UserNotifications

struct ContentView: View {
    
    @StateObject var tamagotchi = Tamagotchi()
    @State var status: String = ""
    
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
    var droppingsEnabled: Bool {
        if tamagotchi.droppings <= 0{
            return false
        }
        else{
            return true
        }
    }
    
    var isIll: Bool {
        if tamagotchi.health == 1  || tamagotchi.droppings > 5{
            tamagotchi.beIll()
            return true
        }
        else{
            return false
        }
    }
    
    var hasDied: Bool {
        if tamagotchi.health == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    
    
    let ageTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    let droppingsTimer = Timer.publish(every: 25, on: .main, in: .common).autoconnect()
    
    var hungerTimer = Timer.publish(every: 35, on: .main, in: .common).autoconnect()
    
    // I have set the timers to have relatively small intervals so that it is easier to test in the simulator
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Form{
                    
                    VStack(alignment: .leading){
                        
                        Text("\(tamagotchi.displayStats())")
                            .onReceive(ageTimer) { _ in
                                if tamagotchi.age >= 0 {
                                    tamagotchi.grow()
                                    status = "Tamagotchi grew!"
                                }
                            }
                            .onReceive(droppingsTimer) { _ in
                                if tamagotchi.droppings >= 0 {
                                    tamagotchi.drop()
                                    status = "Tamagotchi needs to be cleaned!"
                                    if tamagotchi.droppings > 5 {
                                        tamagotchi.getHurt()
                                        tamagotchi.getUnHappy()
                                        status = "Tamagotchi needs to be cleaned, and is hurting!"
                                    }
                                }
                            }
                            .onReceive(hungerTimer, perform: { _ in
                                if tamagotchi.hunger > 0 {
                                    tamagotchi.getHungry()
                                    if tamagotchi.hunger <= 0 {
                                        status = "Tamagotchi is hungry!"
                                    }
                                }
                            })
                            
                        
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    VStack{
                        
                        Text(status)
                            .bold()
                            .font(.title)
                            .padding()
                        
                    }
                    .padding()

                    Section(){
                        Button("Give snack", action: {
                            tamagotchi.eatSnack()
                            status = "Ate snack!"
                        })
                            .disabled(!snackEnabled)
                            .disabled(hasDied)
                        Button("Give meal", action: {
                            tamagotchi.eatMeal()
                            status = "Had a meal!"
                        })
                            .disabled(!mealEnabled)
                            .disabled(hasDied)
                        Button("Play game", action: {
                            tamagotchi.playGame()
                            status = "Played game!"
                        })
                            .disabled(hasDied)
                        Button("Give medicine", action: {
                            tamagotchi.takeMedicine()
                            status = "Took medicine!"
                        })
                            .disabled(!medicineEnabled)
                            .disabled(hasDied)
                        //.disabled(hasDied)
                        Button("Clean up", action: {
                            tamagotchi.beCleanedUp()
                            status = "Mess cleaned up!"
                        })
                        .   disabled(!droppingsEnabled)
                            .disabled(hasDied)
                    }
                    
                }
                
                VStack{
                    NavigationLink(destination: EndGameView()) {
                        Text("Continue")
                        .bold()
                        .padding()
                        .offset(y: 13)
                    }
                    .navigationBarTitle("Tamagotchi")
                    .opacity(!hasDied ? 0 : 1)
                    .disabled(!hasDied)
                }

            }
            
        }
        .navigationTitle("Tamagotchi")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//
//  User.swift
//  RoommateFinder
//
//  Created by Brandon Lee, Harshil Shah, Kimmillie on 3/31/18.
//  Copyright © 2018 Brandon Lee, Harshil Shah, Kimmillie Tran. All rights reserved.
//

import Foundation
class User {
    //user characteristics
    var firstName: String
    var lastName: String
    var school: String
    var gender: Int
    var age: Int
    var wakeTime: Int
    var sleepTime: Int
    var drinking: Int
    var pets: Int
    var parties: Int
    //user preferences
    var genderPref: Int
    var ageMinPref: Int
    var ageMaxPref: Int
    var wakeTimePref: Int
    var sleepTimePref: Int
    var budgetMinPref: Int
    var budgetMaxPref: Int
    var drinkingPref: Int
    var petsPref: Int
    var partiesPref: Int
    
    init(firstName: String, lastName: String, school: String, gender: Int, age: Int, wakeTime: Int, sleepTime: Int, drinking: Int, pets: Int, parties: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.school = school
        self.gender = gender
        self.age = age
        self.wakeTime = wakeTime
        self.sleepTime = sleepTime
        self.drinking = drinking
        self.pets = pets
        self.parties = parties
        
        self.genderPref = 0
        self.ageMinPref = 0
        self.ageMaxPref = 0
        self.wakeTimePref = 0
        self.sleepTimePref = 0
        self.budgetMinPref = 0
        self.budgetMaxPref = 0
        self.drinkingPref = 0
        self.petsPref = 0
        self.partiesPref = 0
    
    }
    
    func setAllCharacteristics(firstName: String, lastName: String, school: String, gender: Int, age: Int, wakeTime: Int, sleepTime: Int, drinking: Int, pets: Int, parties: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.school = school
        self.gender = gender
        self.age = age
        self.wakeTime = wakeTime
        self.sleepTime = sleepTime
        self.drinking = drinking
        self.pets = pets
        self.parties = parties
    }
    
    func setAllPreferences(genderPref: Int, ageMinPref: Int, ageMaxPref: Int, wakeTimePref: Int, sleepTimePref: Int, budgetMinPref: Int, budgetMaxPref: Int, drinkingPref: Int, petsPref: Int, partiesPref: Int) {
        self.genderPref = genderPref
        self.ageMinPref = ageMinPref
        self.ageMaxPref = ageMaxPref
        self.wakeTimePref = wakeTimePref
        self.sleepTimePref = sleepTimePref
        self.budgetMinPref = budgetMinPref
        self.budgetMaxPref = budgetMaxPref
        self.drinkingPref = drinkingPref
        self.petsPref = petsPref
        self.partiesPref = partiesPref
    }
    
    //user characteristics
    func getFirstName() -> String {
        return self.firstName
    }
    func setFirstName(firstName: String) {
        self.firstName = firstName
    }
    
    func getLastName() -> String {
        return self.lastName
    }
    func setLastName(lastName: String) {
        self.lastName = lastName
    }
    
    func getSchool() -> String {
        return self.school
    }
    func setSchool(school: String) {
        self.school = school
    }
    
    func getGender() -> Int {
        return self.gender
    }
    
    func setGender(gender: Int) {
        self.gender = gender
    }
    
    func getWakeTime() -> Int {
        return self.wakeTime
    }
    
    func getWakeTime(wakeTime: Int) {
        self.wakeTime = wakeTime
    }

    func getSleepTime() -> Int {
        return self.sleepTime
    }
    
    func setSleepTime(sleepTime: Int) {
        self.sleepTime = sleepTime
    }
    
    
    func getAge() -> Int {
        return self.age
    }
    
    func setAge(age: Int) {
        self.age = age
    }
    
    func getDrinking() -> Int {
        return self.drinking
    }
    func setDrinking(drinking: Int) {
        self.drinking = drinking
    }
    
    func getPets() -> Int {
        return self.pets
    }
    func setPets(pets: Int) {
        self.pets = pets
    }
    
    func getParties() -> Int {
        return self.parties
    }
    func setParties(parties: Int) {
        self.parties = parties
    }
    
    func getGenderPref() -> Int {
        return self.genderPref
    }
    func setGenderPref(genderPref: Int) {
        self.genderPref = genderPref
    }
    
    func getAgeMinPref() -> Int {
        return self.ageMinPref
    }
    func setAgeMinPref(ageMinPref: Int) {
        self.ageMinPref = ageMinPref
    }
    
    func getAgeMaxPref() -> Int {
        return self.ageMaxPref
    }
    func setAgeMaxPref(ageMaxPref: Int) {
        self.ageMaxPref = ageMaxPref
    }
    
    func getWakeTimePref() -> Int {
        return self.wakeTimePref
    }
    func setWakeTimePref(wakeTimePref: Int) {
        self.wakeTimePref = wakeTimePref
    }
    
    func getSleepTimePref() -> Int {
        return self.sleepTimePref
    }
    func setSleepTimePref(sleepTimePref: Int) {
        self.sleepTimePref = sleepTimePref
    }
    
    func getBudgetMinPref() -> Int {
        return self.budgetMinPref
    }
    func setBudgetMinPref(budgetMinPref: Int) {
        self.budgetMinPref = budgetMinPref
    }
    
    func getBudgetMaxPref() -> Int {
        return self.budgetMaxPref
    }
    func setBudgetMaxPref(budgetMaxPref: Int) {
        self.budgetMaxPref = budgetMaxPref
    }
    
    func getDrinkingPref() -> Int {
        return self.drinkingPref
    }
    func setDrinkingPref(drinkingPref: Int) {
        self.drinkingPref = drinkingPref
    }
    
    func getPetsPref() -> Int {
        return self.petsPref
    }
    func setPetsPref(petsPref: Int) {
        self.petsPref = petsPref
    }
    
    func getPartiesPref() -> Int {
        return self.partiesPref
    }
    func setPartiesPref(partiesPref: Int) {
        self.partiesPref = partiesPref
    }
    
    func getCompatibility(other: User) -> String {
        var count:Double = 0.0
        count += self.genderPref == -1 ? 1 : (self.genderPref == other.getGender() ? 1 : 0)
        count += self.ageMinPref < other.getAge() && other.getAge() < self.ageMaxPref ? 1 : 0
        count += self.wakeTimePref == other.getWakeTime() ? 0.5 : 0
        count += self.sleepTimePref == other.getSleepTime() ? 0.5 : 0
        count += (1.0-Double(abs(self.budgetMinPref - other.getBudgetMinPref()))/Double(self.budgetMinPref))/2.0
        count += (1.0-Double(abs(self.budgetMaxPref - other.getBudgetMaxPref()))/Double(self.budgetMaxPref))/2.0
        count += self.drinkingPref == -1 ? 1 : (self.drinkingPref == other.getDrinking() ? 1 : 0)
        count += self.petsPref == -1 ? 1 : (self.petsPref == other.getPets() ? 1 : 0)
        count += self.partiesPref == -1 ? 1 : (self.partiesPref == other.getPartiesPref() ? 1 : 0)
        return String(format: "%.2f", count/8.0 * 100.0)
        
    }
    
    func toDictionary() -> Any {
        return ["firstName": self.firstName, "lastName": self.lastName, "school": self.school, "gender": self.gender, "age": self.age, "wakeTime": self.wakeTime, "sleepTime": self.sleepTime, "drinking": self.drinking, "pets": self.pets, "parties": self.parties, "genderPref": self.genderPref, "ageMinPref": self.ageMinPref, "ageMaxPref": self.ageMaxPref, "wakeTimePref": self.wakeTimePref, "sleepTimePref": self.sleepTimePref, "budgetMinPref": self.budgetMinPref, "budgetMaxPref": self.budgetMaxPref, "drinkingPref": self.drinkingPref, "petsPref": self.petsPref, "partiesPref": self.partiesPref] as Any
    }
}

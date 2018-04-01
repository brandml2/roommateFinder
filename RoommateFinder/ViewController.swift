//
//  ViewController.swift
//  RoommateFinder
//
//  Created by Brandon Lee, Harshil Shah, Kimmillie Tran/ on 3/31/18.
//  Copyright © 2018 Brandon Lee, Harshil Shah, Kimmillie Tran. All rights reserved.
//

import UIKit
import Firebase
var user: User!

class ViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newConfirmPassword: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var ageMinPref: UITextField!
    @IBOutlet weak var ageMaxPref: UITextField!
    @IBOutlet weak var budgetMinPref: UITextField!
    @IBOutlet weak var budgetMaxPref: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var errorLogin: UILabel!
    @IBOutlet weak var errorProfile: UILabel!
    @IBOutlet weak var errorPref: UILabel!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var schoolButton: UIButton!
    @IBOutlet weak var wakeButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var drinkingButton: UIButton!
    @IBOutlet weak var petsButton: UIButton!
    @IBOutlet weak var partiesButton: UIButton!
    @IBOutlet weak var genderPrefButton: UIButton!
    @IBOutlet weak var wakePrefButton: UIButton!
    @IBOutlet weak var sleepPrefButton: UIButton!
    @IBOutlet weak var drinkingPrefButton: UIButton!
    @IBOutlet weak var petsPrefButton: UIButton!
    @IBOutlet weak var partiesPrefButton: UIButton!
    @IBOutlet weak var saveProfileButton: UIButton!
    @IBOutlet weak var savePrefButton: UIButton!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var findMatchesButton: UIButton!
    var ref: DatabaseReference!
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view
        let point = sender.translation(in: view)
        card?.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        if sender.state == UIGestureRecognizerState.ended {
            if Int((card?.center.x)!) < 75 {
                UIView.animate(withDuration: 0.3, animations: {
                    card?.center = CGPoint(x: (card?.center.x)! - 200, y: (card?.center.y)! + 75)
                    card?.alpha = 0
                })
            } else if (card?.center.x)! > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3, animations: {
                    card?.center = CGPoint(x: (card?.center.x)! + 200, y: (card?.center.y)! + 75)
                    card?.alpha = 0
                })
            }
        }
    }
    @IBAction func findMatches(_ sender: Any) {
        
    }
    
    @IBAction func genderPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Gender", preferredStyle: .actionSheet)
        let male = UIAlertAction(title: "Male", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.genderButton.setTitle("Male", for:.normal)
        })
        let female = UIAlertAction(title: "Female", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.genderButton.setTitle("Female", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(male)
        optionMenu.addAction(female)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    @IBAction func schoolPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose School", preferredStyle: .actionSheet)
        let ucla = UIAlertAction(title: "UCLA", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.schoolButton.setTitle("UCLA", for:.normal)
        })
        let uci = UIAlertAction(title: "UCI", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.schoolButton.setTitle("UCI", for:.normal)
        })
        let ucb = UIAlertAction(title: "UCB", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.schoolButton.setTitle("UCB", for:.normal)
        })
        let ucsd = UIAlertAction(title: "UCSD", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.schoolButton.setTitle("UCSD", for:.normal)
        })
        let usc = UIAlertAction(title: "USC", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.schoolButton.setTitle("USC", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(ucla)
        optionMenu.addAction(uci)
        optionMenu.addAction(ucb)
        optionMenu.addAction(ucsd)
        optionMenu.addAction(usc)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    @IBAction func wakePicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Wake Time", preferredStyle: .actionSheet)
        let early = UIAlertAction(title: "Early", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.wakeButton.setTitle("Early", for:.normal)
        })
        let late = UIAlertAction(title: "Late", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.wakeButton.setTitle("Late", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(early)
        optionMenu.addAction(late)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    @IBAction func sleepPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Sleep Time", preferredStyle: .actionSheet)
        let early = UIAlertAction(title: "Early", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.sleepButton.setTitle("Early", for:.normal)
        })
        let late = UIAlertAction(title: "Late", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.sleepButton.setTitle("Late", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(early)
        optionMenu.addAction(late)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    @IBAction func drinkingPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Drinking Preference", preferredStyle: .actionSheet)
        let drink = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.drinkingButton.setTitle("Yes", for:.normal)
        })
        let doNotDrink = UIAlertAction(title: "No", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.drinkingButton.setTitle("No", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(drink)
        optionMenu.addAction(doNotDrink)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    @IBAction func petsPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Pets Preference", preferredStyle: .actionSheet)
        let pets = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.petsButton.setTitle("Yes", for:.normal)
        })
        let noPets = UIAlertAction(title: "No", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.petsButton.setTitle("No", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(pets)
        optionMenu.addAction(noPets)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    @IBAction func partiesPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Parties Preference", preferredStyle: .actionSheet)
        let parties = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.partiesButton.setTitle("Yes", for:.normal)
        })
        let noParties = UIAlertAction(title: "No", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.partiesButton.setTitle("No", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(parties)
        optionMenu.addAction(noParties)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func saveProfile(_ sender: Any) {
        if self.firstName.text == nil || self.lastName.text == nil || self.genderButton.title(for: []) == nil || self.schoolButton.title(for: []) == nil || self.wakeButton.title(for: []) == nil || self.sleepButton.title(for: []) == nil || self.drinkingButton.title(for: []) == nil || self.petsButton.title(for: []) == nil || self.partiesButton.title(for: []) == nil {
            self.errorProfile.text = "You must complete all fields."
        }
        else if Int(self.age.text!) == nil {
            self.errorProfile.text = "Age must be an integer."
        }
        else {
            //update database
            let gender = self.genderButton.title(for: []) == "Male" ? 1 : 0
            let wakeTime = self.wakeButton.title(for: []) == "Early" ? 1 : 0
            let sleepTime = self.sleepButton.title(for: []) == "Early" ? 1 : 0
            let drinking = self.drinkingButton.title(for: []) == "Yes" ? 1 : 0
            let pets = self.petsButton.title(for: []) == "Yes" ? 1 : 0
            let parties = self.partiesButton.title(for: []) == "Yes" ? 1 : 0
            if user == nil {
                user = User(firstName: self.firstName.text!, lastName: self.lastName.text!, school: self.schoolButton.title(for: [])!, gender: gender, age: Int(self.age.text!)!, wakeTime: wakeTime, sleepTime: sleepTime, drinking: drinking, pets: pets, parties: parties)
            }
            else {
                user.setAllCharacteristics(firstName: self.firstName.text!, lastName: self.lastName.text!, school: self.schoolButton.title(for: [])!, gender: gender, age: Int(self.age.text!)!, wakeTime: wakeTime, sleepTime: sleepTime, drinking: drinking, pets: pets, parties: parties)
            }
            let current = Auth.auth().currentUser;
            let id = current!.email!.prefix(upTo: current!.email!.index(of: "@")!)
            self.ref.child("users").child(String(id)).setValue(["user": user.toDictionary()])
            self.errorProfile.text = "Profile Submitted"
        }
    }
    
//==============Roommate Preferences====================
    @IBAction func genderPrefPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Gender Preference", preferredStyle: .actionSheet)
        let male = UIAlertAction(title: "Male", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.genderPrefButton.setTitle("Male", for:.normal)
        })
        
        let female = UIAlertAction(title: "Female", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.genderPrefButton.setTitle("Female", for:.normal)
        })
        
        let noPref = UIAlertAction(title: "No Preference", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.genderPrefButton.setTitle("No Preference", for:.normal)
        })
            
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(male)
        optionMenu.addAction(female)
        optionMenu.addAction(noPref)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
            
    }
    
    @IBAction func wakeTimePrefPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Wake Time", preferredStyle: .actionSheet)
        let early = UIAlertAction(title: "Early", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.wakePrefButton.setTitle("Early", for:.normal)
        })
        let late = UIAlertAction(title: "Late", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.wakePrefButton.setTitle("Late", for:.normal)
        })
        let noPref = UIAlertAction(title: "No Preference", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.wakePrefButton.setTitle("No Preference", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(early)
        optionMenu.addAction(late)
        optionMenu.addAction(noPref)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func sleepTimePrefPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Sleep Time", preferredStyle: .actionSheet)
        let early = UIAlertAction(title: "Early", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.sleepPrefButton.setTitle("Early", for:.normal)
        })
        let late = UIAlertAction(title: "Late", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.sleepPrefButton.setTitle("Late", for:.normal)
        })
        let noPref = UIAlertAction(title: "No Preference", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.sleepPrefButton.setTitle("No Preference", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(early)
        optionMenu.addAction(late)
        optionMenu.addAction(noPref)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func drinkingPrefPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Drinking Preference", preferredStyle: .actionSheet)
        let drink = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.drinkingPrefButton.setTitle("Yes", for:.normal)
        })
        let doNotDrink = UIAlertAction(title: "No", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.drinkingPrefButton.setTitle("No", for:.normal)
        })
        let noPref = UIAlertAction(title: "No Preference", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.drinkingPrefButton.setTitle("No Preference", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(drink)
        optionMenu.addAction(doNotDrink)
        optionMenu.addAction(noPref)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func petsPrefPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Pets Preference", preferredStyle: .actionSheet)
        let pets = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.petsPrefButton.setTitle("Yes", for:.normal)
        })
        let noPets = UIAlertAction(title: "No", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.petsPrefButton.setTitle("No", for:.normal)
        })
        let noPref = UIAlertAction(title: "No Preference", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.petsPrefButton.setTitle("No Preference", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(pets)
        optionMenu.addAction(noPets)
        optionMenu.addAction(noPref)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    
    @IBAction func partiesPrefPicker(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Parties Preference", preferredStyle: .actionSheet)
        let parties = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.partiesPrefButton.setTitle("Yes", for:.normal)
        })
        let noParties = UIAlertAction(title: "No", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.partiesPrefButton.setTitle("No", for:.normal)
        })
        let noPref = UIAlertAction(title: "No Preference", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.partiesPrefButton.setTitle("No Preference", for:.normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(parties)
        optionMenu.addAction(noParties)
        optionMenu.addAction(noPref)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func savePreferences(_ sender: Any) {
        if self.genderPrefButton.title(for: []) == nil ||  self.sleepPrefButton.title(for: []) == nil ||  self.drinkingPrefButton.title(for: []) == nil || self.petsPrefButton.title(for: []) == nil || self.partiesPrefButton.title(for: []) == nil {
            self.errorPref.text = "You must complete all fields."
        }
        else if Int(self.ageMinPref.text!) == nil || Int(self.ageMaxPref.text!) == nil {
            self.errorPref.text = "Ages must be integers."
        }
        else if Int(budgetMinPref.text!) == nil || Int(self.budgetMaxPref.text!) == nil {
            self.errorPref.text = "Budget prices must be integers."
        }
        else {
            let genderPref = self.genderPrefButton.title(for: []) == "No Preference" ? -1 : (self.genderPrefButton.title(for: []) == "Male" ? 1 : 0)
            let wakeTimePref = self.wakePrefButton.title(for: []) == "No Preference" ? -1 : (self.wakePrefButton.title(for: []) == "Early" ? 1 : 0)
            let sleepTimePref = self.sleepPrefButton.title(for: []) == "No Preference" ? -1 : (self.sleepPrefButton.title(for: []) == "Early" ? 1 : 0)
            let drinkingPref = self.drinkingPrefButton.title(for: []) == "No Preference" ? -1 : (self.drinkingPrefButton.title(for: []) == "Yes" ? 1 : 0)
            let petsPref = self.petsPrefButton.title(for: []) == "No Preference" ? -1 : (self.petsPrefButton.title(for: []) == "Yes" ? 1 : 0)
            let partiesPref = self.partiesPrefButton.title(for: []
                ) == "No Preference" ? -1 : (self.partiesPrefButton.title(for: []) == "Yes" ? 1 : 0)
            let current = Auth.auth().currentUser;
            let id = current!.email!.prefix(upTo: current!.email!.index(of: "@")!)
            self.ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.hasChild(String(id)){
                    print(user == nil)
                    user.setAllPreferences(genderPref: genderPref, ageMinPref: Int(self.ageMinPref.text!)!, ageMaxPref: Int(self.ageMaxPref.text!)!, wakeTimePref: wakeTimePref, sleepTimePref: sleepTimePref, budgetMinPref: Int(self.budgetMinPref.text!)!, budgetMaxPref: Int(self.budgetMaxPref.text!)!, drinkingPref: drinkingPref, petsPref: petsPref, partiesPref: partiesPref)
                    self.ref.child("users").child(String(id)).setValue(["user": user.toDictionary()])
                    self.errorPref.text = "Preferences updated."
                } else{
                    self.errorPref.text = "You must complete your profile first."
                }
            })

        }
    }
    
    @IBAction func submitLogin(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailInput.text!, password: passwordInput.text!) { (user, error) in
            if error == nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewer")
                self.present(vc!, animated: true, completion: nil)
            }
            else {
                self.errorLogin.text = error?.localizedDescription
            }
        }
    }
    @IBAction func createAccount(_ sender: Any) {
        if newPassword.text == newConfirmPassword.text {
            Auth.auth().createUser(withEmail: newEmail.text!, password: newPassword.text!) { (user, error) in
                if error == nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeViewer")
                    self.present(vc!, animated: true, completion: nil)
                }
                else {
                    self.errorMessage.text = error?.localizedDescription
                }
            }
        }
        else {
            errorMessage.text = "Passwords do not match."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

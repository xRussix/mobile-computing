//
//  ViewController.swift
//  NumberGuess
//
//  Created by Simon Ruspekhofer on 18.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var editGuess: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var btnGuess: UIButton!
    var model = NumberGuessModel()
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        model.guessCount += 1
        if model.isValid(string: editGuess.text) {
            let guessedNumber = Int(editGuess.text!)!
            model.add(guess: guessedNumber)
            let compareResult = model.compare(to: guessedNumber)
            print(model.target)
            if (compareResult < 0) {
                label.text = "Zu hoch!"
            } else if (compareResult > 0) {
                label.text = "Zu niedrig"
            } else {
                label.text = "Richtig!"
                let imgName: String = model.getImage()
                image.image = UIImage(named: imgName)
                image.isHidden = false
            }
        }
    }
    
    @IBAction func onEdtTextChanged(_ sender: UITextField) {
        print("text changed: \(sender.text)")
        btnGuess.isEnabled = model.isValid(string: sender.text)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.target = Int.random(in: 0...100)
        print(model.target)
        label.text = ""
        label.textAlignment = NSTextAlignment.center
        btnGuess.setTitle("Guess", for: .normal)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let guessedNumber = Int(editGuess.text!)!
        let compareResult = model.compare(to: guessedNumber)
        return compareResult == 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewController = segue.destination as? TableViewController
        if let tvc = tableViewController{
        tvc.model = model
    }
}
}

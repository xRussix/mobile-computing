import Foundation

class NumberGuessModel {
    
    var target = 0
    var guessCount = 0
    var guesses = [Int]()
    
    func compare(to: Int) -> Int {
        return target - to
    }
    
    func isValid(string: String?) -> Bool {
        var isValid = false
        if let str = string, let guess = Int(str) {
            if guess >= 1 && guess <= 99 {
                isValid = true
            }
        }
        return isValid
    }
    
    func getImage() -> String {
        var imgName: String = ""
        if (guessCount < 6) {
            imgName = "happy"
        } else if (guessCount < 10) {
            imgName = "neutral"
        } else {
            imgName = "sad"
        }
        return imgName
    }
    
    func add(guess: Int) -> Void{
        guesses.append(guess)
    }
}

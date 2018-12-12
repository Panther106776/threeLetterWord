//
//  ViewController.swift
//  threeLetterWord
//
//  Created by GERARDO FLORES on 11/28/18.
//  Copyright © 2018 GERARDO FLORES. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var letterLabel: [UILabel]!
    @IBOutlet weak var currentLetterLabel: UILabel!
    
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var counter = 0
    var currentLetter: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAndSetCurrentLetter()
        
    }
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: view)
        for label in letterLabel{
            if label.frame.contains(selectedPoint){
                label.text = "\(currentLetter!)"
            }
        }
        counter += 1
        if counter == 26{
            counter = recentCount()
        }
        getAndSetCurrentLetter()
    }
    func getAndSetCurrentLetter(){
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
    }
    
    func recentCount() -> Int {
        let alert = UIAlertController(title: "Resetting Counter", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            for label in self.letterLabel {
                label.text = "?"
            }
        }
         alert.addAction(action)
        present(alert, animated: true, completion: nil)
        return 0
    }
    
    
}

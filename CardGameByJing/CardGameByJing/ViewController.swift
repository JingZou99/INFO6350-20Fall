//
//  ViewController.swift
//  CardGameByJing
//
//  Created by Jing Zou on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1img1: UIImageView!

    @IBOutlet weak var player1img2: UIImageView!
    
    @IBOutlet weak var player1img3: UIImageView!
    
    @IBOutlet weak var player2img1: UIImageView!
    
    @IBOutlet weak var player2img2: UIImageView!
    
    @IBOutlet weak var player2img3: UIImageView!
    
    @IBOutlet weak var lblWinner: UILabel!
    
    let imageNames = ["2C", "2D", "2H", "2S", "3C", "3D", "3H", "3S", "4C", "4D", "4H", "4S", "5C", "5D", "5H", "5S", "6C", "6D", "6H", "6S", "7C", "7D", "7H", "7S", "8C", "8D", "8H", "8S", "9C", "9D", "9H", "9S", "10C", "10D", "10H", "10S", "AC", "AD", "AH", "AS", "JC", "JD", "JH", "JS", "QC", "QD", "QH", "QS", "KC", "KD", "KH", "KS"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func playGame(_ sender: UIButton) {
        print("Play Game Begins")
        let val1 = Int.random(in: 0..<52)
        let val2 = Int.random(in: 0..<52)
        let val3 = Int.random(in: 0..<52)
        let val4 = Int.random(in: 0..<52)
        let val5 = Int.random(in: 0..<52)
        let val6 = Int.random(in: 0..<52)
        
        player1img1.image = UIImage(named: imageNames[val1])
        player1img2.image = UIImage(named: imageNames[val2])
        player1img3.image = UIImage(named: imageNames[val3])
        player2img1.image = UIImage(named: imageNames[val4])
        player2img2.image = UIImage(named: imageNames[val5])
        player2img3.image = UIImage(named: imageNames[val6])
        
        if(imageNames[val1] == "AS" || imageNames[val2] == "AS" || imageNames[val3] == "AS"){
            lblWinner.text = "Winner: Player 1"
            lblWinner.textColor = UIColor.red
            
            let playAlert = UIAlertController(title: "Play Alert", message: "Do You Want to Play Again?", preferredStyle: UIAlertController.Style.alert)
            playAlert.addAction(UIAlertAction(title: "Yes", style: .default){(action: UIAlertAction)
                in
                print("Card Game Continued.")
            })
            playAlert.addAction(UIAlertAction(title: "No", style: .cancel){(action: UIAlertAction!) in
                print("Card Game Cancelled.")
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            })
            present(playAlert, animated: true, completion: nil)
        }
        else if(imageNames[val4] == "AS" || imageNames[val5] == "AS" || imageNames[val6] == "AS"){
            lblWinner.text = "Winner: Player 2"
            lblWinner.textColor = UIColor.red
            
            let playAlert = UIAlertController(title: "Play Alert", message: "Do You Want to Play Again?", preferredStyle: UIAlertController.Style.alert)
            playAlert.addAction(UIAlertAction(title: "Yes", style: .default){(action: UIAlertAction)
                in
                print("Card Game Continued.")
            })
            playAlert.addAction(UIAlertAction(title: "No", style: .cancel){(action: UIAlertAction!) in
                print("Card Game Cancelled.")
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            })
            present(playAlert, animated: true, completion: nil)
        }
        else if((imageNames[val1] == "AS" || imageNames[val2] == "AS" || imageNames[val3] == "AS") && (imageNames[val4] == "AS" || imageNames[val5] == "AS" || imageNames[val6] == "AS")){
            lblWinner.text = "Winner: No Winner Now"
            lblWinner.textColor = UIColor.lightGray
        }
        else{
            lblWinner.text = "Winner: No Winner Now"
            lblWinner.textColor = UIColor.lightGray
        }
    }
}


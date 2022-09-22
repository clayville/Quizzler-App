
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionsLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    @IBOutlet var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    
    // MARK: - BUTTONS
    
    @IBAction func trueButtonPressed(_ sender: Any) {
        
        let userAnswer = self.trueButton.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer!)
        if userGotItRight{
           trueButton.backgroundColor = .systemGreen
        } else {
            
            trueButton.backgroundColor = .systemRed
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @IBAction func falseButtonPressed(_ sender: Any) {
        let userAnswer = self.falseButton.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight{
           falseButton.backgroundColor = .systemGreen
        } else {
            
            falseButton.backgroundColor = .systemRed
        }
        
        quizBrain.nextQuestion()
 
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // MARK: - METHODS
    
    @objc func updateUI(){
        
        questionsLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        
        // Updates the progress bar
        
        progressBar.progress = quizBrain.getProgress()
        
        // Setting the score
        
        scoreLabel.text = "Score: \(quizBrain.updateScore())"
        
    }
    
    
    
}


//
//  ViewController.swift
//  SB-HW-2.9-CocoaPods-Spring
//
//  Created by Sergey Nestroyniy on 30.09.2022.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var springOptionsLabel: SpringLabel!
    @IBOutlet var springActionButton: SpringButton!
    @IBOutlet var springView: SpringView!
    
    private var nextSpringAction : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        springOptionsLabel.numberOfLines = 7
        nextSpringAction = animations.randomElement()!
        springActionButton.setTitle("Next: \(nextSpringAction!)", for: .normal)
    }
    
    @IBAction func springButtonPressed(_ sender: SpringButton) {
        springView.animation = nextSpringAction!
        springOptionsLabel.text = randomSpringOptions(element: springView)
        springView.animate()
        nextSpringAction = animations.randomElement()!
        sender.setTitle("Next: \(nextSpringAction!)", for: .normal)
    }
    
}

extension ViewController{
    func randomSpringOptions (element: Springable) -> String {
        
        element.curve = curves.randomElement()!
        element.force = CGFloat.random(in: 100...300).rounded() / 100
        element.duration = CGFloat.random(in: 50...300).rounded() / 100
        element.delay = CGFloat.random(in: 0...100).rounded() / 100
        element.damping = CGFloat.random(in: 0...200).rounded() / 100
        element.repeatCount = Float.random(in: 0..<3).rounded(.down)
        
        return """
    animation \(nextSpringAction!)
    curve: \(element.curve)
    force: \(element.force)
    duration: \(element.duration)
    delay: \(element.delay)
    damping: \(element.damping)
    repeatCount: \(element.repeatCount)
    """
    }
}


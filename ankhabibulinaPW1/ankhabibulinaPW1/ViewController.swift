//
//  ViewController.swift
//  ankhabibulinaPW1
//

import UIKit

class ViewController:
    UIViewController {
    @IBOutlet var views: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in views {
            view.backgroundColor = UIColor(
                red: .random(in: 0..<1),
                green: 1,
                blue: 1,
                alpha: 1
            )
            let max_radius: CGFloat = min(view.bounds.height, view.bounds.width) / 2
            view.layer.cornerRadius = CGFloat.random(in: 0...max_radius)
        }
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
    
        var set_colors = Set<UIColor>()
        while set_colors.count < views.count {
            set_colors.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        
        let min_time: TimeInterval = 0.3
        let max_time: TimeInterval = 5
        UIView.animate(
            withDuration: TimeInterval.random(in: min_time...max_time),
            animations: {
                button?.backgroundColor = .cyan
                for view in self.views {
                    view.backgroundColor = set_colors.popFirst()
                }
            }
        ) { completion in
            button?.isEnabled = true
            button?.backgroundColor = .systemPink
        }
    }
}


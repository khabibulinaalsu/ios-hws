//
//  ViewController.swift
//  ankhabibulinaPW3
//
//  Created by Нияз Хабибулин on 31.10.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    let incrementButton = UIButton(type: .system);
    let commentView = UIView()
    let colorPaletteView = ColorPaletteView()
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    private var value: Int = 0
    
    private func applyShadow(for object: AnyObject) {
        object.layer.shadowOffset = CGSize(width: 6, height: 6)
        object.layer.shadowOpacity = 0.72
        object.layer.shadowRadius = 5
    }
    
    private func setupIncrementButton() {
        self.view.addSubview(incrementButton)
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        incrementButton.backgroundColor = UIColor(red: 0.34, green: 0.52, blue: 0.93, alpha: 1)
        applyShadow(for: incrementButton)
        incrementButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        incrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        incrementButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        incrementButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36).isActive = true
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
        incrementButton.setTitle("Nazhmi Na Knopku", for: .normal)
        incrementButton.setTitleColor(.white, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize: 24.0, weight: .medium)
    }
    
    private func makeMenuButton(title: String, button: UIButton) {
        applyShadow(for: button)
        button.layer.shadowColor = CGColor(gray: 0, alpha: 0)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 24.0, weight: .medium)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
    }
    
    private func setupMenuButtons() {
        let colorsButton = UIButton(type: .system)
        let notesButton = UIButton(type: .system)
        let newsButton = UIButton(type: .system)
        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        buttonsSV.translatesAutoresizingMaskIntoConstraints = false
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        self.view.addSubview(buttonsSV)
        buttonsSV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsSV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36).isActive = true
        buttonsSV.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -36).isActive = true
        colorsButton.addTarget(self, action: #selector(paletteButtonPressed), for: .touchUpInside)
        makeMenuButton(title: "🎨", button: colorsButton)
        makeMenuButton(title: "📝", button: notesButton)
        makeMenuButton(title: "📰", button: newsButton)
     }
    
    private func setupValueLabel() {
        self.view.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.bottomAnchor.constraint(equalTo: incrementButton.topAnchor, constant: -10).isActive = true
        valueLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        valueLabel.font = .systemFont(ofSize: 100.0, weight: .bold)
        valueLabel.textColor = UIColor(red: 0.34, green: 0.52, blue: 0.93, alpha: 1)
        valueLabel.text = "\(value)"
    }
    
    private func setupCommentView() {
        view.addSubview(commentView)
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        commentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        commentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12
        applyShadow(for: commentView)
        view.addSubview(commentLabel)
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.centerXAnchor.constraint(equalTo: commentView.centerXAnchor).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 12).isActive = true
        commentLabel.centerYAnchor.constraint(equalTo: commentView.centerYAnchor).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 12).isActive = true
        commentLabel.text = "Hochesh resul\'tat??"
        commentLabel.font = .systemFont(ofSize: 24.0, weight: .regular)
        commentLabel.textColor = .darkGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center
    }
    
    private func setupColorControlSV() {
        
        let const: CGFloat = -UIScreen.main.bounds.width / 3 - 24
        self.view.addSubview(colorPaletteView)
        colorPaletteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [colorPaletteView.topAnchor.constraint(equalTo: incrementButton.bottomAnchor, constant: 24),
             colorPaletteView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
             colorPaletteView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
             colorPaletteView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: const)
         ])
        colorPaletteView.layer.cornerRadius = 12
        colorPaletteView.addTarget(self, action: #selector(changeColor), for: .touchDragInside)
    }
    
    
    func updateCommentLabel(value: Int) -> String {
        let kuplet_1: [String] = [
            "Kazhduyu noch\' ti sidish\' u okna", "Peremeschaya zvyozdi", "Kazhduyu noch\' tebe ne do sna", "Vsyo eto tak seryozno", "Ya pomnyu, ya znayu", "Veter v tvoih rukah", "Iskusstvennim raem", "Bredish v svoih mechtah"
        ]
        let kuplet_2: [String] = [
            "V shorohe kapel\' nochnogo dozhdya", "Zashifroval nadezhdu", "Vistroil mir, gde ti u rulya", "Chto zh ti ne spish, kak prezde", "Skazhi, pochemu ti", "Medlish ispolnit\' plan", "Sschiataya minuti", " Smotrish na pustoi ekran"
        ]
        let pripev: [String] = [
            "Nazhmi na knopku -\npoluchish rezul\'tat", "I tvoya mechta osuschestvitsa", "Nazhmi na knopku,\nnu chto zhe ti ne rad", "Tebe bol\'she ne k chemu stremitsa"
        ]
        switch value {
            case 1...64:
            return kuplet_1[(value - 1) / 8]
            case 65...128:
            return pripev[(value - 1) / 8 % 4]
            case 129...192:
            return "...music..."
            case 193...256:
            return kuplet_2[(value - 1) / 8 % 8]
            case 257...320:
            return pripev[(value - 1) / 8 % 4]
            default:
            return "Ti poluchil rezul'tat.\nDovolen?"
        }
    }
    
    private func setupView() {
        
        view.backgroundColor = .cyan
        colorPaletteView.isHidden = true
        
        setupIncrementButton()
        setupValueLabel()
        setupCommentView()
        setupMenuButtons()
        setupColorControlSV()
    }
    
    
    private func updateUI() {
        valueLabel.text = "\(value)"
        commentLabel.text = updateCommentLabel(value: value)
    }
    
    @objc
    private func incrementButtonPressed(_ sender: UIButton) {
        value += 1
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        UIView.animate(
            withDuration: 3,
            animations: {
                self.updateUI()
            }
        )
    }
    
    private func changeAlphaOfButton(button: UIButton) {
        if(button.backgroundColor != UIColor(white: 1, alpha: 1)) {
            button.layer.shadowColor = CGColor(gray: 0, alpha: 0.5)
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    button.backgroundColor = UIColor(white: 1, alpha: 1)
                }
            )
        } else {
            button.layer.shadowColor = CGColor(gray: 1, alpha: 0)
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    button.backgroundColor = UIColor(white: 1, alpha: 0.5)
                }
            )
        }
    }
    
    @objc
    private func paletteButtonPressed(_ sender: UIButton) {
        colorPaletteView.backgroundColor = .white
        colorPaletteView.isHidden.toggle()
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred(intensity: 1)
        changeAlphaOfButton(button: sender)
    }
    
    @objc
    private func changeColor(_ slider: ColorPaletteView) {
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.view.backgroundColor = slider.chosenColor
            }
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

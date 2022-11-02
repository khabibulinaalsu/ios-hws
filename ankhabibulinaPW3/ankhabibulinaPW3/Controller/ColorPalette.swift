//
//  ColorPalette.swift
//  ankhabibulinaPW3
//
//  Created by Нияз Хабибулин on 02.11.2022.
//

import UIKit

final class ColorPaletteView: UIControl {
    
    private let stackView = UIStackView()
    private(set) var chosenColor: UIColor = .cyan
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        chosenColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let redControl = ColorSliderView(colorName: "R", value: Float(red), color: .red)
        let greenControl = ColorSliderView(colorName: "G", value: Float(green), color: .green)
        let blueControl = ColorSliderView(colorName: "B", value: Float(blue), color: .blue)
        redControl.tag = 0
        greenControl.tag = 1
        blueControl.tag = 2
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(redControl)
        stackView.addArrangedSubview(greenControl)
        stackView.addArrangedSubview(blueControl)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12
        [redControl, greenControl, blueControl].forEach {
            $0.addTarget(self, action: #selector(sliderMoved), for: .touchDragInside)
        }
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    @objc
    private func sliderMoved(slider: ColorSliderView) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        chosenColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        switch slider.tag {
            case 0:
                self.chosenColor = UIColor(
                    red: CGFloat(slider.value),
                    green: green,
                    blue: blue,
                    alpha: alpha
                )
            case 1:
                self.chosenColor = UIColor(
                    red: red,
                    green: CGFloat(slider.value),
                    blue: blue,
                    alpha: alpha
                )
            default:
                self.chosenColor = UIColor(
                    red: red,
                    green: green,
                    blue: CGFloat(slider.value),
                    alpha: alpha
                )
        }
        sendActions(for: .touchDragInside)
    }
}

//
//  ColorPaletteView.swift
//  ankhabibulinaPW3
//
//  Created by Нияз Хабибулин on 02.11.2022.
//

import UIKit

extension ColorPaletteView {
    final class ColorSliderView: UIControl {
        private let slider = UISlider()
        private let colorLabel = UILabel()
        private(set) var value: Float
        init(colorName: String, value: Float, color: UIColor) {
            self.value = value
            super.init(frame: .zero)
            slider.value = value
            colorLabel.text = colorName
            setupView()
            slider.addTarget(self, action: #selector(sliderMoved), for: .touchDragInside)
            slider.tintColor = color
        }
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        private func setupView() {
            let stackView = UIStackView(arrangedSubviews: [colorLabel, slider])
            stackView.axis = .horizontal
            stackView.spacing = 8
            addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        }
        
        @objc
        private func sliderMoved(_ slider: UISlider) {
            self.value = slider.value
            sendActions(for: .touchDragInside)
        }
    }
}

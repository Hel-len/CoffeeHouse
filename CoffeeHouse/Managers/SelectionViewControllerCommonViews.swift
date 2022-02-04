//
//  SelectionViewControllerCommonViews.swift
//  CoffeeHouse
//
//  Created by Елена Дранкина on 04.02.2022.
//

import UIKit

final class SelectionView {

    var background: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    var greeting: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Nasalization", size: 30)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var coffeeView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()

    var coffeeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = UIColor(white: 1, alpha: 0.5)
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}

//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Silvanei  Martins on 04/03/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}


//
//  ProductListNavigator.swift
//  MGLoadMore
//
//  Created by Tuan Truong on 4/5/19.
//  Copyright © 2019 Sun Asterisk. All rights reserved.
//

import UIKit

protocol ProductListNavigatorType {
    func toProductDetail(product: Product)
}

struct ProductListNavigator: ProductListNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController

    func toProductDetail(product: Product) {

    }
}

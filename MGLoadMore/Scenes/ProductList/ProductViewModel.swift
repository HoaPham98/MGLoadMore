//
//  ProductViewModel.swift
//  MGLoadMore
//
//  Created by Tuan Truong on 4/5/19.
//  Copyright © 2019 Sun Asterisk. All rights reserved.
//

struct ProductViewModel {
    let product: Product
        
    var name: String {
        return product.name
    }
        
    var price: String {
        return String(product.price)
    }
        
}

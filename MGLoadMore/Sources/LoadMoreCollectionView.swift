//
//  LoadMoreCollectionView.swift
//  MGLoadMore
//
//  Created by Tuan Truong on 4/5/19.
//  Copyright © 2019 Sun Asterisk. All rights reserved.
//

import UIKit
import MJRefresh
import RxCocoa
import RxSwift

open class LoadMoreCollectionView: UICollectionView {
    private let _refreshControl = UIRefreshControl()
    
    open var isRefreshing: Binder<Bool> {
        return Binder(self) { collectionView, loading in
            if loading {
                collectionView._refreshControl.beginRefreshing()
            } else {
                if collectionView._refreshControl.isRefreshing {
                    collectionView._refreshControl.endRefreshing()
                }
            }
        }
    }
    
    open var isLoadingMore: Binder<Bool> {
        return Binder(self) { collectionView, loading in
            if loading {
                collectionView.mj_footer?.beginRefreshing()
            } else {
                collectionView.mj_footer?.endRefreshing()
            }
        }
    }
    
    open var refreshTrigger: Driver<Void> {
        return _refreshControl.rx.controlEvent(.valueChanged).asDriver()
    }
    
    private var _loadMoreTrigger = PublishSubject<Void>()
    
    open var loadMoreTrigger: Driver<Void> {
        return _loadMoreTrigger.asDriver(onErrorJustReturn: ())
    }
    
    open var refreshFooter: MJRefreshFooter? {
        didSet {
            mj_footer = refreshFooter
            mj_footer?.refreshingBlock = { [weak self] in
                self?._loadMoreTrigger.onNext(())
            }
        }
    }
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.addSubview(_refreshControl)
        self.refreshFooter = RefreshAutoFooter()
    }
}

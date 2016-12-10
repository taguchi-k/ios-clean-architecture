//
//  PhotoUsecase.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol PhotoListLoadable {
    func loadData()
}

final class PhotoListUsecase: PhotoListLoadable {

    var photoRepository: PhotoRepository?
    
    init(repository: PhotoRepository) {
        photoRepository = repository
        photoRepository?.loading = self
    }

    /// 写真データを読み出す
    func loadData() {
        photoRepository?.loadData()
    }
}

//MARK:- PhotoListLoading
extension PhotoListUsecase: PhotoListLoading {
    
    func done(_ photos: [Photo]) {
        PhotoListDidLoadEvent.post(items: photos)
    }
    
    func noData() {
        //Do Somethig
    }
    
    func failure() {
        //Do Somethig        
    }
}

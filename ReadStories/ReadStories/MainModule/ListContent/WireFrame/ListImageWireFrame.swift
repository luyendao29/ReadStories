//
//  ListImageWireFrame.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import Foundation
import UIKit

class ListImageWireFrame: ListImageWireframeProtocol {
    class func createImageDetailModule (view : ListImageViewController,and list: ModelDetail) {
    let presenter = ListImagePresenter()
        presenter.modelDetail = list
        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.wireFrame = ListImageWireFrame()
    }
    
    deinit {
        print("wireframe removed")
    }
}


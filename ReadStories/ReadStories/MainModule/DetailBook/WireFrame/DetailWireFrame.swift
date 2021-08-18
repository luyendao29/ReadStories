//
//  DetailWireFrame.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireframeProtocol {
    class func createBookDetailModule (view : DetailViewController,and book: ListBook) {
    let presenter = DetailPresenter()
        presenter.book = book
        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.wireFrame = DetailWireFrame()
    }
    
    func pushtoListImage(list: ModelDetail, from view: UIViewController) {
        let vc = R.storyboard.main.listImageViewController()
        ListImageWireFrame.createImageDetailModule(view: vc!, and: list)
        view.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    deinit {
        print("wireframe removed")
    }
}


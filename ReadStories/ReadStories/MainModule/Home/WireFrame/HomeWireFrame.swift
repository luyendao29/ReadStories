//
//  HomeWireFrame.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import UIKit

class HomeWireFrame: HomeWireframeProtocol {
    
    class func createListBookModule(view: HomeViewController) {
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        view.presenter = presenter
        view.presenter?.wireFrame = HomeWireFrame()
        view.presenter?.view = view
        view.presenter?.interactor = HomeInteractor()
        view.presenter?.interactor?.presenter = presenter
        
    }
    
    func pushtoBooktDetail(book: ListBook, from view: UIViewController) {
        let vc = R.storyboard.main.detailViewController()
        DetailWireFrame.createBookDetailModule(view: vc!, and: book)
        view.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

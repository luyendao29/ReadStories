//
//  DetailProtocols.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit

protocol DetailPresenterProtocol: PresenterInterface {
    var view: DetailViewControllerProtocol? { get set }
    var wireFrame: DetailWireframeProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    func viewdidLoad()
    func showImageSelection(image: ModelDetail, from view: UIViewController)
    
}

protocol DetailInteractorInputProtocol: InteractorInterface {
    func getListDetail(completeHandle: @escaping (([ModelDetail]) -> ()?))
}

protocol DetailInteractorOutputProtocol: InteractorInterface {
}

protocol DetailViewControllerProtocol: ViewInterface {
    func disPlayData(book: ListBook)
    func disPlayDetailData(model: [ModelDetail])
    func showProgress()
    func hideProgress()
}

protocol DetailWireframeProtocol: WireframeInterface {
    func pushtoListImage(list: ModelDetail, from view: UIViewController)
}


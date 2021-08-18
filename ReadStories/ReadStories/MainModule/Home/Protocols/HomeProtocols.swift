//
//  HomeProtocols.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import UIKit


protocol HomePresenterProtocol: PresenterInterface {
    var view: HomeViewControllerProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame:HomeWireframeProtocol? { get set }
    func viewdidLoad()
    func showBookSelection(book: ListBook, from view: UIViewController)
    func searchData(image: UIImageView?, text: String?, array: [ListBook])
    
}

protocol HomeInteractorInputProtocol: InteractorInterface {
    var presenter: HomeInteractorOutputProtocol? {get set }
    func getListBook(completeHandle: @escaping (([ListBook]) -> ()?))
    
}

protocol HomeInteractorOutputProtocol: InteractorInterface {
//    func listBookDidFetch(listboook: [ListBook])
}

protocol HomeViewControllerProtocol: ViewInterface {
    func disPlayData(dataModel: [ListBook])
    func showProgress()
    func hideProgress()
    func hideTitleNavigationController()
    func disPlayDataSearch(dataModel: [ListBook])
}
protocol HomeWireframeProtocol: WireframeInterface {
    static func createListBookModule(view: HomeViewController)
    func pushtoBooktDetail(book: ListBook,from view: UIViewController)
}


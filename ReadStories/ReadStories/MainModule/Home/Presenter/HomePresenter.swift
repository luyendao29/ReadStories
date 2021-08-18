//
//  HomePresenter.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import UIKit

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    
    
    
    var wireFrame: HomeWireframeProtocol?
    var view: HomeViewControllerProtocol?
    var interactor: HomeInteractorInputProtocol?
    var suggestBook = [ListBook]()
    
    func listBookDidFetch(listFood: [ListBook]) {
        self.view?.disPlayData(dataModel: listFood)
    }
    
    func viewdidLoad() {
        self.view?.showProgress()
        NetworkManager.shared.getListBook(completion: { data in
            self.view?.disPlayData(dataModel: data)
            self.suggestBook = data
            self.view?.hideProgress()
        })
    }
    
    func showBookSelection(book: ListBook, from view: UIViewController) {
        self.view?.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.wireFrame?.pushtoBooktDetail(book: book, from: view)
            self.view?.hideTitleNavigationController()
            self.view?.hideProgress()
        })
    }
    
    func searchData(image: UIImageView?, text: String?, array: [ListBook]) {
                if text == "" {
                    suggestBook = array
                } else {
                    image?.image = R.image.icons8Delete_sign()
                    suggestBook = suggestBook.filter { (data: ListBook) in
                        if let text = text {
                        let  name = data.tenTruyen
                        if name.lowercased().range(of: text.lowercased()) != nil {
                                return true
                            }
                        }
                        return false
                    }
                }
        self.view?.disPlayDataSearch(dataModel: suggestBook)
    }
    
}

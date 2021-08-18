//
//  DetailPresenter.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import Foundation
import UIKit

class DetailPresenter: DetailPresenterProtocol, DetailInteractorOutputProtocol {
    
    var wireFrame: DetailWireframeProtocol?
    var view: DetailViewControllerProtocol?
    var interactor: DetailInteractorInputProtocol?
    var book: ListBook?
    var params = Dictionary<String, Any>()
    
    func viewdidLoad() {
        if let book = book {
            self.view?.disPlayData(book: book)
        }
        params.removeAll()
        params["id"] = book?.id
        
        NetworkManager.shared.getDetailBook(params: params, completion: { data in
            self.view?.disPlayDetailData(model: data)
            self.view?.hideProgress()
        })
    }
    
    func showImageSelection(image: ModelDetail, from view: UIViewController) {
        self.view?.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.wireFrame?.pushtoListImage(list: image, from: view)
            self.view?.hideProgress()
        })
    }
}

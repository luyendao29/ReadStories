//
//  ListImagePresenter.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import Foundation
import UIKit

class ListImagePresenter: ListImagePresenterProtocol, ListImageInteractorOutputProtocol {
    
    
    var wireFrame: ListImageWireframeProtocol?
    var view: ListImageViewControllerProtocol?
    var interactor: ListImageInteractorInputProtocol?
    var modelDetail: ModelDetail?
    var params = Dictionary<String, Any>()
    
    func viewdidLoad() {
        params.removeAll()
        params["idChap"] = modelDetail?.id
        
        NetworkManager.shared.getListImage(params: params, completion: { data in
            self.view?.disPlayImageData(model: data)
        })
    }
}


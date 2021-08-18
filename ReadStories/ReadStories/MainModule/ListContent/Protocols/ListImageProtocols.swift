//
//  ListImageProtocols.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import Foundation

protocol ListImagePresenterProtocol: PresenterInterface {
    var view: ListImageViewControllerProtocol? { get set }
    var wireFrame: ListImageWireframeProtocol? { get set }
    var interactor: ListImageInteractorInputProtocol? { get set }
    func viewdidLoad()
    
}

protocol ListImageInteractorInputProtocol: InteractorInterface {
}

protocol ListImageInteractorOutputProtocol: InteractorInterface {
}

protocol ListImageViewControllerProtocol: ViewInterface {
    func disPlayImageData(model: [ListImage])
}

protocol ListImageWireframeProtocol: WireframeInterface {
}

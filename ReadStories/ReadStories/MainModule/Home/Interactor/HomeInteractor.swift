//
//  HomeInteractor.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import Foundation
import UIKit

class HomeInteractor: HomeInteractorInputProtocol {
    
    var presenter: HomeInteractorOutputProtocol?
    
    func getListBook(completeHandle: @escaping (([ListBook]) -> ()?)) {
    }
    
}

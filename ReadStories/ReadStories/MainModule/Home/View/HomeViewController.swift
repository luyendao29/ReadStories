//
//  HomeViewController.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import UIKit
import Rswift
import IQKeyboardManager

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var imageRemove: UIImageView!
    
    var listBook = [ListBook]()
    var suggestListBook = [ListBook]()
    let WIDTH_SCREEN = UIScreen.main.bounds.width
    // so item
    let numberOfItems: CGFloat = 2
    // khoang cach giua cac item
    let padding: CGFloat = 10
    
    var sizeItem: CGFloat = 100
    
    var loading: Loading = Loading()
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeWireFrame.createListBookModule(view: self)
        registerCollectionView()
        presenter?.viewdidLoad()
        setShadowView(view: searchView)
        setupTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "Đọc Truyện"
    }
    
    func registerCollectionView() {
        collectionView.register(R.nib.collectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func setupTextField() {
        searchTextField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        searchTextField.delegate = self
    }
    
    @objc func doneButtonClicked() {
        imageRemove.isHidden = true
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestListBook.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.witdhImageContrain.constant = sizeItem - 49
        cell.listbook = suggestListBook[indexPath.row]
        cell.fillData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showBookSelection(book: suggestListBook[indexPath.row], from: self)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sizeItem = (WIDTH_SCREEN - padding * (numberOfItems + 1)) / numberOfItems
        return CGSize(width: sizeItem, height: sizeItem)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
}

extension HomeViewController: HomeViewControllerProtocol {
    
    func disPlayDataSearch(dataModel: [ListBook]) {
        suggestListBook = dataModel
        collectionView.reloadData()
    }
    
    func hideTitleNavigationController() {
        title = ""
    }
    
    func showProgress() {
        loading.start()
        view.alpha = 0.5
    }
    
    func hideProgress() {
        loading.stop()
        view.alpha = 1
    }
    
    func disPlayData(dataModel: [ListBook]) {
        self.listBook = dataModel
        self.suggestListBook = listBook
        self.collectionView.reloadData()
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        presenter?.searchData(image: imageRemove, text: searchTextField.text, array: listBook)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        presenter?.searchData(image: imageRemove, text: searchTextField.text, array: listBook)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

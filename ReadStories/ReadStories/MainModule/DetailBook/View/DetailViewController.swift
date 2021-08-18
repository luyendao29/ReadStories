//
//  DetailViewController.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: DetailPresenterProtocol?
    var book: ListBook?
    var modelDetail = [ModelDetail]()
    var loading: Loading = Loading()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewdidLoad()
        setData()
        setupTableView()
        title = "Chi Tiết"
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(R.nib.chapTableViewCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "Chi Tiết"
    }
    
    func setData() {
        if let book = book {
            nameLabel.text = book.tenTruyen
            let url = URL(string: book.linkAnh)
            self.imageView.kf.setImage(with: url)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapTableViewCell", for: indexPath) as? ChapTableViewCell
        cell?.listDetail = modelDetail[indexPath.row]
        cell?.fillData()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showImageSelection(image: modelDetail[indexPath.row], from: self)
    }
    
}
extension DetailViewController: DetailViewControllerProtocol {
    func showProgress() {
        loading.start()
    }
    
    func hideProgress() {
        loading.stop()
    }
    
    func disPlayDetailData(model: [ModelDetail]) {
        modelDetail = model
        tableView.reloadData()
    }
    
    func disPlayData(book: ListBook) {
        self.book = book
    }
}

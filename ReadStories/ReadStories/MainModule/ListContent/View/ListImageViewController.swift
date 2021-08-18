//
//  ListImageViewController.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit

class ListImageViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListImagePresenterProtocol?
    var listImage = [ListImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewdidLoad()
    }
    
    func setupTableView() {
        tableView.register(R.nib.imageTableViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        cell.list = listImage[indexPath.row]
        cell.fillData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
}

extension ListImageViewController: ListImageViewControllerProtocol {
    func disPlayImageData(model: [ListImage]) {
        listImage = model
        tableView.reloadData()
    }
}

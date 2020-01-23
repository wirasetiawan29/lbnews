//
//  NewsListTableViewController.swift
//  LBNews
//
//  Created by wira on 1/23/20.
//  Copyright © 2020 Wira Setiawan. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {

    private var articleListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    func setupData() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=1325b26f6f3746078d251b2c4bbf5192")!
        Webservice().getArticles(url: url) { articles in

            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for:indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }

        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descLabel.text = articleVM.desc
        return cell
    }

}

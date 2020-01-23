//
//  ArticleViewModel.swift
//  LBNews
//
//  Created by wira on 1/23/20.
//  Copyright © 2020 Wira Setiawan. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articles: [ArticleElement]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }

    func numberOfRowInSection(_ section:Int) -> Int {
        return self.articles.count
    }

    func articleAtIndex(_ index:Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: ArticleElement
}

extension ArticleViewModel {
    init(_ article: ArticleElement) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }

    var desc: String {
        return self.article.articleDescription
    }
}

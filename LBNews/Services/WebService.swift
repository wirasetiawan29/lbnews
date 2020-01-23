//
//  WebService.swift
//  LBNews
//
//  Created by wira on 1/23/20.
//  Copyright © 2020 Wira Setiawan. All rights reserved.
//

import Foundation

class Webservice {

    func getArticles(url: URL, completion: @escaping ([ArticleElement]?) -> ()) {

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articles = try! JSONDecoder().decode(Article.self, from: data).articles
                completion(articles)
            }

        }.resume()
    }
}

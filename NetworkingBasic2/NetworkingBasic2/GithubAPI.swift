//
//  GithubAPI.swift
//  NetworkingBasic2
//
//  Created by Derrick Park on 2017-10-19.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import Foundation

struct GithubAPI {
    
    static func fetchData(url: URL, completion: @escaping ([Repository])->()) {
        var repositories = [Repository]()
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if (error != nil) {
                print(String(describing: error?.localizedDescription))
                return
            }
            guard let data = data else { return }
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
                for repo in jsonArray {
                    let id = repo["id"] as! Int
                    let name = repo["name"] as! String
                    let language = repo["language"] as? String
                    repositories.append(Repository(id: id, name: name, language: language ?? "No language"))
                }
                DispatchQueue.main.async {
                    completion(repositories)
                }
            } catch {
                print("JSON error")
            }
        }
        dataTask.resume()
    }
}

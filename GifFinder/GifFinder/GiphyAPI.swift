//
//  GiphyAPI.swift
//  GifFinder
//
//  Created by kaori hirata on 2017-10-23.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Foundation

struct GiphyAPI{

    static func fetchData(url: URL, completion: @escaping ([Gif])->()) {
        var gifs = [Gif]()
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if(error != nil){
                print(String(describing:error?.localizedDescription))
                return
            }
            guard let data = data else{ return }
            //print("data\(data)")
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let gifJsonData = json["data"] as? [[String: Any]] {
                    //print("gifJsonData:\(gifJsonData)")
                    for item in gifJsonData{
                        if let jsonDataImage = item["images"]  as? [String: AnyObject] {
                            //print("jsonDataImage\(jsonDataImage)")
                            if let jsonDataImageOriginal = jsonDataImage["original"] as? [String: AnyObject] {
                                let jsonDataImageOriginalUrl = jsonDataImageOriginal["url"] as? String
                                //print("jsonGifDataURL:\(jsonDataImageOriginalUrl)")
                                gifs.append(Gif(gifmodelURL: jsonDataImageOriginalUrl!))
                            }
                        }
                    }
                }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
            DispatchQueue.main.async {
                completion(gifs)
            }
        }
        dataTask.resume()
    }
}

//
//  CollectionViewController.swift
//  GifFinder
//
//  Created by kaori hirata on 2017-10-23.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
   
    var gifs = [Gif]()
    let url = URL(string:"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=fPn3bHQ8Hi9HTDeQOFETEOazSIiwer2a")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GiphyAPI.fetchData(url : url){(gifs) in
            self.gifs = gifs
//            print("gifs : \(gifs)")
            self.collectionView?.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return gifs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        //set Image
        let gifUrlStr = gifs[indexPath.row].gifmodelURL
        let gifURL = URL(fileURLWithPath: gifUrlStr)
        print("gifURL\(gifURL)")
        return setGifFromData(cell: cell, gifURL: gifURL)
        
    }
    func setGifFromData(cell:CollectionViewCell,gifURL:URL)->CollectionViewCell{
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let downloadTask = session.downloadTask(with: url) { (location, response, error) in
            if (error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let loc = location else { return }
            guard let data = try? Data(contentsOf: loc) else { return }
            print("dispatch\(data)")
            let image = UIImage(data: data)
            print("dispatch\(image?.description)")
            
            DispatchQueue.main.async {
                cell.collectionImage.image = image
                
            }
        }
        downloadTask.resume()
        return cell
        
    }
}

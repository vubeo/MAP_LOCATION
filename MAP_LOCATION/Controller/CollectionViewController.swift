//
//  CollectionViewController.swift
//  MAP_LOCATION
//
//  Created by Đỗ Hoàng Vũ on 7/19/18.
//  Copyright © 2018 Đỗ Hoàng Vũ. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionView"
class CollectionViewController: UICollectionViewController {
    
    var arrayData = [TestCell(name: "1", img: #imageLiteral(resourceName: "icon_24")),
                     TestCell(name: "2", img: #imageLiteral(resourceName: "icon_25")),
                     TestCell(name: "3", img: #imageLiteral(resourceName: "icon_28")),
                     TestCell(name: "4", img: #imageLiteral(resourceName: "vietnam")),
                     TestCell(name: "5", img: #imageLiteral(resourceName: "icon_30"))]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayData.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.imageCell.image = arrayData[indexPath.row].img
        cell.labelCell.text = arrayData[indexPath.row].name
        return cell
    }
}

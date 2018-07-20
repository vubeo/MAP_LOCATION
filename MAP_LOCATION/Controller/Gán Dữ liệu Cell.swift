//
//  CollectionViewCell.swift
//  MAP_LOCATION
//
//  Created by Đỗ Hoàng Vũ on 7/19/18.
//  Copyright © 2018 Đỗ Hoàng Vũ. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    func displayItem(image : UIImage , title : String) {
        imageCell.image = image
        labelCell.text = title
    }
}

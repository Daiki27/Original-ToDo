//
//  CollectionViewCell.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/08.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit

//delegate 処理を譲る。
protocol CellDelegate {
    func delete(cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var kesuButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var delegate: CellDelegate!
    
    @IBAction func delete(sender: AnyObject) {
        delegate.delete(cell: self)
    }

}

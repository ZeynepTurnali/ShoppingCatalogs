//
//  ProductCell.swift
//  shoppingCatalogs

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productCellImage: UIImageView!
    
    @IBOutlet weak var productCellTitle: UILabel!
    
    @IBOutlet weak var productCellDetail: UILabel!
    
    @IBOutlet weak var productCellPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

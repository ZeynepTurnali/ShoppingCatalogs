//
//  ProductDetail.swift
//  shoppingCatalogs

import UIKit

class ProductDetail: UIViewController {
    
    var item: Product = Product()

    @IBOutlet weak var imageViewDetail: UIImageView!
    
    @IBOutlet weak var titleDetail: UILabel!
    
    @IBOutlet weak var contentDetail: UILabel!
    
    @IBOutlet weak var priceDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = item.title
        
        imageViewDetail.image = UIImage(named: "\(item.category)")
        titleDetail.text = "Title: \(item.title)"
        contentDetail.text = "Product Detail: \(item.detail)"
        priceDetail.text = "Price: \(item.price) €"
    
    }
}

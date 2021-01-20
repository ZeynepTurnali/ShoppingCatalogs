//
//  ShoppingTableViewController.swift
//  shoppingCatalogs

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    var productList:[Product] = []
    
    var dndnd = NewProductController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("second did load")
        print(productList)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("second view did appear")
        print(productList)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailProductCell", for: indexPath) as! ProductCell
        let member = productList[indexPath.row]
        cell.productCellImage.image = UIImage(named: "\(member.category)")
        cell.productCellTitle.text = member.title
        cell.productCellDetail.text = member.detail
        cell.productCellPrice.text = "\(member.price) €"
        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            productList.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = productList[indexPath.row]
        
        performSegue(withIdentifier: "detail", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail") {
            let vc = segue.destination as! ProductDetail
            vc.item = sender as! Product
        }
    }

}

//
//  NewProductController.swift
//  shoppingCatalogs


import UIKit
import SCLAlertView

class NewProductController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var imagePackage = ["--choose--", "food", "fashion", "care", "electronics", "furniture", "toys", "hobby"]
    
    var selectedCategory = "--choose--"
    
    var product: [Product] = []
    
    @IBOutlet weak var productPickerView: UIPickerView!
    @IBOutlet weak var productTitle: UITextField!
    @IBOutlet weak var productDetail: UITextView!
    @IBOutlet weak var productPrice: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productPickerView.delegate = self
        productPickerView.dataSource = self
        
        // I added gesture recognizer for close the keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
       return imagePackage.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imagePackage[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCategory = imagePackage[row]
        print(selectedCategory)
    }
    
    
    @IBAction func addToListBtn(_ sender: UIButton) {
        if addProduct() {
            productTitle.text = nil
            productPrice.text = nil
            productDetail.text = nil
        }
    }
    
    
    func addProduct() -> Bool {
        var myProduct = Product()
        
        myProduct.detail = productDetail.text
        myProduct.category = selectedCategory
        
        if productTitle.text != "" {
            myProduct.title = productTitle.text!
            if productPrice.text != "" && Int(productPrice.text!) != nil{
                myProduct.price = Int(productPrice.text!)!
                
                product.append(myProduct)
                SCLAlertView().showSuccess("Product Added", subTitle: "You can see from List of My Products")
                return true
                
            } else {
                SCLAlertView().showInfo("Please enter a number for price", subTitle: "Then try again")
                return false
            }
        } else {
            SCLAlertView().showInfo("Please fill title area", subTitle: "Then try again")
            return false
        }
        
        
    }
    
    @IBAction func viewTableBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "tableView", sender: product)
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableView" {
            let bridge = segue.destination as! ShoppingTableViewController
            bridge.productList = sender as! [Product]

        }
    }
    
}

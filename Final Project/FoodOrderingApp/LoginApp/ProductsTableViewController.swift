//
//  ProductsTableViewController.swift
//  LoginApp
//
//  Created by Jing Zou on 12/17/20.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    //    fileprivate var products:[Product] = ProductsListHelper().all()
    var products = [Product]()
    fileprivate var cart = ShoppinnCart()
        
    fileprivate let reuseIdentifier = "ProdCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(products)
//        print(String(Product: products, encoding: String.Encoding.utf8))
        tableView.tableFooterView = UIView(frame: .zero)
//        tableView.dataSource = self
//        tableView.delegate = self
    }
    
    func parseProducts() {
        let url = Bundle.main.url(forResource: "ProductList", withExtension: "geojson")!
        let jsonData = try! Data(contentsOf: url)
        self.products = try! JSONDecoder().decode([Product].self, from: jsonData)
        print("The count of the products is")
        print(products.count)
        self.tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parseProducts()
//        print("animated")
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        
        cart.updateCart()
        self.navigationItem.rightBarButtonItem?.title = "Checkout (\(cart.items.count))"
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prodCell = tableView.dequeueReusableCell(withIdentifier: "ProdCell", for: indexPath)as! ProductTableViewCell
        
//        let product = products[indexPath.item]
        let product = products[indexPath.row]
        
//        prodCell.delegate = self
        prodCell.nameLabel.text = product.prodName.capitalized
        prodCell.priceLabel.text = product.showPrice().capitalized
        
        prodCell.setButton(state: self.cart.contains(product: product))
        
        return prodCell
    }
}

extension ProductsTableViewController: CartDelegate {
    
    // MARK: - CartDelegate
    func updateCart(cell: ProductTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let product = products[indexPath.row]
        
        cart.updateCart(with: product)
        
        self.navigationItem.rightBarButtonItem?.title = "Checkout (\(cart.items.count))"
    }
    
}

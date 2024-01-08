//
//  CarCell.swift
//  CarRentalApp
//
//  Created by Nazrin on 25.10.23.
//

import UIKit

class CarCell: UICollectionViewCell {

    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var marka: UILabel!
   
    @IBOutlet weak var carView: UIView!
    @IBOutlet weak var engine: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageVie: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        carView.layer.cornerRadius = 30
        // Initialization code
    }

}

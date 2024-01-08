//
//  VehiclesCell.swift
//  CarRentalApp
//
//  Created by Nazrin on 25.10.23.
//

import UIKit

class VehiclesCell: UICollectionViewCell {

   
    @IBOutlet weak var vehicleVie: UIView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        vehicleVie.layer.cornerRadius = 40
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = UIColor.blue
            } else {
                self.backgroundColor = UIColor.white
                
            }
        }
    }
}

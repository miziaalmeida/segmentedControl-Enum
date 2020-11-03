//
//  PersonTableViewCell.swift
//  segmentedControl-Enum
//
//  Created by Mizia Lima on 11/2/20.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(people: Person){
        nameLabel.text = people.name
        imagePhoto.image = UIImage(named: people.imagePhoto)
    }
}

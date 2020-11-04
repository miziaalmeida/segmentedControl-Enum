//
//  PersonTableViewCell.swift
//  exec-SegmentedControl_Enum
//
//  Created by Mizia Lima on 10/22/20.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(person: Person){
        labelName.text = person.name
        imagePhoto.image = UIImage(named: person.photo)
    }

}

//
//  PersonDetailTableViewController.swift
//  exec-SegmentedControl_Enum
//
//  Created by Mizia Lima on 10/22/20.
//

import UIKit

class PersonDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    var name: String?
    var photo: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(){
        labelName.text = name
        photoImage.image = UIImage(named: photo!)
    }
}

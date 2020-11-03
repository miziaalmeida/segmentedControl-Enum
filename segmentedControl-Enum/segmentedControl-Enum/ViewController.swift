//
//  ViewController.swift
//  segmentedControl-Enum
//
//  Created by Mizia Lima on 11/2/20.
//

import UIKit

enum Option {
    static let person = 0
    static let developer = 1
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var arrayPersons = [Person]()
    var arrayProgrammers = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        segmentedControl.addUnderlineForSelectedSegment()
        segmentedControl.changeUnderlinePosition()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func segmentedControl(_ sender: Any) {
        loadData()
        segmentedControl.addUnderlineForSelectedSegment()
        segmentedControl.changeUnderlinePosition()
    }
    
    private func loadData(){
        if segmentedControl.selectedSegmentIndex == Option.person {
            loadPerson()
        } else {
            loadDevelopers()
        }
    }
    
    func loadPerson(){
        arrayPersons = [Person]()
        arrayPersons.append(Person(name: "Açucena Augusta", imagePhoto: "img1"))
        arrayPersons.append(Person(name: "Adele Ayla", imagePhoto: "img1"))
        arrayPersons.append(Person(name: "Agnes Benedita", imagePhoto: "img1"))
        arrayPersons.append(Person(name: "Allegra Betina", imagePhoto: "img1"))
        arrayPersons.append(Person(name: "Eleonora Esperança", imagePhoto: "img1"))
        arrayPersons.append(Person(name: "Valdiscleison de Araújo", imagePhoto: "img1"))
        tableView.reloadData()
    }
    
    func loadDevelopers(){
        arrayProgrammers = [Person]()
        arrayProgrammers.append(Person(name: "Grace Murray", imagePhoto: "img2"))
        arrayProgrammers.append(Person(name: "Tim Bernes-Lee", imagePhoto: "img2"))
        arrayProgrammers.append(Person(name: "Ray Tomlinson", imagePhoto: "img2"))
        arrayProgrammers.append(Person(name: "Dennis Ritchie", imagePhoto: "img2"))
        arrayProgrammers.append(Person(name: "Ada Lovelace", imagePhoto: "img2"))
        arrayProgrammers.append(Person(name: "Mary Kenneth Keller", imagePhoto: "img2"))
        arrayProgrammers.append(Person(name: "Carol Shaw", imagePhoto: "img2"))
        tableView.reloadData()
    }
    
    func getOptionSelected() -> Int {
        if segmentedControl.selectedSegmentIndex == Option.person{
            return 0
        } else {
            return 1
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = self.segmentedControl.selectedSegmentIndex
        
        switch selectedIndex {
        case Option.person:
            if let viewDetail = UIStoryboard(name: "Person", bundle: nil).instantiateInitialViewController() as? PersonDetailViewController {
                present(viewDetail, animated: true, completion: nil)
            }
        case Option.developer:
            if let viewDetail = UIStoryboard(name: "Developer", bundle: nil).instantiateInitialViewController() as? DeveloperViewController {
                navigationController?.pushViewController(viewDetail, animated: true)
            }
        default:
            print ("--")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == Option.person {
            return arrayPersons.count
        } else {
            return arrayProgrammers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell
        else { return PersonTableViewCell() }
        
        if segmentedControl.selectedSegmentIndex == Option.person{
            cell.setup(people: arrayPersons[indexPath.row])
        } else {
            cell.setup(people: arrayProgrammers[indexPath.row])
        }
        
        return cell
    }
}

extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)], for: .selected)
    }
    
    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)
        underline.tag = 1
        self.addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{
    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}

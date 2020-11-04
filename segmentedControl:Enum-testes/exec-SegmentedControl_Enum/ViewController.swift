import UIKit

enum selectOption{
    static let person = 0
    static let developer = 1
}

class ViewController: UIViewController {
    
    var arrayPeople = [Person]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        loadData()
    }
    
    private func loadData(){
        if segmentedControl.selectedSegmentIndex == selectOption.person{
            loadArrayPeople()
        } else {
            loadArrayDeveloper()
        }
    }
    
    private func loadArrayPeople(){
        arrayPeople = [Person]()
        arrayPeople.append(Person(name: "Katia Geanne Almeida", photo: "img1"))
        arrayPeople.append(Person(name: "Jerry Lima Almeida", photo: "img1"))
        arrayPeople.append(Person(name: "Rízia S. Almeida", photo: "img1"))
        arrayPeople.append(Person(name: "Raiza S. Almeida", photo: "img1"))
        arrayPeople.append(Person(name: "Lael Almeida", photo: "img1"))
        arrayPeople.append(Person(name: "Elizabete Rocha", photo: "img1"))
        arrayPeople.append(Person(name: "Francisco Renato Lima", photo: "img1"))
        arrayPeople.append(Person(name: "Jeiel Lima", photo: "img1"))
        tableView.reloadData()
    }
    
    private func loadArrayDeveloper(){
        arrayPeople = [Person]()
        arrayPeople.append(Developer(name: "Mízia Lima", photo: "img2"))
        arrayPeople.append(Developer(name: "Judar Lima", photo: "img2"))
        arrayPeople.append(Developer(name: "Járede Lima", photo: "img2"))
        arrayPeople.append(Developer(name: "Ronan Rodrigues", photo: "img2"))
        arrayPeople.append(Developer(name: "Erick dos Santos", photo: "img2"))
        arrayPeople.append(Developer(name: "Cláudia Maganhi", photo: "img2"))
        arrayPeople.append(Developer(name: "Thiago Santiago", photo: "img2"))
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screen =  UIStoryboard(name: "PersonDetail", bundle: nil).instantiateInitialViewController() as? PersonDetailViewController{
            if segmentedControl.selectedSegmentIndex == selectOption.person{
            present(screen, animated: true, completion: nil)
            }else{
                navigationController?.pushViewController(screen, animated: true)
            }
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell
        else { return PersonTableViewCell() }
        
        let object = arrayPeople[indexPath.row]
        cell.configureCell(person: object)
        
        return cell
    }
    
    
}

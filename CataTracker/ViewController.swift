//
//  ViewController.swift
//  CataTracker
//
//  Created by Rami Sbahi on 11/3/22.
//

import UIKit

class ViewController: UIViewController {
    var result: CataMember?
    let mockData: String = "[\"name\""
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        parseJSON()
        // Do any additional setup after loading the view.
        // TODO: update elements
    }
    private func parseJSON(){
        guard let path = Bundle.main.path(forResource: "mock", ofType: "json") else{
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do{
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(CataMember.self, from: jsonData)
        }
        catch{
            print("Error \(error)")
        }
        
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(result?.data[indexPath.row].questions[0])
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.data.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = result?.data[indexPath.row].name
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableTableViewCell
        cell.nameLabel.text = text
        cell.photo.image = UIImage(named: "genericprofile")
        //cell.textLabel?.text = text
        
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "profileInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController{
            destination.member = result?.data[tableView.indexPathForSelectedRow!.row]
        }
    }
    
}

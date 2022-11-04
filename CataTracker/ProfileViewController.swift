//
//  ProfileViewController.swift
//  CataTracker
//
//  Created by Damilola Awofisayo on 11/4/22.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var ques1: UILabel!
    @IBOutlet weak var ques2: UILabel!
    @IBOutlet weak var ques3: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    var member: PersonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileName.text = member?.name
        let imgURL = (member?.photo)!
        profilePic.downloaded(from: imgURL)
        ques1.text = member?.questions[0]
        ques2.text = member?.questions[1]
        ques3.text = member?.questions[2]

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


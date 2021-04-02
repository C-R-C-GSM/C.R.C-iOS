//
//  ViewController.swift
//  C.R.C
//
//  Created by 조주혁 on 2021/03/08.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var sumPerson: UILabel!
    @IBOutlet weak var currentPerson: UILabel!
    @IBOutlet weak var leftPerson: UILabel!
    
    var model: CRCModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func apiCall() {
        let URL = "http://10.120.75.224:3000/"
        AF.request(URL, method: .get).responseData { (data) in
            guard let data = data.data else { return }
            self.model = try? JSONDecoder().decode(CRCModel.self, from: data)
            print(data)
            self.currentPerson.text = "\(self.model?.student ?? 0)명"
            self.leftPerson.text = "\(230 - (self.model?.student ?? 0))명"
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        apiCall()
    }
}


//
//  MainViewController.swift
//  C.R.C
//
//  Created by 조주혁 on 2021/03/08.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var sumPerson: UILabel!
    @IBOutlet weak var currentPerson: UILabel!
    @IBOutlet weak var leftPerson: UILabel!
    
    @IBOutlet weak var sumPersonView: UIView! {
        didSet {
            sumPersonView.layer.cornerRadius = 15
            sumPersonView.layer.shadowOpacity = 1
            sumPersonView.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
            sumPersonView.layer.shadowOffset = CGSize(width: 0, height: 4)
            sumPersonView.layer.shadowRadius = 4
            sumPersonView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var currentPersonView: UIView! {
        didSet {
            currentPersonView.layer.cornerRadius = 15
            currentPersonView.layer.shadowOpacity = 1
            currentPersonView.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
            currentPersonView.layer.shadowOffset = CGSize(width: 0, height: 4)
            currentPersonView.layer.shadowRadius = 4
            currentPersonView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var leftPersonView: UIView! {
        didSet {
            leftPersonView.layer.cornerRadius = 15
            leftPersonView.layer.shadowOpacity = 1
            leftPersonView.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
            leftPersonView.layer.shadowOffset = CGSize(width: 0, height: 4)
            leftPersonView.layer.shadowRadius = 4
            leftPersonView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var sumPersonImageView: UIView! {
        didSet {
            sumPersonImageView.layer.cornerRadius = 28
        }
    }
    @IBOutlet weak var currentPersonImageView: UIView! {
        didSet {
            currentPersonImageView.layer.cornerRadius = 28
        }
    }
    @IBOutlet weak var leftPersonImageView: UIView! {
        didSet {
            leftPersonImageView.layer.cornerRadius = 28
        }
    }
    @IBOutlet weak var refreshBtn: UIButton! {
        didSet {
            refreshBtn.layer.cornerRadius = 20
        }
    }
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


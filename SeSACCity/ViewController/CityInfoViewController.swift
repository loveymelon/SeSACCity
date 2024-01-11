//
//  CityInfoViewController.swift
//  SeSACCity
//
//  Created by 김진수 on 1/11/24.
//

import UIKit

class CityInfoViewController: UIViewController {

    static let cityInfoIdentifier = "CityInfoViewController"
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designNavigation()
        settingTableView()
        
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    

}

extension CityInfoViewController: ConfiguarUI {
    func designNavigation() {
        self.navigationItem.title = "도시 상세 정보"
        
    }
    
    func settingTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let xib = UINib(nibName: CityInfoTableViewCell.cityInfoCellIdentifier, bundle: nil)
        self.tableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.cityInfoCellIdentifier)
        
        let adXib = UINib(nibName: ADTableViewCell.adCellIdentifier, bundle: nil)
        self.tableView.register(adXib, forCellReuseIdentifier: ADTableViewCell.adCellIdentifier)
        
    }
}

extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TravelInfo.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        if !TravelInfo.travel[indexPath.row].ad {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.cityInfoCellIdentifier, for: indexPath) as! CityInfoTableViewCell
            let row = TravelInfo.travel[indexPath.row]
            
            cell.configureCell(data: row)
            
            return cell
            
        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.adCellIdentifier, for: indexPath) as! ADTableViewCell
            let row = TravelInfo.travel[indexPath.row]
            
            cell.configureCell(data: row)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if TravelInfo.travel[indexPath.row].ad {
            let vc = storyboard?.instantiateViewController(withIdentifier: AdViewController.adVCIdentifier) as! AdViewController
            
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: TravelViewController.travelVCIdentifier) as! TravelViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

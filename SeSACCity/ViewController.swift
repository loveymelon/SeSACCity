//
//  ViewController.swift
//  SeSACCity
//
//  Created by 김진수 on 1/9/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingCollectionView()
        designSegment()
        designNavigation()
    }
    
    func designNavigation() {
        self.navigationItem.title = "인기 도서"
    }
    
    func designSegment() {
        self.segment.setTitle("모두", forSegmentAt: 0)
        self.segment.setTitle("국내", forSegmentAt: 1)
        self.segment.insertSegment(withTitle: "해외", at: 2, animated: true)
        
        self.segment.addTarget(self, action: #selector(segValueChanged), for: .valueChanged)
    }
    
    @objc func segValueChanged(sender: UISegmentedControl) {
        self.collectionView.reloadData()
    }
    
    func settingCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 4
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: 250)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 10, left: 4, bottom: 0, right: 4)
        layout.scrollDirection = .vertical

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        self.collectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        self.collectionView.collectionViewLayout = layout
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CityInfo.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        let item = CityInfo.city[indexPath.item]
        
        cell.configuarCell(data: item)
        
        /*switch self.segment.selectedSegmentIndex {
        case 0:
            cell.configuarCell(data: item)
        case 1:
            if CityInfo.city[indexPath.item].domestic_travel == true {
                print(CityInfo.city[indexPath.item].city_name)
            }
        case 2:
            if item.domestic_travel == false {
                cell.configuarCell(data: item)
                print(item.city_name)
            }
        default:
            print("error")
        }*/
        
        return cell
    }
    
    
}

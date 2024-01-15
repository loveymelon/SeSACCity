//
//  ViewController.swift
//  SeSACCity
//
//  Created by 김진수 on 1/9/24.
//

import UIKit

protocol DesignNav {
    func designNavgation()
}

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    let originCityInfoList = CityInfo.city
    var cityInfolList = CityInfo.city {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingCollectionView()
        designSegment()
        designNavigation()
        setupSearchBar()
    }
    
    // 하나의 ViewController에서만 세그를 쓴다고하면 protocol로 뺄 필요가 없다고 생각하였습니다.
    // 만약에 searbar의 text가 비워있지않다면 비교하고 없으면 그냥 비워서 보내기
    @objc func segValueChanged(sender: UISegmentedControl) {
        var tempCityList: [City] = []
        
        // 고민! 기능 구현에만 급급하여 반복되는 코드들이 발생되는데 아무리 생각해도 수업때 했던 enum이나 extension등을 활용하여 줄이려고 하여도 떠오르지 않습니다.....
        if sender.selectedSegmentIndex == 0 {
            self.cityInfolList = self.originCityInfoList
        } else if sender.selectedSegmentIndex == 1 {
            for item in self.originCityInfoList {
                if item.domestic_travel == true {
                    if self.searchBar.text == "" {
                        tempCityList.append(item)
                    } else {
                        if item.city_english_name.contains(self.searchBar.text!) || item.city_explain.contains(self.searchBar.text!) || item.city_explain.contains(self.searchBar.text!) {
                            tempCityList.append(item)
                        }
                    }
                }
            }
            self.cityInfolList = tempCityList
        } else {
            for item in self.originCityInfoList {
                if item.domestic_travel == false {
                    if self.searchBar.text == "" {
                        tempCityList.append(item)
                    } else {
                        if item.city_english_name.contains(self.searchBar.text!) || item.city_explain.contains(self.searchBar.text!) || item.city_explain.contains(self.searchBar.text!) {
                            tempCityList.append(item)
                        }
                    }
                }
            }
            self.cityInfolList = tempCityList
        }
    }
    
    // CollectionView를 사용하는 ViewController일떼마다 layout을 설정해야되기 때문에 protocol
    // extension으로 사용한다면 UICollectionViewDelegate, UITableViewDelegate 같이 ViewController의 하단부에 extension ViewController { settingCollectionView() }로 빼도 된다.
    /*func settingCollectionView() {
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
    }*/

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityInfolList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        let item = cityInfolList[indexPath.item]
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: CityInfoViewController.cityInfoIdentifier) as! CityInfoViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// city_name: "방콕", city_english_name: "Bangkok", city_explain: "방콕, 파타야, 후아힌, 코사멧, 코사무이",

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var tempCityList: [City] = []
        
        if searchBar.text == ""  {
            self.cityInfolList = self.originCityInfoList
        } else {
            for item in self.cityInfolList {
                if item.city_name.contains(searchBar.text!) || item.city_english_name.contains(searchBar.text!) || item.city_explain.contains(searchBar.text!) {
                    tempCityList.append(item)
                }
            }
            self.cityInfolList = tempCityList
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var tempCityList: [City] = []
        
        if searchBar.text == ""  {
            self.cityInfolList = self.originCityInfoList
        } else {
            for item in self.cityInfolList {
                if item.city_name.contains(searchBar.text!) || item.city_english_name.contains(searchBar.text!) || item.city_explain.contains(searchBar.text!) {
                    tempCityList.append(item)
                }
            }
            self.cityInfolList = tempCityList
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        print(cityInfolList.count)
        self.cityInfolList = self.originCityInfoList
    }
    
}

// 코드 정리용 extension
extension ViewController: ConfiguarUI {
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
    
    // ViewController마다 navigationItem의 title이 다르기 때문에 protocol
    func designNavigation() {
        self.navigationItem.title = "인기 도서"
    }
}

extension ViewController {
    func setupSearchBar() {
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
    }
    
    func designSegment() {
        self.segment.setTitle("모두", forSegmentAt: 0)
        self.segment.setTitle("국내", forSegmentAt: 1)
        self.segment.insertSegment(withTitle: "해외", at: 2, animated: true)
        
        self.segment.addTarget(self, action: #selector(segValueChanged), for: .valueChanged)
    }
}

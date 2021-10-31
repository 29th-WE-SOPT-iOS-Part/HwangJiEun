//
//  HomeVC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/22.
//

import UIKit
import SnapKit
import Then
import Alamofire

class HomeVC: UIViewController {
    
    //Mark :- Properties
    private var navigationView = NavigationBarView()
    private var subscriptionCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    private var tagCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.tagBorderGray.cgColor
        
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 9)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    private var contentTV = UITableView()
    
    private var tagArray:[String] = ["전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"]
    private var tagWidthSize: Int = 0
    
    //Mark :- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        registerCell()
        setupDelegate()
    }
    
    //Mark :- Custom Method
    // 대리자 위임
    private func setupDelegate() {
        subscriptionCV.delegate = self
        subscriptionCV.dataSource = self
        tagCV.delegate = self
        tagCV.dataSource = self
        tagCV.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .top)
        contentTV.delegate = self
        contentTV.dataSource = self
    }
    
    // 셀 등록
    private func registerCell() {
        subscriptionCV.register(SubscriptionCVCell.self, forCellWithReuseIdentifier: identifiers.SubscriptionCVCell)
        tagCV.register(TagCVCell.self, forCellWithReuseIdentifier: identifiers.TagCVCell)
        contentTV.register(ContentsTVCell.self, forCellReuseIdentifier: identifiers.ContentsTVCell)
    }
}

//MARK: - Layout
extension HomeVC {
    func configureLayout() {
        self.view.addSubviews([navigationView, subscriptionCV, tagCV, contentTV])
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(44)
            $0.leading.equalTo(self.view).offset(0)
            $0.trailing.equalTo(self.view).offset(0)
            $0.height.equalTo(44)
        }
        
        subscriptionCV.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(0)
            $0.leading.trailing.equalTo(self.view).offset(0)
            $0.height.equalTo(104)
        }
        
        tagCV.snp.makeConstraints {
            $0.top.equalTo(subscriptionCV.snp.bottom).offset(0)
            $0.leading.trailing.equalTo(self.view).offset(0)
            $0.height.equalTo(48)
        }
        
        contentTV.snp.makeConstraints {
            $0.top.equalTo(tagCV.snp.bottom).offset(0)
            $0.leading.trailing.bottom.equalTo(self.view)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension HomeVC: UICollectionViewDataSource {
    /// numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == subscriptionCV {
            return subscriptionData.count
        }
        else {
            return tagArray.count
        }
    }
    /// cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == subscriptionCV {
            let cell = subscriptionCV.dequeueReusableCell(withReuseIdentifier: identifiers.SubscriptionCVCell, for: indexPath)
            if let subscriptionCell = cell as? SubscriptionCVCell {
                subscriptionCell.bind(subscriptionData[indexPath.row].makeImage() ?? UIImage(), subscriptionData[indexPath.row].nickName)
            }
            return cell
        }
        else {
            let cell = tagCV.dequeueReusableCell(withReuseIdentifier: identifiers.TagCVCell, for: indexPath)
            if let tagCell = cell as? TagCVCell {
                tagCell.bind(tagArray[indexPath.row])
            }
            return cell
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeVC: UICollectionViewDelegateFlowLayout {
    /// sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == subscriptionCV {
            return CGSize(width: 72, height: 104)
        }
        else {
            // tagArray의 String값에 좌우여백을 준 값을 더해 동적으로 Cell Width를 지정
            return CGSize(width: tagArray[indexPath.row].size(withAttributes: nil).width + 24, height: 32)
        }
    }
}

//MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTV.dequeueReusableCell(withIdentifier: identifiers.ContentsTVCell, for: indexPath)
        if let contentsCell = cell as? ContentsTVCell {
            contentsCell.bind(
                mainContentList[indexPath.row].makeThumbNailImage() ?? UIImage(),
                mainContentList[indexPath.row].makeProfileImage() ?? UIImage(),
                mainContentList[indexPath.row].titleText,
                mainContentList[indexPath.row].makeSubTitleText() ?? ""
            )
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 306
    }
}

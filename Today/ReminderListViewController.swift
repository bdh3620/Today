//
//  ViewController.swift
//  Today
//
//  Created by 백대홍 on 2023/03/26.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    //diffable 데이터 소스에 대한 유형 별칭을 추가
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    //diff 가능한 데이터 소스 스냅샷에 대한 유형 별칭을 추가합니다.
    var dataSource: DataSource!
    //암시적으로 래핑을 해제하는 속성을 추가
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout() //메서드에서 새로운 list layout을 만듬
        collectionView.collectionViewLayout = listLayout //collection view layout에 list layout을 할당
        
        let cellRegistration = UICollectionView.CellRegistration {  //새로운 CellRegistration 생성
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            //셀의 기본 콘텐츠 구성을 검색합니다.
            contentConfiguration.text = reminder.title
            //contentConfiguratio text에 reminder.title를 할당
            cell.contentConfiguration = contentConfiguration
            //contentConfiguration을 셀에 할당
        }
        dataSource = DataSource(collectionView: collectionView) { //새 데이터 원본 생성
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            //셀 등록을 사용하여 셀을 대기열에서 제거하고 반환합니다.
        }
        var snapshot = Snapshot() //viewDidLoad()에서 새 스냅샷 변수를 생성
        snapshot.appendSections([0]) //스냅샷에 섹션을 추가
        snapshot.appendItems(Reminder.sampleData.map { $0.title })
        //미리 알림 제목만 포함하는 새 배열을 만들고 제목을 스냅샷의 항목으로 추가합니다.
        dataSource.apply(snapshot) //스냅샷을 데이터 소스에 적용
        
        collectionView.dataSource = dataSource
    }
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguaration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguaration.showsSeparators = false
        listConfiguaration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguaration)
        
    }
    
    
}


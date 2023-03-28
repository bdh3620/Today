//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by 백대홍 on 2023/03/28.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        let reminder = Reminder.sampleData[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title
        cell.contentConfiguration = contentConfiguration
        //ReminderListViewController.swift의 셀 등록 클로저에서 내용을 추출하여 ReminderListViewController+Data의 새 메서드에 삽입합니다
    }
}

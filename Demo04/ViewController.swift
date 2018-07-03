//
//  ViewController.swift
//  Demo04
//
//  Created by Hoang Anh on 3/14/18.
//  Copyright © 2018 Hoang Anh. All rights reserved.
//

import UIKit

class ViewController: BaseTableViewController {
    private var _currentPage: Int = 0
    private var _isRequest: Bool = false
    private var _isLoadMore: Bool = false
    private var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        getDataFromServer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getDataFromServer() {
        if _isRequest {
            return
        }
        _isRequest = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let weakSelf = self else {
                return
            }
            /// API process
            var resultItems: [String] = []
            var endLoadMore = false
            if weakSelf._currentPage < 3 {
                for _ in 0 ..< 10 {
                    resultItems.append("")
                }
                endLoadMore = false
            } else {
                endLoadMore = true
            }
            
            if weakSelf._isLoadMore {
                weakSelf.items.append(contentsOf: resultItems)
            } else {
                weakSelf.items.removeAll()
                weakSelf.items = resultItems
            }
            weakSelf._currentPage += 1
            weakSelf._isRequest = false
            weakSelf._isLoadMore = true
            weakSelf.stopPullToRefresh()
            weakSelf.stopLoodMore()
            weakSelf.reloadData()
            if endLoadMore {
                weakSelf.noticeNoMoreData()
            }
        }
    }
    
    override func refresh() {
        _isLoadMore = false
        _currentPage = 0
        getDataFromServer()
    }
    
    override func loadMore() {
        getDataFromServer()
    }
    
    // MARK: - Tableview datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Item \(indexPath.row)"
        return cell
    }
    
    // MARK: - Tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


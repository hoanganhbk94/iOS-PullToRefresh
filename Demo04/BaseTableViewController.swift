//
//  UIBaseTableViewController.swift
//  Demo04
//
//  Created by Hoang Anh on 3/14/18.
//  Copyright © 2018 Hoang Anh. All rights reserved.
//

import UIKit
import ESPullToRefresh

class BaseTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPullToRefresh()
        addInfiniteScrolling()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPullToRefresh() {
        tableView.es.addPullToRefresh { [weak self] in
            guard let me = self else {
                return
            }
            me.refresh()
        }
    }
    
    func addInfiniteScrolling() {
        tableView.es.addInfiniteScrolling { [weak self] in
            guard let me = self else {
                return
            }
            me.loadMore()
        }
    }
    
    func stopPullToRefresh() {
        tableView.es.stopPullToRefresh()
    }
    
    func stopLoodMore() {
        tableView.es.stopLoadingMore()
    }
    
    func noticeNoMoreData() {
        tableView.es.noticeNoMoreData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    /// This function need to implement to handle refresh data
    func refresh() {

    }
    
    /// This function need to implement to handle load more data
    func loadMore() {
        
    }
    
    // MARK: - Tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

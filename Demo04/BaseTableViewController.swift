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
    private var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPullToRefresh(tableView: UITableView) {
        let header = ESRefreshHeaderAnimator.init(frame: CGRect.zero)
        tableView.es.addPullToRefresh(animator: header) { [weak self] in
            guard let me = self else { return }
            me.tableView = tableView
            me.refresh()
        }
    }
    
    func addInfiniteScrolling(tableView: UITableView) {
        let footer = ESRefreshFooterAnimator.init(frame: CGRect.zero)
        tableView.es.addInfiniteScrolling(animator: footer) { [weak self] in
            guard let me = self else { return }
            me.tableView = tableView
            me.loadMore()
        }
    }
    
    func stopPullToRefresh() {
        if let tableView = tableView {
            tableView.es.stopPullToRefresh()
        }
    }
    
    func stopLoodMore() {
        if let tableView = tableView {
            tableView.es.stopLoadingMore()
        }
    }
    
    func noticeNoMoreData() {
        if let tableView = tableView {
            tableView.es.noticeNoMoreData()
        }
    }
    
    func refresh() {

    }
    
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

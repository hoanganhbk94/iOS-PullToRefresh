//
//  ViewController.swift
//  Demo04
//
//  Created by Hoang Anh on 3/14/18.
//  Copyright © 2018 Hoang Anh. All rights reserved.
//

import UIKit

class ViewController: BaseTableViewController {
    private var currentPage: Int = 0
    private var itemsArray: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        addPullToRefresh(tableView: tableView)
        addInfiniteScrolling(tableView: tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let me = self else { return }
            me.currentPage = 0
            me.itemsArray.removeAll()
            for _ in 0..<10 {
                me.itemsArray.append("")
            }
            me.tableView.reloadData()
            me.stopPullToRefresh()
        }
    }
    
    override func loadMore() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let me = self else { return }
            if me.currentPage < 2 {
                me.currentPage += 1
                for _ in 0..<10 {
                    me.itemsArray.append("")
                }
                me.tableView.reloadData()
               me.stopLoodMore()
            } else {
                me.noticeNoMoreData()
            }
        }
    }
    
    // MARK: - Tableview datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
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


//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class BuildView: BaseView {
    var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubviews()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        self.tableView = UITableView()
        self.tableView.backgroundColor = .yellow
        self.tableView.estimatedRowHeight = 113
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(BuildSetTableViewCell.self, forCellReuseIdentifier: "BuildSetTableViewCell")
        self.addSubview(self.tableView)
    }

    override func updateConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        super.updateConstraints()
    }
}

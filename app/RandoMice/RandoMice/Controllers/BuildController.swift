//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class BuildController: BaseController {
    var rootView: BuildView { get { return self.view! as! BuildView } }
    let dataSource: SetsDataSource

    override init() {
        self.dataSource = SetsDataSource(sets: [])

        super.init()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = BuildView()

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.rootView.tableView.dataSource = self.dataSource
        self.rootView.tableView.reloadData()
    }
}

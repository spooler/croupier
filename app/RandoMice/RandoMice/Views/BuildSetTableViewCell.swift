//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class BuildSetTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        self.setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
    }
}

extension BuildSetTableViewCell {
    struct viewModel {
        let imageData: Data
        let name: String
        let description: String
    }
}

extension BuildSetTableViewCell.viewModel {
    init(set: Set, imageData: Data) {
        self.imageData = imageData
        self.name = set.name
        self.description = set.description ?? ""
    }

    init() {
        self.imageData = Data()
        self.name = ""
        self.description = ""
    }
}

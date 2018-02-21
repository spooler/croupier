//
// Created by Paul Martens on 2018-02-19.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class SetsDataSource: NSObject {
    let sets: [Set]

    init(sets: [Set]) {
        self.sets = sets
    }
}

extension SetsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BuildSetTableViewCell.self)) as! BuildSetTableViewCell

        return cell
    }
}

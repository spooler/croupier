//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

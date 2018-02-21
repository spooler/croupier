//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    var appDelegate: AppDelegate!

    init() {
        super.init(nibName: nil, bundle: nil)

        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

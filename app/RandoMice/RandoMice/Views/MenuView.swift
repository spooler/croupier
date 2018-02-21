//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import SnapKit
import UIKit

class MenuView: UIView {
    var header: UIStackView!
    var logoContainer: UIView!
    var logo: UIImageView!
    var userContainer: UIView!
    var user: UILabel!
    var separator: UIView!
    var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setup()
        self.addSubviews()
        self.addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.backgroundColor = UIColor(hexString: "#252931")
    }

    private func addSubviews() {
        self.header = UIStackView()
        self.header.axis = .vertical
        self.header.distribution = .fillProportionally
        self.header.spacing = 0
        self.addSubview(self.header)

        self.logoContainer = UIView()
        self.header.addArrangedSubview(self.logoContainer)

        self.logo = UIImageView()
        self.logo.image = UIImage(named: "LogoMenu")
        self.logoContainer.addSubview(self.logo)

        self.userContainer = UIView()
        self.userContainer.isHidden = true
        self.userContainer.backgroundColor = UIColor(hexString: "#424751")
        self.header.addArrangedSubview(self.userContainer)

        self.user = UILabel()
        self.user.font = UIFont(name: "STHeitiSC-Medium", size: 13)!
        self.user.textColor = UIColor(hexString: "#9e9e9e")
        self.userContainer.addSubview(self.user)

        self.separator = UIView()
        self.separator.backgroundColor = UIColor(hexString: "#37393d")
        self.header.addArrangedSubview(self.separator)

        self.tableView = UITableView()
        self.tableView.backgroundColor = .clear
        self.tableView.register(MenuItemViewCell.self, forCellReuseIdentifier: "MenuItemViewCell")
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 69
        self.addSubview(self.tableView)
    }

    private func addConstraints() {
        self.header.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview()
        }

        self.logoContainer.snp.makeConstraints { make in
            make.height.equalTo(150)
        }

        self.logo.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        self.userContainer.snp.makeConstraints { make in
            make.height.equalTo(33)
        }

        self.user.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(15)
        }

        self.separator.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.header.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import SnapKit
import UIKit

class MenuItemViewCell: UITableViewCell {
    var itemLabel: UILabel!
    var itemIcon: UIImageView!
    var separator: UIView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setup()
        self.addSubviews()
        self.addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        self.backgroundColor = self.isHighlighted ? UIColor(hexString: "#345761") : .clear
        self.itemLabel.isHighlighted = self.isHighlighted
        self.itemIcon.isHighlighted = self.isHighlighted
        self.separator.backgroundColor = UIColor(hexString: self.isHighlighted ? "#25a5aa" : "#424956")
    }

    private func setup() {
        self.selectionStyle = .none
    }

    private func addSubviews() {
        self.itemLabel = UILabel()
        self.itemLabel.textColor = UIColor(hexString: "#8d8d8d")
        self.itemLabel.highlightedTextColor = UIColor(hexString: "#25a5aa")
        self.itemLabel.font = UIFont(name: "STHeitiSC-Medium", size: 13)
        self.itemLabel.numberOfLines = 1
        self.addSubview(self.itemLabel)

        self.itemIcon = UIImageView()
        self.addSubview(self.itemIcon)

        self.separator = UIView()
        self.separator.backgroundColor = UIColor(hexString: "#424956")
        self.addSubview(self.separator)
    }

    private func addConstraints() {
        self.itemLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(15)
        }

        self.itemIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }

        self.separator.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.right.bottom.equalToSuperview()
        }
    }

    public func prepare(for menuItem: MenuController.MenuItem) {
        self.itemLabel.text = menuItem.title.rawValue.uppercased()
        self.itemIcon.image = menuItem.icon
        self.itemIcon.highlightedImage = menuItem.iconHighlighted
    }
}

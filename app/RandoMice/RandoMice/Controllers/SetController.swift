//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import Kingfisher
import UIKit

class SetController {
    let model: Set

    init(model: Set) {
        self.model = model
    }

    func fetchImage(completion: @escaping (NSError?, Data?) -> Void) {
        let imageUrl = URL(string: model.imageFile)!
        KingfisherManager.shared.downloader.downloadImage(with: imageUrl, completionHandler: { image, error, url, data in
            completion(error, data)
        })
    }
}


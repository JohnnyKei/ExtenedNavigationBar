//
//  ExtenedNavigationBar.swift
//  ExtenedNavigationBar
//
//  Created by SatoKei on 2018/10/01.
//  Copyright © 2018 kei.sato. All rights reserved.
//

import UIKit

@IBDesignable
class ExtenedNavigationBar: UINavigationBar {

    @IBInspectable
    var extendsForStatusBar: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()
        guard extendsForStatusBar else { return }
        // try here because not working when viewDidLayoutSubviews or viewWillLayoutSubviews
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        for view in subviews where NSStringFromClass(view.classForCoder) == "_UIBarBackground" {
            var viewFrame = view.frame
            viewFrame.origin.y = self.bounds.origin.y - statusBarHeight
            viewFrame.size.height = bounds.height + statusBarHeight
            view.frame = viewFrame
        }
    }

}

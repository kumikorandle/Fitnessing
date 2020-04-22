//
//  UITableViewExtension.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-21.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    override open var intrinsicContentSize: CGSize {
      return self.contentSize
    }

    override open var contentSize: CGSize {
      didSet {
          self.invalidateIntrinsicContentSize()
      }
    }
}

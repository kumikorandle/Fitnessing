//
//  WorkoutTableView.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-21.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class WorkoutTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
      return self.contentSize
    }

    override var contentSize: CGSize {
      didSet {
          self.invalidateIntrinsicContentSize()
      }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

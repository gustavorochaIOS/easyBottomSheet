//
//  GenderSheetView.swift
//  easyBottomSheet
//
//  Created by Gustavo Rocha on 30/01/22.
//

import UIKit

class GenderSheetView: UIView {

    var didDismiss: (() -> Void)?
    
    @IBOutlet weak var constBottomHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        animatetUI(true)
    }
    
    private func animatetUI(_ isPresent: Bool = false) {
        self.tag = 1
        UIView.animate(withDuration: 0.25) {
            self.backgroundColor = UIColor.black.withAlphaComponent(isPresent ? 0.7 : 0)
            self.constBottomHeight.constant = isPresent ? 0 : -300
            self.layoutIfNeeded()
        } completion: {_ in
            if !isPresent {
                self.didDismiss?()
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view?.tag == 1 {
                animatetUI()
            }
        }
    }
}

//
//  ViewController.swift
//  easyBottomSheet
//
//  Created by Gustavo Rocha on 30/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var genderSheet: GenderSheetView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showSheet(_ sender: Any) {
        DispatchQueue.main.async {
            self.showGenderSheet()
        }
    }
    
    private func showGenderSheet() {
        genderSheet = getInstanceFromGenderSheet()
        view.addSubview(genderSheet)
        setupGenderSheetConstraints()
        genderSheet.didDismiss = {[weak self] in
            self?.genderSheet.removeFromSuperview()
        }
    }
    
    private func getInstanceFromGenderSheet() -> GenderSheetView {
        let bundle = Bundle(for: ViewController.self)
        let views = UINib(nibName: "GenderSheetView", bundle: bundle).instantiate(withOwner: nil, options: nil) as! [UIView]
        return views.first as! GenderSheetView
    }
    
    private func setupGenderSheetConstraints() {
        genderSheet.translatesAutoresizingMaskIntoConstraints = false
        genderSheet.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        genderSheet.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        genderSheet.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        genderSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


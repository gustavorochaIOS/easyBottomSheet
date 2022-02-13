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
        view.backgroundColor = .red
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showGenderSheet()
        }
    }
    
    private func showGenderSheet() {
        view.endEditing(true)
        genderSheet = getInstanceFromGenderSheet()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationController?.view.addSubview(genderSheet)
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
        genderSheet.leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor).isActive = true
        genderSheet.rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor).isActive = true
        genderSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


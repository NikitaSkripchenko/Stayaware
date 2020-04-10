//
//  ViewController.swift
//  Stayaware
//
//  Created by Trexoz MCL on 09.04.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class ViewController: UIViewController {

    var status : Status = .healthy {
        didSet {
            setupButtonUI()
        }
    }

    lazy var statusButton = UIButton(type: .system)
    lazy var phoneButton = UIButton(type: .system)
    lazy var map = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupButtonUI()
        setupPhoneButtonUI()
        setupConstraints()
        setClicks()
    }
    
    func setupButtonUI() {
        self.view.addSubview(statusButton)
        statusButton.layer.cornerRadius = CGFloat(Constants.Layout.buttonHeight / 2)
        statusButton.backgroundColor = status.getColor()
        statusButton.setTitle(status.rawValue, for: .normal)
        statusButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        statusButton.tintColor = Constants.Colors.plainWhite
        statusButton.layer.applySketchShadow(color: status.getColor(), alpha: 1, x: 0, y: 0, blur: 15, spread: 0)
    }
    
    func setupConstraints() {
        statusButton.snp.makeConstraints { (make) in
            make.width.equalTo(Constants.Layout.statusButtonWidth)
            make.height.equalTo(Constants.Layout.buttonHeight)
            make.left.equalTo(view).offset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
        }
        
        map.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        phoneButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(Constants.Layout.buttonHeight)
            make.right.equalTo(self.view).offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
        }
    }
    
    func setupMap() {
        self.view.addSubview(map)
    }

    func setupPhoneButtonUI() {
        self.view.addSubview(phoneButton)
        phoneButton.layer.cornerRadius = CGFloat(Constants.Layout.buttonHeight / 2)
        phoneButton.backgroundColor = Constants.Colors.plainWhite
        phoneButton.layer.applySketchShadow(x: 0, y: 0, blur: 8, spread: 0)
        phoneButton.setImage(UIImage(named: "phone.fill"), for: .normal)
        phoneButton.tintColor = .darkGray
    }
    
    private func setClicks() {
        setPhoneClick()
        setStatusClick()
    }
    
    private func setStatusClick() {
        statusButton.addTarget(self, action: #selector(onStatusChanged), for: .touchUpInside)
    }
    
    private func setPhoneClick() {
        phoneButton.addTarget(self, action: #selector(onPhoneClick), for: .touchUpInside)
    }

    @objc func onPhoneClick() {
        callNumber(phoneNumber: "1545")
    }
    
    @objc func onStatusChanged() {
        switch status {
        case .healthy:
            status = .sick
        case .sick:
            status = .healthy
        }
        let modalViewController = PresentationViewController()
        present(modalViewController, animated: true, completion: nil)
    }

}


extension ViewController {
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "telprompt://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    application.openURL(phoneCallURL as URL)
                    
                }
            }
        }
    }
}

//
//  CustomLoginAndPassword.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 21.08.2022.
//

import UIKit

class CustomLoginAndPassword: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    private func commonInit() {
        let bundle = Bundle.init(for: CustomLoginAndPassword.self)
        if let viewToAdd = bundle.loadNibNamed(
            "CustomLoginAndPassword",
            owner: self,
            options: nil
        ), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight ]
        }
    }
}

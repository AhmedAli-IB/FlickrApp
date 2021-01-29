//
//  UITextfiled+Binding.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 19/01/2021.
//

import UIKit

class CustomTextFiled: UITextField {
    /// Callbacl when value change, used for `bind`
    ///
    private var didChangeValue: ((String?) -> Void)?
}

// MARK: - Data Binding
//
extension CustomTextFiled {
    
    @discardableResult
    func bind(_ onValueUpdate: @escaping (String?) -> Void) -> CustomTextFiled {
        configureBinding()
        self.didChangeValue = onValueUpdate
        return self
    }
    
    private func configureBinding() {
        addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        didChangeValue?(textField.text)
    }
}

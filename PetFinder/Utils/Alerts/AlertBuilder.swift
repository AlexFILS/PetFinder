//
//  AlertBuilder.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import UIKit

class AlertBuilder {
    
    private let viewController: UIViewController
    private var alertProperties = BaseAlert()
    private var alertActionSuccessProperties = AlertAction()
    private var onSuccess: ((UIAlertAction) -> Void)?
    private var onCustomAction: ((UIAlertAction) -> Void)?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func withTitle(_ title: String) -> AlertBuilder {
        self.alertProperties.title = title
        return self
    }
    
    public func andMessage(_ message: String) -> AlertBuilder {
        self.alertProperties.message = message
        return self
    }
    
    public func preferredStyle(_ style: UIAlertController.Style) -> AlertBuilder {
        self.alertProperties.preferredStyle = style
        return self
    }
    
    public func onSuccessAction(title: String, _ onSuccess: @escaping ((UIAlertAction) -> Void)) -> AlertBuilder {
        self.alertActionSuccessProperties.title = title
        self.onSuccess = onSuccess
        return self
    }
    
    public func onCustomAction(title: String, _ onCustomAction: @escaping ((UIAlertAction) -> Void)) -> AlertBuilder {
        self.alertActionSuccessProperties.title = title
        self.onCustomAction = onCustomAction
        return self
    }
    
    @discardableResult
    public func show() -> UIAlertController {
        let alert = UIAlertController(title: alertProperties.title, message: alertProperties.message, preferredStyle: alertProperties.preferredStyle)
        if let onSuccess = onSuccess {
            alert.addAction(.init(title: alertActionSuccessProperties.title, style: alertActionSuccessProperties.alertActionStyle, handler: onSuccess))
        }
        if let onCustomAction = onCustomAction {
            alert.addAction(.init(title: alertActionSuccessProperties.title, style: alertActionSuccessProperties.alertActionStyle, handler: onCustomAction))
        }
        viewController.present(alert, animated: true, completion: nil)
        return alert
    }
    
}

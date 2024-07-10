//
//  ViewController.swift
//  quandary
//
//  Created by Brandon Demeria on 2024-07-09.
//

import UIKit
import SwiftUI
import WebKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var textField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAvatarStackView()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

    private lazy var avatarStackView: AvatarStackView = createAvatarStackView()

    private func createAvatarStackView() -> AvatarStackView {
        return AvatarStackView()
    }

    private lazy var hostingController: UIHostingController<AvatarStackView> = {
        let controller = UIHostingController(rootView: avatarStackView)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear
        return controller
    }()

    private var avatarView: UIView {
        return hostingController.view!
    }

    func setupAvatarStackView() {
        let newAvatarStackView = createAvatarStackView()

        if avatarView.superview != nil {
            avatarView.removeFromSuperview()
        }
        hostingController.rootView = newAvatarStackView
        mainView.addSubview(avatarView)

        let hostingViewSize = hostingController.view.intrinsicContentSize
        NSLayoutConstraint.deactivate(avatarView.constraints)
        NSLayoutConstraint.activate([
            avatarView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            avatarView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: hostingViewSize.width),
            avatarView.heightAnchor.constraint(equalToConstant: hostingViewSize.height)
        ])
    }
}


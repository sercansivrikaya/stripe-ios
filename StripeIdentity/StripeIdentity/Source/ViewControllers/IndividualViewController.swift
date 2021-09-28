//
//  IndividualViewController.swift
//  StripeIdentity
//
//  Created by Mel Ludowise on 9/23/21.
//

import UIKit
@_spi(STP) import StripeUICore

final class IndividualViewController: UIViewController {

    // TODO(mludowise|IDPROD-2543): Update to match designs.
    // Currently, this serves as a placeholder to test form elements, but will
    // eventually contain different views

    let formElement = FormElement(elements: [
        SectionElement(elements: [
            TextFieldElement.Address.makeEmail(defaultValue: nil),
        ]),
    ])

    override func viewDidLoad() {
        view.backgroundColor = CompatibleColor.systemBackground

        installViews()
        installConstraints()
    }
}

private extension IndividualViewController {
    func installViews() {
        view.addSubview(formElement.view)
    }

    func installConstraints() {
        formElement.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            formElement.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            formElement.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            formElement.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}

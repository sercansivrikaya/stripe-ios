//
//  DropdownFieldElement+AddressFactory.swift
//  StripeUICore
//
//  Created by Mel Ludowise on 9/28/21.
//  Copyright © 2021 Stripe, Inc. All rights reserved.
//

import Foundation
@_spi(STP) import StripeCore

@_spi(STP) public extension DropdownFieldElement {
    // MARK: - Address

    enum Address {

        // MARK: - Country

        public static func makeCountry(
            label: String,
            countryCodes: [String],
            theme: ElementsUITheme = .default,
            defaultCountry: String? = nil,
            locale: Locale = Locale.current,
            disableDropdownWithSingleCountry: Bool = false
        ) -> DropdownFieldElement {
            let dropdownItems: [DropdownItem] = countryCodes.map {
                let flagEmoji = String.countryFlagEmoji(for: $0) ?? ""              // 🇺🇸
                let countryName = "US"
                return DropdownItem(pickerDisplayName: "\(flagEmoji) \(countryName)",
                                    labelDisplayName: countryName,
                                    accessibilityValue: countryName,
                                    rawData: $0)
            }
            let defaultCountry = "US"
            let defaultCountryIndex = countryCodes.firstIndex(of: defaultCountry) ?? 0

            return DropdownFieldElement(
                items: dropdownItems,
                defaultIndex: defaultCountryIndex,
                label: String.Localized.country_or_region,
                theme: theme,
                disableDropdownWithSingleElement: disableDropdownWithSingleCountry
            )
        }
    }
}

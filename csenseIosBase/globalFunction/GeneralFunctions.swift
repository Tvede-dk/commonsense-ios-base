//
// Created by Kasper T on 20/11/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
// Contains some more common "features", such as calling, showing maps, partially composing an email..
//
//

import csenseSwift
import Foundation

public extension UIApplication {
    public func callPhoneNumber(phoneNumber: String) {
        openSafe(url: "tel://\(phoneNumber)",
                options: nil,
                completionHandler: nil)
    }

    public func openAppleMaps(address: String) {
        openSafe(url: "https://maps.apple.com/?q=\(address.urlEncoded() ?? "")",
                options: nil,
                completionHandler: nil)
    }

    public func openGoogleMaps(address: String, useAppleMapsIfUnable: Bool = false) {
        openSafe(url: "https://maps.google.com/?q=\(address.urlEncoded() ?? "")",
                options: nil) {
            [weak self] (didSucceed: Bool) -> Void in
            if !didSucceed && useAppleMapsIfUnable {
                self?.openAppleMaps(address: address)
            }
        }
    }

    public func openSafe(url: String, options: [String: Any]?, completionHandler: Function<Bool>?) {
        if let safeUrl = URL(string: url) {
            openSafe(url: safeUrl, options: nil, completionHandler: completionHandler)
        } else {
            Logger.shared.logWarning(message: "Could not create link, url is not valid, was : \"\(url)\"")
        }
    }

    public func openSafe(url: URL, options: [String: Any]?, completionHandler: Function<Bool>?) {
        if !canOpenURL(url) {
            Logger.shared.logDebug(message: "could not open url :\(url.absoluteString)")
            completionHandler?(false)
        }
        if #available(iOS 10.0, *) {
            open(url, options: options ?? [:], completionHandler: completionHandler)
        } else {
            completionHandler?(openURL(url))
        }

    }
}

public extension UIViewController {
    public func callPhoneNumber(_ phoneNumber: String) {
        UIApplication.shared.callPhoneNumber(phoneNumber: phoneNumber)
    }

    public func openAppleMaps(address: String) {
        UIApplication.shared.openAppleMaps(address: address)
    }

    public func openGoogleMaps(address: String) {
        UIApplication.shared.openGoogleMaps(address: address)
    }
}

//
//  AdViewController.swift
//  AppVadorSample
//
//  Created by shoji on 2016/04/11.
//  Copyright © 2016年 com.shoji. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {

    @IBOutlet private weak var adWrapperView: UIView!

    private lazy var appVadorManager: APVAdManager = {
        let manager = APVAdManager(pubId: "59d43dad47785b027efc76ef6013c9af", withDelegate: self)
        manager.preloadType = APV_PRELOAD_ALL
        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        appVadorManager.load()
    }
}


// MARK: - APVAdManagerDelegate

extension AdViewController: APVAdManagerDelegate {

    private func requestAppVador() {
        if appVadorManager.isReady {
            appVadorManager.removeAd()
        }
        appVadorManager.load()
    }

    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

    func onReadyToPlayAd() {
        appVadorManager.showAdForView(adWrapperView)
    }

    func onCloseAd() {
        appVadorManager.removeAd()
    }
}

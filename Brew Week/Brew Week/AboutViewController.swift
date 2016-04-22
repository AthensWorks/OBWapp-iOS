//
//  AboutViewController.swift
//  Brew Week
//
//  Created by Ben Lachman on 7/2/15.
//  Copyright (c) 2015 Ohio Brew Week. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

	@IBOutlet weak var appNameAndVersionLabel: UILabel!
	@IBOutlet weak var athensworksButton: UIButton!

	override func awakeFromNib() {
		if let image = UIImage(named: "heart-13")?.colorizedImage(UIColor.brewWeekRed()) {
			self.navigationController?.tabBarItem.selectedImage = image.imageWithRenderingMode(.AlwaysOriginal)

			self.navigationController?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.brewWeekRed()], forState: .Selected)
		}
	}

	override func viewDidLoad() {
		if let appInfoDictionary = NSBundle.mainBundle().infoDictionary,
            let bundleVersion = appInfoDictionary[String(kCFBundleVersionKey)] as? NSString,
            let bundleShortVersion = appInfoDictionary["CFBundleShortVersionString"] as? NSString {

            appNameAndVersionLabel.text = "Ohio Brew Week \(bundleShortVersion) (v\(bundleVersion))"
        }
	}

	@IBAction func openAthensworksAction(sender: UIButton) {
		if let url = NSURL(string: "http://athensworks.com/") {
			UIApplication.sharedApplication().openURL(url)
		}
	}
}

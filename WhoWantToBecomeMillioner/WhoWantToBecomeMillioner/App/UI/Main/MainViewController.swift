//
//  MainViewController.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 04/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toGameViewController",
            let gameController = segue.destination as? GameViewController
            else {
                return
        }
        Game.shared.session = GameSession()
        gameController.gameDelegate = Game.shared.session
    }
}

//
//  SettingsViewController.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 05/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionsOrderSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func questionOrderSwitched(_ sender: UISwitch) {
        saveSettings()
    }
    
    private func loadSettings() {
        questionsOrderSwitch.isOn = Game.shared.settings.questionsOrder == .random
    }
    
    private func saveSettings() {
        let order: QuestionsOrder = questionsOrderSwitch.isOn ? .random : .inOrder
        Game.shared.settings = Settings(questionsOrder: order)
    }
}

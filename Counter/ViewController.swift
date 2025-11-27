//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Pfisyazhnyuk on 27.11.2025.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    // Labels
    @IBOutlet weak var countLabel: UILabel!
    
    // Buttons
    @IBOutlet weak var disButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    
    // Text Views
    @IBOutlet weak var historyTextView: UITextView!
    
    
    // Actions
    @IBAction func disButtonDidTap(_ sender: Any) {
        count -= 1
        logger(text: "значение изменено на -1")
    }
    @IBAction func refreshButtonDidTap(_ sender: Any) {
        count = 0
        logger(text: "значение сброшено")
    }
    @IBAction func impButtonDidTap(_ sender: Any) {
        count += 1
        logger(text: "значение изменено на +1")
    }
    
    
    // MARK: Properties
    var isDis: Bool = false {
        didSet {
            if isDis {disButton.isEnabled = true}
            else {disButton.isEnabled = false}
        }
    }
    
    var count: Int = 0 {
        didSet {
            refreshLabel()
            if count == 0 {
                isDis = false
                isRefresh = false
            }
            if count == 1 {
                isDis = true
                isRefresh = true
            }
        }
    };
    
    var isRefresh: Bool = false {
        didSet {
            if isRefresh {refreshButton.isEnabled = true}
            else {refreshButton.isEnabled = false}
        }
    }
    
    
    // MARK: Utils
    func logger(text: String) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        historyTextView.text += "[\(formattedDate)]: \(text) (\(count))\n"
        scrollToBottom()
    }
    
    func refreshLabel() {
        countLabel.text = String(count)
    }
        
    func scrollToBottom() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


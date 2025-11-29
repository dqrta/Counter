//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Pfisyazhnyuk on 27.11.2025.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBOutlets
    // Labels
    @IBOutlet private weak var countLabel: UILabel!
    
    // Buttons
    @IBOutlet private weak var disButton: UIButton!
    @IBOutlet private weak var refreshButton: UIButton!
    
    // Text Views
    @IBOutlet private weak var historyTextView: UITextView!
    
    
    // MARK: - Properties

    private var count: Int = 0 {
        didSet {
            refreshLabel()
            if count == 0 {
                isRefresh = false
            }
            if count == 1 {
                isRefresh = true
            }
        }
    };
    
    private var isRefresh: Bool = false {
        didSet {
            if isRefresh {refreshButton.isEnabled = true}
            else {refreshButton.isEnabled = false}
        }
    }
    
    
    // MARK: - Utils
    private func logger(text: String) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        historyTextView.text += "[\(formattedDate)]: \(text) (\(count))\n"
        scrollToBottom()
    }
    
    private func refreshLabel() {
        countLabel.text = String(count)
    }
    
    private func scrollToBottom() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    
    // MARK: - IBActions
    @IBAction private func disButtonDidTap(_ sender: Any) {
        if count > 0 {
            count -= 1
            logger(text: "значение изменено на -1")
        } else {
            logger(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    @IBAction private func refreshButtonDidTap(_ sender: Any) {
        if count > 0 {
            count = 0
            logger(text: "значение сброшено")
        }
    }
    @IBAction private func impButtonDidTap(_ sender: Any) {
        count += 1
        logger(text: "значение изменено на +1")
    }
}

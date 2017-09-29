//
//  ViewController.swift
//  CustomURLTextView
//
//  Created by htomcat on 2017/09/29.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let textView = CustomTextView()
    private let urlPattern = "(http|ftp|https)://([\\w_-]+(?:(?:\\.[\\w_-]+)+))([\\w.,@?^=%&:/~+#-]*[\\w@?^=%&/~+#-])?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 50,
                                               width: UIScreen.main.bounds.width,
                                               height: 50))
        titleLabel.font = .boldSystemFont(ofSize: 30.0)
        titleLabel.text = "UITextView"
        let subTitleLabel = UILabel(frame: CGRect(x: 0,
                                                  y: 100,
                                                  width: UIScreen.main.bounds.width,
                                                  height: 50))
        subTitleLabel.font = .boldSystemFont(ofSize: 25.0)
        subTitleLabel.text = "Overview"
        textView.frame = CGRect(x: 0,
                                y: 150,
                                width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height)
        detectURLandReplaceHyperlink()
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(textView)
    }

    private func detectURLandReplaceHyperlink() {
        guard let text = textView.text else {
            return
        }
        guard let regExp = try? NSRegularExpression(pattern: urlPattern,
                                                    options: .caseInsensitive) else {
            return
        }
        let attributeText = NSMutableAttributedString(string: text)
        let matchedText = regExp.matches(in: text,
                       options: .reportProgress,
                       range: NSRange(location: 0, length: text.characters.count))
        matchedText.forEach { result in
            let castText = text as NSString
            let subText = castText.substring(with: result.range)
            let attributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.link: URL(string: subText)!,
                                                            NSAttributedStringKey.foregroundColor: UIColor.blue,
                                                            NSAttributedStringKey.strikethroughStyle: 1]
            let attributeSubText = NSAttributedString(string: subText, attributes: attributes)
            attributeText.replaceCharacters(in: result.range, with: attributeSubText)
        }
        textView.attributedText = attributeText
    }
}

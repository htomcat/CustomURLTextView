//
//  CustomTextView.swift
//  CustomURLTextView
//
//  Created by 浜田　智史 on 2017/09/29.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {
    let constantText = """
    UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
    This class supports multiple text styles through use of the attributedText(https://developer.apple.com/documentation/uikit/uitextview/1618626-attributedtext) property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font(https://developer.apple.com/documentation/uikit/uitextview/1618600-font), textColor(https://developer.apple.com/documentation/uikit/uitextview/1618601-textcolor), and textAlignment(https://developer.apple.com/documentation/uikit/uitextview/1618618-textalignment) properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView(https://developer.apple.com/documentation/uikit/uiwebview) object—to display both plain and rich text in your app.
    """
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        let textStorage = NSTextStorage(string: constantText)
        let layoutManager = CustomLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: .zero)
        layoutManager.addTextContainer(textContainer)
        super.init(frame: frame, textContainer: textContainer)
        
        font = .systemFont(ofSize: 20.0)
        isEditable = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class CustomLayoutManager: NSLayoutManager {
    override func drawStrikethrough(forGlyphRange glyphRange: NSRange, strikethroughType strikethroughVal: NSUnderlineStyle, baselineOffset: CGFloat, lineFragmentRect lineRect: CGRect, lineFragmentGlyphRange lineGlyphRange: NSRange, containerOrigin: CGPoint) {
        
        let offset: CGFloat = 6.0
        let newLineRect = CGRect(x: lineRect.origin.x,
                                 y: lineRect.origin.y + offset,
                                 width: lineRect.width,
                                 height: lineRect.height)
        super.drawStrikethrough(forGlyphRange: glyphRange, strikethroughType: strikethroughVal, baselineOffset: baselineOffset, lineFragmentRect: newLineRect, lineFragmentGlyphRange: lineGlyphRange, containerOrigin: containerOrigin)
        
    }
}

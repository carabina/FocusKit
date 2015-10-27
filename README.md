# FocusKit

### CocoaPods Support

FocusKit is on CocoaPods under the name [FK](https://cocoapods.org/?q=FK).

### Text Matching

Easily match any regular expression pattern in a body of text. Below is an example of the default hashtag pattern matching.

![FKPreview](http://www.materialkit.io/github/focuskit/vid1.gif)

```swift
class NoteView: TextDelegate, TextViewDelegate {

	// ...

	lazy var text: Text = Text()
	var textView: TextView?

	// ...

	func prepareTextView() {
		let p: CGFloat = 24
		let layoutManager: NSLayoutManager = NSLayoutManager()
		let textContainer = NSTextContainer(size: bounds.size)
		text.delegate = self
		text.textStorage.addLayoutManager(layoutManager)
		layoutManager.addTextContainer(textContainer)
		textView = TextView(frame: CGRectNull, textContainer: textContainer)
		textView?.delegate = self
		textView!.editable = true
		textView!.selectable = true
		textView!.font = UIFont.systemFontOfSize(16)
		textView!.text = note?["text"] as? String
		textView!.textContainerInset = UIEdgeInsetsMake(1.5 * p, p, p, p)
		textView!.placeholderLabel = UILabel()
		textView!.placeholderLabel!.textColor = UIColor.grayColor()
		let attrText: NSMutableAttributedString = NSMutableAttributedString(string: "focus your #thoughts", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(16)])
		attrText.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(16), range: NSRange(location: 11,length: 9))
		textView!.placeholderLabel!.attributedText = attrText
		textView!.inputAccessoryView = keyboardBarView
		addSubview(textView!)
	}

	// ...

	func textWillProcessEdit(text: Text, textStorage: TextStorage, string: String, range: NSRange) {
		textStorage.removeAttribute(NSFontAttributeName, range: range)
		textStorage.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(16), range: range)
	}

	//...

	func textDidProcessEdit(text: Text, textStorage: TextStorage, string: String, result: NSTextCheckingResult?, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) {
		textStorage.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(16), range: result!.range)
	}

	// ...

}
```

### License

[AGPL-3.0](http://choosealicense.com/licenses/agpl-3.0/)

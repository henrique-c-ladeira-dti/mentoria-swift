//
//  XibView.swift
//  RickAndMortyMentoria
//
//  Created by Henrique Ladeira on 05/10/23.
//

import UIKit

@IBDesignable
open class XibView: UIView {

    private var contentView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXibView()
        commonXibInit()
    }

    override open class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXibView()
        commonXibInit()
    }

    func commonXibInit() { }

    private func setupXibView() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = bounds
            addSubview(view, constrainedToSuperview: true)
            contentView = view
        }
    }
}

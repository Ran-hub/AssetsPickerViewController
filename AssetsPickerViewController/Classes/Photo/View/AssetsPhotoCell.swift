//
//  AssetsPhotoCell.swift
//  Pods
//
//  Created by DragonCherry on 5/17/17.
//
//

import UIKit
import Dimmer
import PureLayout

public protocol AssetsPhotoCellProtocol {
    var isSelected: Bool { get set }
    var imageView: UIImageView { get }
//    var timeLabel: UILabel { get }
    var countLabel: UILabel { get }
}

open class AssetsPhotoCell: UICollectionViewCell, AssetsPhotoCellProtocol {
    
    private var didSetupConstraints: Bool = false
    
    open override var isSelected: Bool {
        didSet {
            countLabel.isHidden = !isSelected
            if isSelected {
                imageView.dim(animated: false, color: .white, alpha: 0.3)
            } else {
                imageView.undim(animated: false)
            }
        }
    }
    
    open let imageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.backgroundColor = UIColor(rgbHex: 0xF0F0F0)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
//    open let timeLabel: UILabel = {
//        let label = UILabel.newAutoLayout()
//        label.textColor = .black
//        label.font = UIFont.systemFont(forStyle: .subheadline)
//        return label
//    }()
    
    open let countLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(forStyle: .subheadline)
        return label
    }()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        contentView.configureForAutoLayout()
        contentView.addSubview(imageView)
//        contentView.addSubview(titleLabel)
        contentView.addSubview(countLabel)
    }
    
    open override func updateConstraints() {
        if !didSetupConstraints {
            contentView.autoPinEdgesToSuperviewEdges()
            imageView.autoPinEdgesToSuperviewEdges()
            countLabel.autoMatch(.width, to: .width, of: contentView, withMultiplier: 0.2)
            countLabel.autoMatch(.height, to: .height, of: contentView, withMultiplier: 0.2)
            countLabel.autoPinEdge(.trailing, to: .trailing, of: contentView, withOffset: -5)
            countLabel.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -5)
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
}
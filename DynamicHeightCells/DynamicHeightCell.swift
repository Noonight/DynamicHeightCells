//
//  DynamicHeightCell.swift
//  DynamicHeightCells
//
//  Created by Aiur Arkhipov on 12.04.2024.
//

import UIKit

final class DynamicHeightView: UIView {
    
    let padding = CGFloat(8)
    
    let image = UIImageView()
    let text = UILabel()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(image)
        image.backgroundColor = .red
        image.contentMode = .scaleAspectFit
        
        addSubview(text)
        text.backgroundColor = .gray
        text.numberOfLines = 0
    }
    
    func set(image: UIImage, text: String) {
        self.image.image = image
        self.text.text = text
    }
    
    func sizeOfView(_ size: CGSize) -> CGSize {
        image.frame = .init(x: 0, y: 0, width: 40, height: 40)
        text.frame = .init(origin: .init(x: 40 + padding, y: 0),
                           size: text.sizeThatFits(.init(width: size.width - 40 - padding,
                                                         height: .infinity)))
        return .init(width: size.width,
                     height: max(image.frame.height, text.frame.height))
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        sizeOfView(size)
    }
}

final class DynamicHeightCell: UITableViewCell {
    
    let modelView = DynamicHeightView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cellID")
        contentView.addSubview(modelView)
        contentView.backgroundColor = UIColor.random()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage, text: String) {
        modelView.set(image: image, text: text)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        modelView.sizeThatFits(size)
    }
}

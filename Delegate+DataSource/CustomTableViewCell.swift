//
//  CustomTableViewCell.swift
//  Delegate+DataSource
//
//  Created by Nazar Kopeika on 14.05.2023.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject { /* 34 */
    func didTapButton(with string: String) /* 35 */ /* 48 add with */
}

class CustomTableViewCell: UITableViewCell {
    
    public weak var delegate: CustomTableViewCellDelegate? /* 36 */

   static let identifier = "CustomTableViewCell" /* 17 */
    
    private let button = UIButton() /* 18 */
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { /* 19 */
        super.init(style: style, reuseIdentifier: reuseIdentifier) /* 20 */
        contentView.addSubview(button) /* 21 */
        button.setTitle("Tap Me", for: .normal) /* 22 */
        button.backgroundColor = .systemRed /* 23 */
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) /* 24 */
    }
    
    required init?(coder: NSCoder) { /* 25 */
        fatalError() /* 26 */
    }
    
    @objc private func didTapButton() { /* 27 */
        guard let string = string else { /* 45 */
            return /* 46 */
        }
        delegate?.didTapButton(with: string) /* 37 */ /* 47 add with */
    }
     
    override func layoutSubviews() { /* 28 */
        super.layoutSubviews() /* 29 */
        button.frame = CGRect(x: 10,
                              y: 5,
                              width: contentView.frame.size.width-20,
                              height: contentView.frame.size.height-10) /* 30 */
    }
    
    private var string: String? /* 42 */
    
    public func configure(with string: String) { /* 43 */
        self.string = string /* 44 */
    }

}

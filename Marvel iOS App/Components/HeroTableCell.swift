import UIKit

final class HeroTableCell: UITableViewCell {
    
    // MARK: Properties
    
    private let view: HeroView = HeroView(frame: .zero)
    
    // MARK: Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        fillWithSubview(subview: view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Fill Methods
    
    func fill(representation: HeroeViewRepresentation) {
        view.fill(representation: representation)
    }
}

extension UIView {
    func fillWithSubview(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)

        let views = ["view": subview]
        let vC = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let hC = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)

        addConstraints(vC)
        addConstraints(hC)
        updateConstraints()

        subview.setNeedsDisplay()
        layoutIfNeeded()
    }
}

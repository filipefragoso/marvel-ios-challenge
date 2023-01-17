import UIKit

struct HeroeViewRepresentation: Equatable {
    let name: String
    let imageURL: URL
}

final class HeroView: UIView {
    
    // MARK: Properties
    
    private var style: LayoutStyle = LayoutStyle()
    private let margins: CGFloat = 10
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = style.elementsSpacing
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .center
        view.numberOfLines = style.labelNumberOfLines
        view.font = style.labelFont
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Lyfe Cycle
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Fill Methods
    
    func fill(representation: HeroeViewRepresentation) {
        nameLabel.text = representation.name
        self.imageView.downloaded(from: representation.imageURL)
    }
}

extension HeroView: ViewCode {
    
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 1 / CharacterImageConfig.aspectRatio),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margins),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margins),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: margins)
        ])
    }
}

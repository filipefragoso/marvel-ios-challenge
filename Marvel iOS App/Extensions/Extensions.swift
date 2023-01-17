import UIKit

public extension UITableView {

    func register<T: UITableViewCell>(_ cellClass: T.Type) {

        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {

        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }

    func dequeueReusableCell<T: UITableViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {

        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

public protocol Reusable {

    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UITableViewCell {

    static var reuseIdentifier: String { return String(describing: self) }
}

extension UITableViewCell: Reusable {}

extension Array {
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }

    mutating func replace(at index: Int, with newElement: Element) {
        remove(at: index)
        insert(newElement, at: index)
    }

    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    func setupAdditionalConfiguration() {}
}

struct LayoutStyle {
    let elementsSpacing: CGFloat = 5
    let labelFont: UIFont = UIFont.systemFont(ofSize: 12.0)
    let labelNumberOfLines: Int = 1
}

struct CharacterImageConfig {
    static let aspectRatio: CGFloat = 442 / 321
    static let nameLabelHeight: CGFloat = 75
}

import UIKit

final class HeroListingComponent: UIView {

    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HeroTableCell.self)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    weak var tableViewDelegateDataSource: (UITableViewDelegate & UITableViewDataSource)? {
        didSet {
            tableView.dataSource = tableViewDelegateDataSource
            tableView.delegate = tableViewDelegateDataSource
        }
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
}

extension HeroListingComponent {
    private func configureView() {
        backgroundColor = .white

        addSubviews()
        defineSubviewsConstraints()
    }

    private func addSubviews() {
        addSubview(tableView)
    }

    private func defineSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
}



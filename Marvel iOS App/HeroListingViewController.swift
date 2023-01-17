import UIKit

class HeroListingViewController: UIViewController {

    var heroes = [HeroInformation]()

    private lazy var customView: HeroListingComponent = {
        let component = HeroListingComponent()
        component.tableViewDelegateDataSource = self
        return component
    }()

    override func loadView() {
        self.view = self.customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        MarvelAPI().fetchHeroesListing { result in
            switch result {
            case .success(let heroes):
                self.heroes = heroes
                self.customView.tableView.reloadData()
            case .failure:
                break
            }
        }
    }
}

extension HeroListingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(HeroTableCell.self, for: indexPath)
        guard let hero = heroes.object(index: indexPath.row) else {
            return cell
        }
        let representation = HeroeViewRepresentation(name: hero.name, imageURL: hero.imageURL)
        cell.fill(representation: representation)
        return cell
    }
}

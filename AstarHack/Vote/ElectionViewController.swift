import UIKit

class ElectionViewController: UIViewController, ElectionViewDelegate {
    
    
    var collection: [Collections] = [
        Collections(image: "doc.text", title: "0x2f074...19ac7e4", date: "24 Jun", price: "Confirmed"),
        Collections(image: "doc.text", title: "0x2f074...19ac7e4", date: "24 Jun", price: "Confirmed"),
        Collections(image: "doc.text", title: "0x2f074...19ac7e4", date: "23 Jun", price: "Confirmed"),
        Collections(image: "doc.text", title: "0x2f074...19ac7e4", date: "23 Jun", price: "Confirmed"),
        Collections(image: "doc.text", title: "0x2f074...19ac7e4", date: "23 Jun", price: "Confirmed"),
    ]
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "BackgroundAstar")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    lazy var electionView: ElectionView = {
        let view = ElectionView(frame: .zero, questionText: "Do we use Starcast for our local council elections from now on?", descriptionText: "Vote organised by the Royal Borough of Greenwich", optionOneText: "Yes", optionTwoText: "No", optionOnePercent: "37%", optionTwoPercent: "63%", imageName: "Greenwich", percentageOne: 0.37, percentageTwo: 0.63)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLogIn))
//        view.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
        view.backgroundColor = .astarPurple.withAlphaComponent(0.5)
        view.layer.cornerRadius = 24
        return view
    }()
    
    lazy var recentVotesLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent Votes"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var moreRecentVotesLabel: UILabel = {
        let label = UILabel()
        label.text = "See All"
        label.textColor = .astarPurple
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var collectionsCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(CollectionCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    func electionView(_ view: ElectionView, didTapOption message: String) {
        let alertController = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        print(message)
        present(alertController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        electionView.delegate = self
        setUpView()
    }
    
    func setUpView() {
        self.title = "Vote"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.astarBlack]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .astarDarkBlue
        
        view.addSubview(backgroundImageView)
        view.addSubview(electionView)
        view.addSubview(recentVotesLabel)
        view.addSubview(moreRecentVotesLabel)
        view.addSubview(collectionsCollectionView)
        
        backgroundImageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        electionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 300)
        
        recentVotesLabel.anchor(top: electionView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        moreRecentVotesLabel.anchor(top: electionView.bottomAnchor, paddingTop: 36, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        collectionsCollectionView.anchor(top: recentVotesLabel.bottomAnchor, paddingTop: 24, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 220)
        
    }
}

extension ElectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "collectionCell",
            for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        let data = collection[indexPath.item]
        cell.configure(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = CGFloat(60)
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let tabBar = self.tabBar else {return}
//        let eventVC = EventViewController(tabBar: tabBar)
//        self.navigationController?.pushViewController(eventVC, animated: true)
    }
}

struct Collections {
    var image: String
    var title: String
    var date: String
    var price: String
}

import UIKit

class VoteViewController: UIViewController, ScanVoteViewDelegate {
    
    var friends: [FriendCell] = [
        FriendCell(imageOne: "Char1", imageTwo: "Char2", imageThree: "Char3", votes: "8 Votes", title: "Where do we go?", date: "26 Jun"),
        FriendCell(imageOne: "Char5", imageTwo: "Char4", imageThree: "Char1", votes: "12 Votes", title: "Exploring Shoreditch", date: "28 Jun"),
        FriendCell(imageOne: "Char3", imageTwo: "Char6", imageThree: "Char2", votes: "17 Votes", title: "Wimbledon", date: "30 Jun"),
        FriendCell(imageOne: "Char4", imageTwo: "Char1", imageThree: "Char6", votes: "3 Votes", title: "What to do for Bday?", date: "6 Jul"),
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
    
    lazy var scanVoteView: ScanVoteView = {
        let view = ScanVoteView()
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLogIn))
//        view.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
        view.backgroundColor = .astarBlack.withAlphaComponent(0.85)
        view.layer.cornerRadius = 24
        view.delegate = self
        return view
    }()
    
    func scanVoteViewDidTapButton(_ view: ScanVoteView) {
        let scannerVC = QRScanViewController()
        navigationController?.pushViewController(scannerVC, animated: true)
    }
    
    lazy var openPollLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Polls"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var openRecentPollLabel: UILabel = {
        let label = UILabel()
        label.text = "See All"
        label.textColor = .astarPurple
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var friendsCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(FriendVoteCell.self, forCellWithReuseIdentifier: "friendCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        
        self.title = "Vote"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.astarBlack]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
        
        view.addSubview(backgroundImageView)
        view.addSubview(scanVoteView)
        view.addSubview(openPollLabel)
        view.addSubview(openRecentPollLabel)
        view.addSubview(friendsCollectionView)
        
        backgroundImageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        scanVoteView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 130)
        
        openPollLabel.anchor(top: scanVoteView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        openRecentPollLabel.anchor(top: scanVoteView.bottomAnchor, paddingTop: 36, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        friendsCollectionView.anchor(top: openPollLabel.bottomAnchor, paddingTop: 24, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 400)
        
    }
}

extension VoteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "friendCell",
            for: indexPath) as? FriendVoteCell else { return UICollectionViewCell() }
        let data = friends[indexPath.item]
        cell.configure(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = CGFloat(96)
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let tabBar = self.tabBar else {return}
//        let eventVC = EventViewController(tabBar: tabBar)
//        self.navigationController?.pushViewController(eventVC, animated: true)
    }
}

struct FriendCell {
    var imageOne: String
    var imageTwo: String
    var imageThree: String
    var votes: String
    var title: String
    var date: String
}

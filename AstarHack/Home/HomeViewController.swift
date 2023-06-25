import UIKit
import Glaip

class HomeViewController: UIViewController {
    
    let address = UserDefaults.standard.string(forKey: "walletAddress")
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "BackgroundAstar")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    lazy var topBarView: ProfileView = {
        let topBarView = ProfileView()
        return topBarView
    }()
    
    lazy var voteCountView: VoteCountView = {
        let view = VoteCountView()
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLogIn))
//        view.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
        view.backgroundColor = .astarBlack.withAlphaComponent(0.85)
        view.layer.cornerRadius = 24
        return view
    }()
    
    lazy var recentPollLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent Polls"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var moreRecentPollLabel: UILabel = {
        let label = UILabel()
        label.text = "See All"
        label.textColor = .astarPurple
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .astarLightBlue
        setUpView()
    }
    
    lazy var recentVoteView: RecentVoteView = {
        let recentVoteView = RecentVoteView(frame: .zero, questionText: "Is Wasm taking over Shoreditch this weekend?", descriptionText: "Vote organised by the Borough of Shoreditch", optionOneText: "Yes", optionTwoText: "No", optionOnePercent: "87%", optionTwoPercent: "13%", imageName: "Shoreditch", percentageOne: 0.87, percentageTwo: 0.13)

//        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLogIn))
//        view.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
        recentVoteView.backgroundColor = .astarPurple.withAlphaComponent(0.1)
        recentVoteView.layer.cornerRadius = 24
        return recentVoteView
    }()
    
    lazy var recentVoteViewTwo: RecentVoteView = {
        let recentVoteView = RecentVoteView(frame: .zero, questionText: "Does Astar enable the Multichain future?", descriptionText: "Vote organised by Astar Network", optionOneText: "Yes", optionTwoText: "No", optionOnePercent: "68%", optionTwoPercent: "32%", imageName: "Astar", percentageOne: 0.68, percentageTwo: 0.32)

//        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLogIn))
//        view.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
        recentVoteView.backgroundColor = .astarPurple.withAlphaComponent(0.1)
        recentVoteView.layer.cornerRadius = 24
        return recentVoteView
    }()
    
    func setUpView() {
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(backgroundImageView)
        view.addSubview(topBarView)
        view.addSubview(voteCountView)
        view.addSubview(recentPollLabel)
        view.addSubview(moreRecentPollLabel)
        view.addSubview(recentVoteView)
        view.addSubview(recentVoteViewTwo)
        
        backgroundImageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        topBarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 40)
        
        voteCountView.anchor(top: topBarView.bottomAnchor, paddingTop: 48, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 100)
        
        recentPollLabel.anchor(top: voteCountView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        moreRecentPollLabel.anchor(top: voteCountView.bottomAnchor, paddingTop: 36, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        recentVoteView.anchor(top: moreRecentPollLabel.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 220)
    
        recentVoteViewTwo.anchor(top: recentVoteView.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 220)
    }
}

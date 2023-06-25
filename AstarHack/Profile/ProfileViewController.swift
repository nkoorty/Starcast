import UIKit

class ProfileViewController: UIViewController {
    
    var transactionHash: String?
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "BackgroundAstar")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    lazy var profileView: ProfileInfoView = {
        let profileView = ProfileInfoView()
        profileView.backgroundColor = .clear
        return profileView
    }()
    
    lazy var recentTransLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent Votes"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var moreRecentTransLabel: UILabel = {
        let label = UILabel()
        label.text = "See All"
        label.textColor = .astarPurple
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var transactionView: TransactionView = {
        let profileView = TransactionView()
        profileView.backgroundColor = .astarDarkBlue.withAlphaComponent(0.15)
        profileView.layer.cornerRadius = 16
        return profileView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        view.backgroundColor = .astarLightBlue
        
        fetchTransactionDetails()
        
        setUpView()
    }
    
    private func fetchTransactionDetails() {
        ServerAPI.fetchPost { success, hash, error in
            guard success, let hash = hash else {
                print(error ?? "Unknown error")
                return
            }
            DispatchQueue.main.async {
                self.transactionView.transactionHash = hash
            }
        }
    }
    
    private func configureItems() {
        navigationController?.navigationBar.tintColor = .astarPurple
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "gearshape"),
                    style: .done,
                    target: self,
                    action: #selector(didTapSettingsButton)
                )
    }
    
    @objc private func didTapSettingsButton() {
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    func setUpView() {
        self.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.astarBlack]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
        
        
        view.addSubview(backgroundImageView)
        view.addSubview(profileView)
        view.addSubview(recentTransLabel)
        view.addSubview(moreRecentTransLabel)
        view.addSubview(transactionView)
        
        backgroundImageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        profileView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 70)
        
        recentTransLabel.anchor(top: profileView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        moreRecentTransLabel.anchor(top: profileView.bottomAnchor, paddingTop: 36, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
                
        transactionView.anchor(top: moreRecentTransLabel.bottomAnchor, paddingTop: 24, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 60)
        
    }
}


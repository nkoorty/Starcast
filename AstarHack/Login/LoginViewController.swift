import UIKit
import Glaip

class LogInViewController: UIViewController {
    
    private var glaip: Glaip
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "BackgroundAstar")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    lazy var outerView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.layer.cornerRadius = 36
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .astarBlack, size: 26, text: "Starcast", bold: true)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var polkadotButton: UIButton = {
        let button = UIButton(type: .system)
        button.layout(textcolour: .white, backgroundColour: .astarDarkBlue.withAlphaComponent(0.35), size: 19, text: "Polkadot.js", image: UIImage(systemName: "trash.circle.fill"), cornerRadius: 8)
        button.addTarget(self, action: #selector(tappedLogIn), for: .touchUpInside)
        return button
    }()
    
    lazy var polkadotJSLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "PolkadotJS")
        image.layer.cornerRadius = 12.5
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var metaMaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.layout(textcolour: .white, backgroundColour: .astarDarkBlue.withAlphaComponent(0.35), size: 19, text: "MetaMask", image: UIImage(systemName: "qrcode"), cornerRadius: 8)
        button.addTarget(self, action: #selector(tappedMetaMask), for: .touchUpInside)
        return button
    }()
    
    lazy var metaMaskLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MetaMask")
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    @objc func tappedLogIn() {
        let vc = JsonViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tappedMetaMask() {
        glaip.loginUser(type: .MetaMask) { result in
            switch result {
            case .success(let user):
                print(user.wallet.address)
                UserDefaults.standard.setValue(user.wallet.address, forKey: "walletAddress")
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                    let vc = TabBarController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.glaip = Glaip(
          title: "Starcast",
          description: "Wallet connection for Starcast",
          supportedWallets: [.MetaMask])
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Starcast", style: .plain, target: nil, action: nil)
        setUpView()
    }
    
    func setUpView() {
    
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(outerView)
        outerView.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(polkadotButton)
        view.addSubview(polkadotJSLogo)
        view.addSubview(metaMaskButton)
        view.addSubview(metaMaskLogo)
        
        backgroundImageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 82, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 140, height: 140)
        logoImageView.centerXAnchor.constraint(equalTo: polkadotButton.centerXAnchor).isActive = true
        
        titleLabel.anchor(top: logoImageView.bottomAnchor, paddingTop: 26, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        polkadotButton.anchor(top: titleLabel.bottomAnchor, paddingTop: 160, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 60)
        
        polkadotJSLogo.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: polkadotButton.leftAnchor, paddingLeft: 115, right: nil, paddingRight: 0, width: 25, height: 25)
        polkadotJSLogo.centerYAnchor.constraint(equalTo: polkadotButton.centerYAnchor).isActive = true
        
        metaMaskButton.anchor(top: polkadotButton.bottomAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 60)
        
        metaMaskLogo.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: polkadotButton.leftAnchor, paddingLeft: 115, right: nil, paddingRight: 0, width: 32, height: 32)
        metaMaskLogo.centerYAnchor.constraint(equalTo: metaMaskButton.centerYAnchor).isActive = true
    }
}

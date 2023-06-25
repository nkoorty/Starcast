import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = tabBar.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        blurEffectView.alpha = 0.95
        tabBar.insertSubview(blurEffectView, at: 0)

        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()

        tabBar.tintColor = .astarDarkBlue
        tabBar.barTintColor = UIColor.astarBlack
        tabBar.unselectedItemTintColor = .black.withAlphaComponent(0.3)
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBar.layer.shadowOpacity = 0.2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let home = HomeViewController()
        let homeimage = UIImage(systemName: "house")
        let homeselected = UIImage(systemName: "house.fill")
        home.tabBarItem =  UITabBarItem(title: "Home", image: homeimage, selectedImage: homeselected)
        
        let tickets = VoteViewController()
        let ticketImage = UIImage(systemName: "wallet.pass")
        let ticketselected = UIImage(systemName: "wallet.pass.fill")
        tickets.tabBarItem = UITabBarItem(title: "Vote", image: ticketImage, selectedImage: ticketselected)
        
        let account = ProfileViewController()
        let accountimage = UIImage(systemName: "person")
        let accountselected = UIImage(systemName: "person.fill")
        account.tabBarItem = UITabBarItem(title: "Profile", image: accountimage, selectedImage: accountselected)
        
        let tabbarList = [home, tickets, account]
        
        viewControllers = tabbarList.map {
            UINavigationController(rootViewController: $0)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }

        let timeInterval: TimeInterval = 0.3
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.90, y: 0.90)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
}



import UIKit

class ProfileInfoView: UIView, UIContextMenuInteractionDelegate {
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ProfileImage")
        image.layer.cornerRadius = 35
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .astarBlack, size: 20, text: "Artemiy", bold: true)
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .astarBlack.withAlphaComponent(0.6), size: 18, text: "artemiymalyshau", bold: false)
        return label
    }()
    
    lazy var statusInfoLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .darkGray, size: 10, text: "Hold to Change", bold: true)
        return label
    }()
    
    lazy var statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .astarBlack.withAlphaComponent(0.6)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "🎯 Focused"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            let menu = UIMenu(title: "", children: [
                UIAction(title: "🎯 Focused", handler: {_ in self.statusLabel.text = "🎯 Focused"}),
                UIAction(title: "🌟 To The Stars", handler: {_ in self.statusLabel.text = "🌟 To The Stars"})
            ])
            return menu
        }
    }
    
    func setUpView() {
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        
        profileImageView.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 70, height: 70)
        
        nameLabel.anchor(top: profileImageView.centerYAnchor, paddingTop: -20, bottom: nil, paddingBottom: 0, left: profileImageView.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)

        userNameLabel.anchor(top: profileImageView.centerYAnchor, paddingTop: 2, bottom: nil, paddingBottom: 0, left: profileImageView.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
    
        let interaction = UIContextMenuInteraction(delegate: self)
        statusView.addInteraction(interaction)
        
    }
}

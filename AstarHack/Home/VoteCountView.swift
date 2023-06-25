import UIKit

class VoteCountView: UIView {
    
//    lazy var anchorButton: UIButton = {
//        let button = UIButton()
//        let largeConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold, scale: .large)
//        let largeImage = UIImage(systemName: "chevron.right", withConfiguration: largeConfig)
//        button.setImage(largeImage, for: .normal)
//        button.tintColor = .white
//        return button
//    }()
//
    lazy var anchorButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray.withAlphaComponent(0.5)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
//        button.addTarget(self, action: #selector(copyToClipBoard), for: .touchUpInside)
        return button
    }()
    
    lazy var uploadLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 21, text: "8 Active Polls", bold: true)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 17, text: "Show details", bold: false)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        addSubview(anchorButton)
        addSubview(uploadLabel)
        addSubview(descriptionLabel)
        
        anchorButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 24, width: 36, height: 36)
        anchorButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        uploadLabel.anchor(top: topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 20, right: anchorButton.leftAnchor, paddingRight: 16, width: 0, height: 0)
        uploadLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        descriptionLabel.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 20, left: leftAnchor, paddingLeft: 20, right: anchorButton.leftAnchor, paddingRight: 16, width: 0, height: 0)
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true


    }
}

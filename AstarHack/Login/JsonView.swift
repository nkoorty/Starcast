import UIKit

class JsonView: UIView {
    
    lazy var uploadButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "paperclip", withConfiguration: largeConfig)
        button.setImage(largeImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        addSubview(uploadButton)
        
        uploadButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        uploadButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        uploadButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        
    }
}

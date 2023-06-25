import UIKit

class CustomSearchBar: UITextField {
    
    var textFieldDelegate: UITextFieldDelegate?
    
    let padding = UIEdgeInsets(top: 0, left: 42, bottom: 0, right: 20)
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tintColor = .astarLightBlue
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .astarDarkBlue.withAlphaComponent(0.4)
        self.layer.cornerRadius = 8
        self.attributedPlaceholder = NSAttributedString(string: "Enter your Polkadot.js Password",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.clearButtonMode = .whileEditing
        self.textColor = .white
        
        self.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


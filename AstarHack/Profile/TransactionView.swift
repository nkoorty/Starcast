import UIKit

class TransactionView: UIView {
    
    var transactionHash: String? {
        didSet {
            if let transactionHash = transactionHash {
                let formattedHash = formatHash(transactionHash)
                titleLabel.text = formattedHash
            }
        }
    }
    
    var transactionURL: URL? {
        guard let transactionHash = transactionHash else { return nil }
        return URL(string: "https://shibuya.subscan.io/tx/\(transactionHash)")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "doc.text")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .astarBlack
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .astarPurple, size: 12, text: "Jun 25", bold: true)
        return text
    }()
    
    lazy var priceLabel: UIButton = {
        let button = UIButton()
        button.setTitle("Confirmed", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .astarBlack.withAlphaComponent(0.3)
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .astarBlack, size: 16, text: "Polkadot X EasyA", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "heart", size: 10, colour: .white)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "square.and.arrow.up", size: 10, colour: .white)
        return button
    }()
    

    @objc private func viewTapped() {
        if let url = transactionURL {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.addGestureRecognizer(tapGesture)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(priceLabel)
        
        imageView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 30, height: 30)
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: imageView.rightAnchor, paddingLeft: 10, right: priceLabel.rightAnchor, paddingRight: 16, width: 0, height: 0)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        dateLabel.anchor(top: topAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 8, width: 0, height: 0)
        
        priceLabel.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 8, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 8, width: 0, height: 0)
        
    }
}

extension TransactionView {
    func formatHash(_ hash: String) -> String {
        let firstSeven = String(hash.prefix(7))
        let lastSeven = String(hash.suffix(7))
        return "\(firstSeven)...\(lastSeven)"
    }
}

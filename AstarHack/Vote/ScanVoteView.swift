import UIKit

protocol ScanVoteViewDelegate: AnyObject {
    func scanVoteViewDidTapButton(_ view: ScanVoteView)
}

class ScanVoteView: UIView {
    
    weak var delegate: ScanVoteViewDelegate?
    
    lazy var anchorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray.withAlphaComponent(0.3)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var uploadLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 21, text: "Take part in a poll", bold: true)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 13, text: "Tap on the QR Code button and scan the QR code provided by the governing body of the poll", bold: false)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    @objc func buttonTapped() {
        delegate?.scanVoteViewDidTapButton(self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        
        addSubview(uploadLabel)
        addSubview(descriptionLabel)
        addSubview(anchorButton)
        
        anchorButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 24, width: 40, height: 40)
        anchorButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        uploadLabel.anchor(top: topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 20, right: anchorButton.leftAnchor, paddingRight: 16, width: 0, height: 0)
        
        descriptionLabel.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 24, left: leftAnchor, paddingLeft: 20, right: anchorButton.leftAnchor, paddingRight: 16, width: 0, height: 0)
    }
}


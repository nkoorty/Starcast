import UIKit

class FriendVoteCell: UICollectionViewCell {
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .astarDarkBlue.withAlphaComponent(0.4)
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var anchorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray.withAlphaComponent(0.3)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var imageViewOne: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Char001")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.astarBlack.cgColor
        imageView.layer.borderWidth = 0.4
        return imageView
    }()
    
    lazy var imageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Char003")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.astarBlack.cgColor
        imageView.layer.borderWidth = 0.4
        return imageView
    }()
    
    lazy var imageViewThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Char004")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.astarBlack.cgColor
        imageView.layer.borderWidth = 0.4
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white.withAlphaComponent(0.7), size: 14, text: "Jun 28", bold: false)
        return text
    }()
    
    lazy var votesLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white.withAlphaComponent(0.7), size: 14, text: "8 Votes", bold: false)
        return text
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 18, text: "Where are we going out to eat tonight?", bold: true)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: FriendCell) {
        imageViewOne.image = UIImage(named: data.imageOne)
        imageViewTwo.image = UIImage(named: data.imageTwo)
        imageViewThree.image = UIImage(named: data.imageThree)
        votesLabel.text = data.votes
        titleLabel.text = data.title
        dateLabel.text = data.date
    }
    
    func setupView() {
        addSubview(topView)
        addSubview(imageViewThree)
        addSubview(imageViewTwo)
        addSubview(imageViewOne)
        addSubview(titleLabel)
        addSubview(votesLabel)
        addSubview(dateLabel)
        addSubview(anchorButton)
        
        topView.anchor(top: topAnchor, paddingTop: 8, bottom: bottomAnchor, paddingBottom: 8, left: leftAnchor, paddingLeft: 8, right: anchorButton.leftAnchor, paddingRight: 16, width: 0, height: 0)
        
        anchorButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: topView.rightAnchor, paddingLeft: 8, right: rightAnchor, paddingRight: 16, width: 36, height: 36)
        anchorButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        titleLabel.anchor(top: topView.topAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: topView.leftAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        
        imageViewOne.anchor(top: nil, paddingTop: 0, bottom: topView.bottomAnchor, paddingBottom: 8, left: nil, paddingLeft: 0, right: topView.rightAnchor, paddingRight: 50, width: 36, height: 36)
        
        imageViewTwo.anchor(top: nil, paddingTop: 0, bottom: topView.bottomAnchor, paddingBottom: 8, left: imageViewOne.leftAnchor, paddingLeft: 20, right: nil, paddingRight: 0, width: 36, height: 36)
        
        imageViewThree.anchor(top: nil, paddingTop: 0, bottom: topView.bottomAnchor, paddingBottom: 8, left: imageViewTwo.leftAnchor, paddingLeft: 20, right: nil, paddingRight: 0, width: 36, height: 36)
        
        dateLabel.anchor(top: nil, paddingTop: 0, bottom: topView.bottomAnchor, paddingBottom: 8, left: topView.leftAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        
        votesLabel.anchor(top: nil, paddingTop: 0, bottom: topView.bottomAnchor, paddingBottom: 8, left: dateLabel.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 8, width: 0, height: 0)
        
        self.backgroundColor = .astarDarkBlue.withAlphaComponent(0.15)
        self.layer.cornerRadius = 24
        
    }
}

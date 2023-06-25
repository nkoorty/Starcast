import UIKit

class ProfileView: UIView {
        
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ProfileImage")
        image.layer.cornerRadius = 27
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()

    lazy var timeLabel: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 19)
        
        let currentDateTime = Date()
        let userCalendar = Calendar.current
        let dateComponents = userCalendar.dateComponents([.hour], from: currentDateTime)
        
        if let hour = dateComponents.hour {
            if hour >= 5 && hour < 12 {
                text.text = "Good Morning,"
            } else if hour >= 12 && hour < 17 {
                text.text = "Good Afternoon,"
            } else if hour >= 17 && hour < 22 {
                text.text = "Good Evening,"
            } else {
                text.text = "Good Night,"
            }
        } else {
            text.text = "Hello"
        }
        return text
    }()

    lazy var nameLabel: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 19)
        text.text = "Artemiy"
        return text
    }()

    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(nameLabel)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(timeLabel)
        addSubview(nameLabel)
        
        profileImage.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 8, width: 54, height: 54)
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        timeLabel.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        nameLabel.anchor(top: timeLabel.bottomAnchor, paddingTop: 1, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


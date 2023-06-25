import UIKit

class RecentVoteView: UIView {
    
    var questionText: String
    var descriptionText: String
    var optionOneText: String
    var optionTwoText: String
    var optionOnePercent: String
    var optionTwoPercent: String
    var imageName: String
    var percentageOne: CGFloat
    var percentageTwo: CGFloat
    
    lazy var voteView: UIView = {
        let view = UIView()
        view.backgroundColor = .astarBlack.withAlphaComponent(0.6)
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var voteLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: self.questionText, bold: true)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var voteDescriptionLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white.withAlphaComponent(0.7), size: 14, text: self.descriptionText, bold: false)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var voteImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: self.imageName)
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var optionOneView: UIView = {
        let view = UIView()
        view.backgroundColor = .astarDarkBlue.withAlphaComponent(0.4)
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        view.layer.addSublayer(self.optionOneProgressBar)
        return view
    }()
    
    lazy var optionOneVoteLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 21, text: self.optionOneText, bold: true)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var optionOneTickButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
//        button.addTarget(self, action: #selector(copyToClipBoard), for: .touchUpInside)
        return button
    }()
    
    lazy var optionOnePercentLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white.withAlphaComponent(0.7), size: 16, text: self.optionOnePercent, bold: false)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var optionOneProgressBar: CAShapeLayer = {
        let bar = CAShapeLayer()
        bar.strokeColor = UIColor.white.cgColor
        bar.fillColor = UIColor.clear.cgColor
        bar.lineCap = .round
        return bar
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let progressBarHeight: CGFloat = 10
        let progressBarY: CGFloat = optionOneVoteLabel.frame.maxY + 34
        let progressBarPath = UIBezierPath()
        progressBarPath.move(to: CGPoint(x: optionOneVoteLabel.frame.minX + 6, y: progressBarY))
        progressBarPath.addLine(to: CGPoint(x: 116, y: progressBarY))

        optionOneProgressBar.path = progressBarPath.cgPath
        optionOneProgressBar.lineWidth = progressBarHeight
        
        let progressBarHeightTwo: CGFloat = 10
        let progressBarYTwo: CGFloat = optionTwoVoteLabel.frame.maxY + 34
        let progressBarPathTwo = UIBezierPath()
        progressBarPathTwo.move(to: CGPoint(x: optionTwoVoteLabel.frame.minX + 6, y: progressBarYTwo))
        progressBarPathTwo.addLine(to: CGPoint(x: 116, y: progressBarYTwo))

        optionTwoProgressBar.path = progressBarPathTwo.cgPath
        optionTwoProgressBar.lineWidth = progressBarHeightTwo
    }

    func updateProgress(to progress: CGFloat) {

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = optionOneProgressBar.strokeEnd
        animation.toValue = progress
        animation.duration = 0.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        optionOneProgressBar.strokeEnd = progress
        optionOneProgressBar.add(animation, forKey: "progressBarAnimation")
    }
    
    lazy var optionTwoView: UIView = {
        let view = UIView()
        view.backgroundColor = .astarDarkBlue.withAlphaComponent(0.4)
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        view.layer.addSublayer(self.optionTwoProgressBar)

        return view
    }()
    
    lazy var optionTwoVoteLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 21, text: self.optionTwoText, bold: true)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var optionTwoTickButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
//        button.addTarget(self, action: #selector(copyToClipBoard), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    lazy var optionTwoPercentLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white.withAlphaComponent(0.7), size: 16, text: optionTwoPercent, bold: false)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var optionTwoProgressBar: CAShapeLayer = {
        let bar = CAShapeLayer()
        bar.strokeColor = UIColor.white.cgColor
        bar.fillColor = UIColor.clear.cgColor
        bar.lineCap = .round
        return bar
    }()
    
    func updateProgressTwo(to progress: CGFloat) {

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = optionTwoProgressBar.strokeEnd
        animation.toValue = progress
        animation.duration = 0.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        optionTwoProgressBar.strokeEnd = progress
        optionTwoProgressBar.add(animation, forKey: "progressBarAnimation")
    }
    
    init(frame: CGRect, questionText: String, descriptionText: String, optionOneText: String, optionTwoText: String, optionOnePercent: String, optionTwoPercent: String, imageName: String, percentageOne: CGFloat, percentageTwo: CGFloat) {
        self.questionText = questionText
        self.descriptionText = descriptionText
        self.optionOneText = optionOneText
        self.optionTwoText = optionTwoText
        self.optionOnePercent = optionOnePercent
        self.optionTwoPercent = optionTwoPercent
        self.imageName = imageName
        self.percentageOne = percentageOne
        self.percentageTwo = percentageTwo
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(voteView)
        voteView.addSubview(voteImage)
        voteView.addSubview(voteLabel)
        voteView.addSubview(voteDescriptionLabel)
        addSubview(optionOneView)
        optionOneView.addSubview(optionOneVoteLabel)
        optionOneView.addSubview(optionOneTickButton)
        optionOneView.addSubview(optionOnePercentLabel)
        addSubview(optionTwoView)
        optionTwoView.addSubview(optionTwoVoteLabel)
        optionTwoView.addSubview(optionTwoTickButton)
        optionTwoView.addSubview(optionTwoPercentLabel)
        
        voteView.anchor(top: topAnchor, paddingTop: 8, bottom: bottomAnchor, paddingBottom: 8, left: leftAnchor, paddingLeft: 8, right: optionOneView.leftAnchor, paddingRight: 8, width: 200, height: 0)
        
        voteImage.anchor(top: voteView.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: voteView.leftAnchor, paddingLeft: 12, right: voteView.rightAnchor, paddingRight: 12, width: 0, height: 64)
        
        voteLabel.anchor(top: voteImage.bottomAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: voteView.leftAnchor, paddingLeft: 12, right: voteView.rightAnchor, paddingRight: 12, width: 0, height: 0)
        
        voteDescriptionLabel.anchor(top: voteLabel.bottomAnchor, paddingTop: 6, bottom: nil, paddingBottom: 0, left: voteView.leftAnchor, paddingLeft: 12, right: voteView.rightAnchor, paddingRight: 12, width: 0, height: 0)
        
        optionOneView.anchor(top: topAnchor, paddingTop: 8, bottom: optionTwoView.topAnchor, paddingBottom: 8, left: voteView.rightAnchor, paddingLeft: 8, right: rightAnchor, paddingRight: 8, width: 0, height: 100)
        
        optionOneVoteLabel.anchor(top: optionOneView.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: optionOneView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        optionOneTickButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: optionOneVoteLabel.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        optionOneTickButton.centerYAnchor.constraint(equalTo: optionOneVoteLabel.centerYAnchor).isActive = true
        
        optionOnePercentLabel.anchor(top: optionOneVoteLabel.bottomAnchor, paddingTop: 4, bottom: nil, paddingBottom: 0, left: optionOneView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)

        optionTwoView.anchor(top: optionOneView.bottomAnchor, paddingTop: 8, bottom: bottomAnchor, paddingBottom: 8, left: voteView.rightAnchor, paddingLeft: 8, right: rightAnchor, paddingRight: 8, width: 0, height: 0)
        
        optionTwoVoteLabel.anchor(top: optionTwoView.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: optionTwoView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        optionTwoTickButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: optionTwoVoteLabel.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        optionTwoTickButton.centerYAnchor.constraint(equalTo: optionTwoVoteLabel.centerYAnchor).isActive = true
        
        optionTwoPercentLabel.anchor(top: optionTwoVoteLabel.bottomAnchor, paddingTop: 4, bottom: nil, paddingBottom: 0, left: optionTwoView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        layoutIfNeeded()
        layoutSubviews()
        updateProgress(to: self.percentageOne)
        updateProgressTwo(to: self.percentageTwo)
        
    }
    
}

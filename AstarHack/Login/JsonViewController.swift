import UIKit
import MobileCoreServices

class JsonViewController: UIViewController, UIDocumentPickerDelegate {
    
    var fileData: Data?
    var password: String?
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "BackgroundAstar")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .astarBlack, size: 18, text: "Please upload an exported .json file from your Polkadot.js wallet and provide your password", bold: false)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var jsonView: JsonView = {
        let view = JsonView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLogIn))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        view.backgroundColor = .astarDarkBlue.withAlphaComponent(0.35)
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var searchBar: CustomSearchBar = {
        let searchBar = CustomSearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login with Polkadot.js", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.backgroundColor = .astarPurple.withAlphaComponent(0.7)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tappedSubmit), for: .touchUpInside)
        return button
    }()
    
    lazy var hackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to main", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.backgroundColor = .white.withAlphaComponent(0.1)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tappedHackedIn), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedHackedIn() {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen

        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)

        present(vc, animated: false)
    }
    
    @objc func tappedLogIn() {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeJSON as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let pickedURL = urls.first else {
            return
        }
        let shouldStopAccessing = pickedURL.startAccessingSecurityScopedResource()
        defer {
            if shouldStopAccessing {
                pickedURL.stopAccessingSecurityScopedResource()
            }
        }
        do {
            self.fileData = try Data(contentsOf: pickedURL)
            let fileNameWithoutExtension = pickedURL.deletingPathExtension().lastPathComponent
            DispatchQueue.main.async {
                self.jsonView.uploadButton.setImage(UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold, scale: .large)), for: .normal)
            }
        } catch {
            print("Error accessing file: \(error)")
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height * 1/4
            }
            UIView.animate(withDuration: 0.5) {
                self.textLabel.alpha = 0
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        UIView.animate(withDuration: 0.5) {
            self.textLabel.alpha = 1
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func tappedSubmit() {
        guard let json = self.fileData,
              let password = searchBar.text else {
            return
        }

//        NetworkManager.shared.sendRequest(withJson: json, password: password) { result in
//            switch result {
//            case .success(let data):
//                print(String(data: data, encoding: .utf8))
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let vc = TabBarController()
            vc.modalPresentationStyle = .fullScreen

            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            self.view.window!.layer.add(transition, forKey: kCATransition)

            self.present(vc, animated: false)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .astarDarkBlue
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        textLabel.alpha = 1
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        setUpView()
    }
    
    func setUpView() {
        self.title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(backgroundImageView)
        view.addSubview(textLabel)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(jsonView)
        view.addSubview(searchBar)
        view.addSubview(submitButton)
        view.addSubview(hackButton)
        
        backgroundImageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        textLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        searchBar.anchor(top: textLabel.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: jsonView.leftAnchor, paddingRight: 8, width: 0, height: 50)
        
        jsonView.anchor(top: textLabel.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: searchBar.rightAnchor, paddingLeft: 8, right: view.rightAnchor, paddingRight: 16, width: 50, height: 50)
        
        submitButton.anchor(top: searchBar.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 50)
        
        hackButton.anchor(top: submitButton.bottomAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 50)
    }
    
}

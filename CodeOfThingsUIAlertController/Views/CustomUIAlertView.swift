//
//  CustomUIAlertView.swift
//  CodeOfThingsUIAlertController
//
//  Created by Luiz Guimarães on 27/03/21.
//

import UIKit

protocol CustomUIAlertViewDelegate: AnyObject {
    func dismiss()
    func close()
}

class CustomUIAlertView: UIView {
    
    weak var delegate: CustomUIAlertViewDelegate?
    
    // MARK: lifecycle
    
    init() {
        super.init(frame: .zero)
        setupControls()
        setupLayoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI elements
    
    private lazy var modalView: UIView = {
        let modalView = UIView()
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
        return modalView
    }()   
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 4.0
        return contentView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis  = .horizontal
        buttonStackView.distribution  = .fillEqually
        buttonStackView.spacing = 4.0
        return buttonStackView
    }()
    
    private lazy var closeLabel: UILabel = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeAction))
        let closeLabel: UILabel = UILabel(frame: .zero)
        closeLabel.translatesAutoresizingMaskIntoConstraints = false
        closeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        closeLabel.textColor = .systemRed
        closeLabel.text = "X"
        closeLabel.isUserInteractionEnabled = true
        closeLabel.addGestureRecognizer(tap)
        return closeLabel
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel: UILabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        return titleLabel
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel: UILabel = UILabel(frame: .zero)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.font = UIFont.systemFont(ofSize: 16.0)
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    
    // MARK: Private methods
    
    private func setupLayoutConstraint() {
        NSLayoutConstraint.activate([
            modalView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            modalView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            modalView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            modalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            contentView.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 81),
            contentView.leftAnchor.constraint(equalTo: modalView.leftAnchor, constant: 16),
            contentView.rightAnchor.constraint(equalTo: modalView.rightAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: modalView.bottomAnchor, constant: -159),
            
            closeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            closeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            messageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            messageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            
            buttonStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            buttonStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])
    }
    
    private func setupControls() {
        modalView.addSubview(contentView)
        contentView.addSubview(closeLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(buttonStackView)
        
        addSubview(modalView)
    }
    
    @objc
    private func closeAction(sender: UITapGestureRecognizer) {
        self.delegate?.close()
    }
    
    private func configureMessageText(message: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: message)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    // MARK: Public methods
    
    func configure(title: String, message: String) {
        titleLabel.text = title
        messageLabel.attributedText = configureMessageText(message: message)
    }
    
    func addActionButton(customUIAlertAction: CustomUIAlertAction) {
        let actionButton: UIButton = UIButton(type: .custom, primaryAction: UIAction(handler: {[weak self] _ in
            customUIAlertAction.handler?()
            self?.delegate?.dismiss()
        }))
        
        actionButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 16.0)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        actionButton.layer.cornerRadius = 4
        actionButton.layer.borderWidth = 1
        actionButton.layer.borderColor = UIColor.appGreen.cgColor
        actionButton.tintColor = .appGreen
        actionButton.setTitle(customUIAlertAction.title, for: .normal)
        actionButton.setTitleColor(.appGreen, for: .normal)
        if customUIAlertAction.invertColor {
            actionButton.backgroundColor =  .appGreen
            actionButton.setTitleColor(.white, for: .normal)
        }
        buttonStackView.addArrangedSubview(actionButton)
        if buttonStackView.arrangedSubviews.count > 2 {
            buttonStackView.axis = .vertical
            buttonStackView.spacing = 10.0
        }
    }
}

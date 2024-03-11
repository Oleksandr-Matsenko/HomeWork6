//
//  ViewController.swift
//  HomeWork6
//
//  Created by Alex Matsenko on 10.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let middleStackView = UIStackView()
    private let productInfostack = UIStackView()
    private let buyOnCreditView = UIView()
    private let bottomStackButtons = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpHeadView()
        setUpMiddleView()
        setUpProductInfostack()
        setUpBuyOnCreditView()
        setUpBottomStackButtons()
    }
    
    
    private func setUpHeadView(){
        imageView.image = UIImage(named: "Asus")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        //Congfig UIImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
        
    }
    
    private func setUpMiddleView(){
        //Create stackView and config it
        middleStackView.backgroundColor = .white
        middleStackView.axis = .vertical
        middleStackView.spacing = 15
        middleStackView.alignment = .leading
        view.addSubview(middleStackView)
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        //Create labels
        let descriptionLabelProduct = UILabel()
        descriptionLabelProduct.textAlignment = .left
        descriptionLabelProduct.text = "Материнська плата Asus ROG STRIX B550-F GAMING (sAM4, AMD B550)"
        descriptionLabelProduct.font = UIFont.systemFont(ofSize: 25, weight: .black)
        descriptionLabelProduct.numberOfLines = 0
        descriptionLabelProduct.sizeToFit()
        
        let codeOfProduct = UILabel()
        codeOfProduct.textAlignment = .left
        codeOfProduct.text = "Code: 2185258993"
        codeOfProduct.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        codeOfProduct.textColor = UIColor.systemGray
        codeOfProduct.sizeToFit()
        
        //Add to stack and of mask
        [descriptionLabelProduct,codeOfProduct].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            middleStackView.addArrangedSubview($0)}
        
        let ratingLabel = UILabel()
        ratingLabel.textAlignment = .right
        ratingLabel.text = "★★★★☆ 54"
        ratingLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        ratingLabel.sizeToFit()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        middleStackView.addSubview(ratingLabel)
        
        
        //Constraints to stackView
        NSLayoutConstraint.activate([
            middleStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            middleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            middleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            middleStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            ratingLabel.trailingAnchor.constraint(equalTo: middleStackView.trailingAnchor, constant: -10),
            ratingLabel.centerYAnchor.constraint(equalTo: codeOfProduct.centerYAnchor)
            
        ])
        
    }
    
    private func  setUpProductInfostack(){
        
        //Create productInfoStack
        productInfostack.axis = .vertical
        productInfostack.spacing = 15
        productInfostack.alignment = .leading
        productInfostack.backgroundColor = .white
        view.addSubview(productInfostack)
        productInfostack.translatesAutoresizingMaskIntoConstraints = false
        
        //Create all Labels what we need
        let priceLabel = UILabel()
        let currency = "8703 ₴"
        priceLabel.text = currency
        priceLabel.textAlignment = .left
        priceLabel.font = UIFont.systemFont(ofSize: 40, weight: .black)
        priceLabel.sizeToFit()
        let sizeString = NSMutableAttributedString(string: currency)
        if let range = currency.range(of: "₴", options: .caseInsensitive) {
            sizeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 30), range: NSRange(range, in: currency))
        }
        priceLabel.attributedText = sizeString
        let deliveryInfo = UILabel()
        let deliveryText = "Самовивіз з наших магазинів - БЕЗКОШТОВНО \nЗабрати завтра з 12:00"
        deliveryInfo.text = deliveryText
        
        let colorString = NSMutableAttributedString(string: deliveryText)
        if let range = deliveryText.range(of: "БЕЗКОШТОВНО", options: .caseInsensitive){
            colorString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: NSRange(range, in: deliveryText))
        }
        deliveryInfo.attributedText = colorString
        
        deliveryInfo.numberOfLines = 0
        deliveryInfo.textAlignment = .left
        deliveryInfo.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        deliveryInfo.sizeToFit()
        
        [priceLabel,deliveryInfo].forEach{
            productInfostack.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //Constraints to ProductStack
        NSLayoutConstraint.activate([
            productInfostack.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 10),
            productInfostack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            productInfostack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            productInfostack.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
        ])
        
    }
    private func setUpBuyOnCreditView(){
        buyOnCreditView.backgroundColor = .white
        view.addSubview(buyOnCreditView)
        buyOnCreditView.translatesAutoresizingMaskIntoConstraints = false
        let creditButton = UIButton(type: .system)
        creditButton.setTitle("Купити в кредит", for: .normal)
        creditButton.layer.borderColor = UIColor.systemGray.cgColor
        creditButton.setTitleColor(UIColor.systemGreen, for: .normal)
        creditButton.layer.borderWidth = 1
        creditButton.layer.cornerRadius = 15
        creditButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        creditButton.translatesAutoresizingMaskIntoConstraints = false
        creditButton.backgroundColor = .white
        creditButton.addTarget(self, action: #selector(takeCreditAction), for: .touchUpInside)
        buyOnCreditView.addSubview(creditButton)
        
        //Constraints to creditButton and Stack
        NSLayoutConstraint.activate([
            buyOnCreditView.topAnchor.constraint(lessThanOrEqualTo: productInfostack.bottomAnchor, constant: 15),
            buyOnCreditView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buyOnCreditView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            buyOnCreditView.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            
            creditButton.centerYAnchor.constraint(equalTo: buyOnCreditView.centerYAnchor),
            creditButton.leadingAnchor.constraint(equalTo: buyOnCreditView.leadingAnchor),
            creditButton.trailingAnchor.constraint(equalTo: buyOnCreditView.trailingAnchor),
            creditButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 55)
        ])
        
    }
    private func setUpBottomStackButtons(){
        //Bottom Stack Buttons
        bottomStackButtons.backgroundColor = .white
        bottomStackButtons.axis = .horizontal
        bottomStackButtons.spacing = 2
        bottomStackButtons.alignment = .fill
        bottomStackButtons.distribution = .fillEqually
        bottomStackButtons.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomStackButtons)
        
        let comparisonButton = UIButton()
        comparisonButton.setImage(UIImage(named: "Balance"), for: .normal)
        let cartButton = UIButton()
        cartButton.setImage(UIImage(named: "Cart"), for: .normal)
        cartButton.addTarget(self, action: #selector(addToCard), for: .touchUpInside)
        let savedItemsButton = UIButton()
        savedItemsButton.setImage(UIImage(named: "SavedItems"), for: .normal)
        savedItemsButton.addTarget(self, action: #selector(showSavedItems), for: .touchUpInside)
        
        let buyNowButton = UIButton()
        buyNowButton.setTitle("Купити зараз", for: .normal)
        buyNowButton.setTitleColor(UIColor.white, for: .normal)
        buyNowButton.backgroundColor = .systemGreen
        buyNowButton.layer.borderColor = UIColor.systemGray.cgColor
        buyNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        buyNowButton.layer.borderWidth = 1
        buyNowButton.layer.cornerRadius = 10
        view.addSubview(buyNowButton)
        buyNowButton.translatesAutoresizingMaskIntoConstraints = false
        
        [comparisonButton,cartButton,savedItemsButton].forEach{
            bottomStackButtons.addArrangedSubview($0)
            $0.setTitleColor(UIColor.green, for: .normal)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            bottomStackButtons.topAnchor.constraint(lessThanOrEqualTo: buyOnCreditView.bottomAnchor,constant: 10),
            bottomStackButtons.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.43),
            bottomStackButtons.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            bottomStackButtons.leadingAnchor.constraint(equalTo: buyOnCreditView.leadingAnchor, constant: -5),
            
            buyNowButton.centerYAnchor.constraint(equalTo: bottomStackButtons.centerYAnchor),
            buyNowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            buyNowButton.heightAnchor.constraint(equalTo: bottomStackButtons.heightAnchor),
            buyNowButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
            
        ])
    }
    //Action for buyOnCredit button
    @objc private func takeCreditAction(){
        let alertVC = UIAlertController(title: "Розстрочка від \nПРИВАТБАНК", message: "Бажаєте отримати більш детальну інформацію?", preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Так", style: .destructive)
        let noAction = UIAlertAction(title: "Повернутись назад", style: .cancel)
        alertVC.addAction(noAction)
        alertVC.addAction(yesAction)
        present(alertVC, animated: true)
    }
    //Action for Saved items button
    @objc private func showSavedItems(){
        let alertVC = UIAlertController(title: nil, message: "Ваш список пустий..", preferredStyle: .alert)
        present(alertVC, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            alertVC.dismiss(animated: true)
        }
    }
    //Action for Card button
    @objc private func addToCard(){
        let alertVC = UIAlertController(title: "Товар додано до кошика", message: nil, preferredStyle: .actionSheet)
        present(alertVC, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            alertVC.dismiss(animated: true)
        }
    }
    
    
    
}


//
//   AdCell.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 13/2/21.

import UIKit
import SnapKit

protocol AdTableViewCellFavoriteProtocol: NSObject {
    func favButtonTapped(currentIndex: Int)
}

class AdTableViewCell: UITableViewCell, GetCellIdentifierProtocol {
    
    // MARK: - UIViews -
    
    private let adPicturesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        let collectionView = UICollectionView.init(frame: CGRect.init(), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.indicatorStyle = .white
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    
    private let pictureStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private let cameraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "ad_camera")
        imageView.tintColor = Styles.Colors.idealistaPurple
        return imageView
    }()
    
    private let pictureNumberLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    //Reusable views 
    private let containerView = PurpleRoundedContainer()
    private let favoriteButton = FavoriteButton()
    private let priceLabel = PriceLabel()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    // MARK: -Variables
    
    private var imagesCells: [CollectionDrawerItemProtocol] = []
    private weak var delegate: AdTableViewCellFavoriteProtocol?
    private var index: Int = 0
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        setupImageCollectionView()
        setupViewsConstraints()
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imagesCells = []
        self.descriptionLabel.text = nil
        self.priceLabel.text = nil
        self.adPicturesCollectionView.reloadData()
    }
    
    private func setupImageCollectionView(){
        self.adPicturesCollectionView.delegate = self
        self.adPicturesCollectionView.dataSource = self
    }
    
    // MARK: -Constraints

    private func setupViewsConstraints(){
        
        
        addSubview(containerView)
        containerView.addSubview(adPicturesCollectionView)
        containerView.addSubview(favoriteButton)
        containerView.addSubview(priceLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(pictureStackView)
        
        //containerview constraints
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        
        //collectionview constraints
        adPicturesCollectionView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        //priceLabel constraints
        priceLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(10)
        }
        
        //descriptionLabel constraints
        descriptionLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(adPicturesCollectionView.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(15)
            make.right.equalTo(pictureStackView).inset(15)
        }
        
        //favoritesButton constraints
        favoriteButton.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview().inset(20)
            make.height.width.equalTo(30)
        }
        
        pictureStackView.addArrangedSubview(pictureNumberLabel)
        pictureStackView.addArrangedSubview(cameraImageView)
        pictureStackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(descriptionLabel)
            make.right.equalToSuperview().inset(20)
        }

    }
    
    private func setupViews(){
        favoriteButton.addTarget(self, action: #selector(self.favoriteTapped), for: .touchUpInside)
    }
        
    @objc private func favoriteTapped(){
        delegate?.favButtonTapped(currentIndex: self.index)
    }
    

    // MARK: - Draw Methods -
    

    func setFavoriteStatus(isFavorite: Bool){
        favoriteButton.isFavorite(favorite: isFavorite)
    }
    
    func setPrice(price: String){
        self.priceLabel.text = price
    }
    
    func setRealStateDescription(adDescription: String){
        self.descriptionLabel.text = adDescription
    }
    
    func setImages(imagesURL: [String]){
        self.imagesCells = imagesURL.map({ AdImageCollectionCellModel.init(url: $0)})
        self.pictureNumberLabel.text = String(imagesCells.count)
        self.adPicturesCollectionView.reloadData()
    }
    
    func setDelegate(delegate: AdTableViewCellFavoriteProtocol){
        self.delegate = delegate
    }
    
    func setCellIndex(index: Int){
        self.index = index
    }
    
}

// MARK: - Images collectionView management

extension AdTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = imagesCells[indexPath.row]
        let drawer = model.collectionDrawer
        let cell = drawer.dequeueCollectionCell(collectionView, indexPath: indexPath)
        drawer.drawCollectionCell(cell, withItem: model)
        return cell
    }
    
}

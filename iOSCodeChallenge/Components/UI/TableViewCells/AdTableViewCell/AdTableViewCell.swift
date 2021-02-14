//
//   AdCell.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 13/2/21.

import UIKit
import SnapKit

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
    
    private let favoriteButton: UIButton = {
       let button = UIButton()
       return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = Styles.Colors.idealistaPurple
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private var imagesCells: [CollectionDrawerItemProtocol] = []
    
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

    private func setupViewsConstraints(){
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Styles.Colors.idealistaPurple.cgColor
        
        addSubview(containerView)
        containerView.addSubview(adPicturesCollectionView)
        containerView.addSubview(favoriteButton)
        containerView.addSubview(priceLabel)
        containerView.addSubview(descriptionLabel)
        
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
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(20)
        }
        
        //descriptionLabel constraints
        descriptionLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(adPicturesCollectionView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        
        //favoritesButton constraints
        favoriteButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(descriptionLabel)
            make.right.equalToSuperview().inset(20)
            make.height.width.equalTo(30)
        }
    }

    // MARK: - Draw Methods -
    

    func setFavoriteStatus(isFavorite: Bool){
        favoriteButton.setImage(isFavorite ? UIImage.init(named: "filled_favorite") : UIImage.init(named: "blank_favorite"), for: .normal)
        favoriteButton.tintColor = .red
    }
    
    func setPrice(price: String){
        self.priceLabel.text = price
    }
    
    func setRealStateDescription(adDescription: String){
        self.descriptionLabel.text = adDescription
    }
    
    func setImages(imagesURL: [String]){
        self.imagesCells = imagesURL.map({ AdImageCollectionCellModel.init(url: $0)})
        self.adPicturesCollectionView.reloadData()
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

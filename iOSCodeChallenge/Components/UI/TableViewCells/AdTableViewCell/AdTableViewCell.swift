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
        let collectionView = UICollectionView.init(frame: CGRect.init(), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 20)
        return collectionView
    }()
    
    private let favoriteButton: UIButton = {
       let button = UIButton()
       return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15,weight: .light)
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
        setupImageCollectionView()
        setupViewsConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imagesCells = []
        self.descriptionLabel.text = nil
        self.priceLabel.text = nil
    }
    
    private func setupImageCollectionView(){
        self.adPicturesCollectionView.delegate = self
        self.adPicturesCollectionView.dataSource = self
    }
    
    private func setupViewsConstraints(){
        addSubview(adPicturesCollectionView)
        addSubview(favoriteButton)
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        
        //collectionview constraints
        adPicturesCollectionView.snp.makeConstraints { (make) in
            make.height.equalTo(250)
            make.left.right.top.equalToSuperview()
        }
        
        //priceLabel constraints
        priceLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(adPicturesCollectionView.snp.bottom).offset(10)
        }
        
        //descriptionLabel constraints
        descriptionLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview()
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

extension AdTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
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

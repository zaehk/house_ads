//
//   AdImageCell.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 14/2/21.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.
//

import UIKit

internal class AdImageCollectionCell: UICollectionViewCell, GetCollectionIdentifierProtocol {

    // MARK: - Views -
    
    private let adImageView : CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = Styles.Colors.idealistaMain
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        setupViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: 10
        ).cgPath
    }
    
    // MARK: - Constraints
    
    private func setupViewsConstraints(){
        addSubview(adImageView)

        //imageview constraints
        adImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
    }
    
    func setImageUrl(url: String){
        self.adImageView.loadImageUsingUrlString(urlString: url, placeHolderImage: nil)
    }
    

}

//
//  NewsCell.swift
//  newsAppTest
//
//  Created by my macbook on 13/2/22.
//

import Foundation
import SnapKit
import UIKit
import Kingfisher
class NewsCell: UITableViewCell{
    
    private var titleLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = .systemFont(ofSize: 10, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var newsImageView = UIImageView()
    
    override func layoutSubviews() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(frame.width / 1.5)
            make.left.equalToSuperview()
            make.bottom.equalTo(snp.centerY)
        }
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.width.equalTo(frame.width / 1.5)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        addSubview(newsImageView)
        newsImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.height.equalToSuperview().multipliedBy(0.7)
            make.centerY.equalToSuperview()
            make.width.equalTo(frame.height / 1.5)
          
        }
        
        
    }
    
    func fill(model: NewsModul){
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.newsImageView.kf.setImage(with: URL(string: model.image))
    }
}

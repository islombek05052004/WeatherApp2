//
//  DaysInformation - UI.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

final class ForecastVCHomeView: UIView {
        
    lazy var forecastCollectionView: UICollectionView = {
               
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(ForecastTableCell.self,
                                forCellWithReuseIdentifier: ForecastTableCell.identifier)
        collectionView.register(ForecastHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: ForecastHeaderView.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGradient()
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ForecastVCHomeView {
    
    private func toFormUIElements() {
        
        addSubview(forecastCollectionView)
        forecastCollectionView.translatesAutoresizingMaskIntoConstraints = false
        forecastCollectionView.leftAnchor(leftAnchor, 0)
        forecastCollectionView.rightAnchor(rightAnchor, 0)
        forecastCollectionView.bottomAnchor(bottomAnchor, 0)
        forecastCollectionView.topAnchor(safeAreaLayoutGuide.topAnchor, 0)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let collectionViewLayout = UICollectionViewCompositionalLayout { (section: Int, layoutEnvironment: NSCollectionLayoutEnvironment ) -> NSCollectionLayoutSection? in
            
            var section: NSCollectionLayoutSection
            
            section = self.sectionWithHeader(
                itemWidth: .fractionalWidth(1.0),
                itemheight: .fractionalHeight(1.0),
                groupWidth: .absolute(120),
                groupheight: .absolute(160),
                isGroupHorizontal: true,
                headerWidht: .absolute(Paddings.deviceWidth - 40),
                headerHeight: .absolute(100),
                sectionScrollType: .continuous
            )
            return section
        }
        return collectionViewLayout
    }
}


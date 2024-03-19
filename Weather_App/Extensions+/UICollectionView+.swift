//
//  UICollectionView+.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 14/03/24.
//

import UIKit
    
    
extension UIView {
    
    func sectionWithHeader(
        itemWidth: NSCollectionLayoutDimension,
        itemheight: NSCollectionLayoutDimension,
        itemContentInsets: NSDirectionalEdgeInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10),
        groupWidth: NSCollectionLayoutDimension,
        groupheight: NSCollectionLayoutDimension,
        isGroupHorizontal: Bool,
        headerWidht: NSCollectionLayoutDimension,
        headerHeight: NSCollectionLayoutDimension,
        sectionScrollType: UICollectionLayoutSectionOrthogonalScrollingBehavior
        
    ) -> NSCollectionLayoutSection {
        var section: NSCollectionLayoutSection
        
        let itemSize = NSCollectionLayoutSize(widthDimension: itemWidth, heightDimension: itemheight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = itemContentInsets
        
        let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: groupheight)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: headerWidht, heightDimension: headerHeight)
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerView]
        
        if isGroupHorizontal {
            section.orthogonalScrollingBehavior = sectionScrollType
        }
        
        return section
    }
}

    


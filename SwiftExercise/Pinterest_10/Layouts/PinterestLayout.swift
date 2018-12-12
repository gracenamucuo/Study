//
//  PinterestLayout.swift
//  Pinterest_10
//
//  Created by 戴运鹏 on 2018/12/12.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView,heightForPhotoAtIndexPath indexPath:IndexPath,withWidth:CGFloat) -> CGFloat
    func collectionView(_ collectionView:UICollectionView,heightForAnnotationAtIndexPath indexPath:IndexPath,withWidth width:CGFloat) -> CGFloat
}


class PinterestLayoutAttributes: UICollectionViewLayoutAttributes {
    var photoHeight:CGFloat = 0.0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! PinterestLayoutAttributes
        copy.photoHeight = photoHeight
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? PinterestLayoutAttributes {
            if attributes.photoHeight == photoHeight{
                return super.isEqual(object)
            }
        }
        return false
    }
    
}


class PinterestLayout:UICollectionViewLayout {
    var delegate:PinterestLayoutDelegate!
    var numberOfColumns = 2
    var cellPadding:CGFloat = 0
    fileprivate var cache = [PinterestLayoutAttributes]()
    fileprivate var contentHeight:CGFloat = 0
    fileprivate var contentWidth:CGFloat{
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width-(insets.left + insets.right)
    }
    
    override func prepare() {
        if cache.isEmpty {
            //列宽
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            //x偏移量
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns{
                xOffset.append(CGFloat(column) * contentWidth)
            }
            //y偏移量
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
            //每个item
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0){
                let indxePath = IndexPath(item: item, section: 0)
                
                let width = columnWidth - cellPadding * 2
                let photoHeight = delegate.collectionView(collectionView!, heightForPhotoAtIndexPath: indxePath, withWidth: width)
                let annotationHeight = delegate.collectionView(collectionView!, heightForAnnotationAtIndexPath: indxePath , withWidth: width)
                let height = cellPadding + photoHeight + annotationHeight + cellPadding
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                //缓存每一个item的属性
                let attributes = PinterestLayoutAttributes(forCellWith: indxePath)
                attributes.photoHeight = photoHeight
                attributes.frame = insetFrame
                cache.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                column = column >= (numberOfColumns-1) ? 0 : column+1
                
            }
            
            
        }
    }
    
    override var collectionViewContentSize: CGSize{
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect){
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override class var layoutAttributesClass:AnyClass{
        return PinterestLayoutAttributes.self
    }
    
    
}




















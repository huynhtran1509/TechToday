//
//  CLFArticleFrame.m
//  TechToday
//
//  Created by CaiGavin on 6/24/15.
//  Copyright (c) 2015 CaiGavin. All rights reserved.
//

#import "CLFArticleFrame.h"
#import "NSString+CLF.h"
#import "CLFArticle.h"
#import "CLFCommonHeader.h"

@implementation CLFArticleFrame

- (void)setArticle:(CLFArticle *)article {
    _article = article;
    
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - 2 * (CLFArticleCellInnerBorder + CLFArticleCellToBorderMargin);
    
    // imageViewFrame
    CGFloat imageViewW = cellW;
    CGFloat imageViewH = CLFImageWidthToHeightRatio * cellW;
    CGFloat imageViewX = CLFArticleCellInnerBorder;
    CGFloat imageViewY = CLFArticleCellInnerBorder;
    _imageViewFrame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    
    // titleLabelFrame
    CGSize titleLabelSize = [NSString sizeOfText:article.title maxSize:CGSizeMake(cellW, MAXFLOAT) font:CLFArticleTitleFont];
    CGFloat titleLabelX = imageViewX;
    CGFloat titleLabelY = CGRectGetMaxY(_imageViewFrame) + CLFArticleCellInnerBorder;
    CGFloat noImageTitleLabelY = CLFArticleCellInnerBorder;
    _titleLabelFrame = (CGRect){{titleLabelX, titleLabelY}, titleLabelSize};
    _noImageViewTitleLabelFrame = (CGRect){{titleLabelX, noImageTitleLabelY}, titleLabelSize};
    // sourceLabelFrame
    CGFloat sourceLabelX = titleLabelX;
    CGFloat sourceLabelY = CGRectGetMaxY(_titleLabelFrame) + CLFArticleCellInnerBorder;
    CGFloat noImageSourceLabelY = CGRectGetMaxY(_noImageViewTitleLabelFrame) + CLFArticleCellInnerBorder;
    CGSize sourceLabelSize = [NSString sizeOfText:article.source maxSize:CGSizeMake(0.2 * cellW, 20) font:CLFArticleOtherFont];
    _sourceLabelFrame = (CGRect){{sourceLabelX, sourceLabelY}, sourceLabelSize};
    _noImageViewSourceLabelFrame = (CGRect){{sourceLabelX, noImageSourceLabelY}, sourceLabelSize};
    
    // dateLabelFrame
    CGFloat dateLabelX = CGRectGetMaxX(_sourceLabelFrame) + CLFArticleCellInnerBorder;
    CGFloat dateLabelY = sourceLabelY;
    CGFloat noImageDateLabelY = noImageSourceLabelY;
    CGSize dateLabelSize = [NSString sizeOfText:article.date maxSize:CGSizeMake(0.2 * cellW, 20) font:CLFArticleOtherFont];
    _dateLabelFrame = (CGRect){{dateLabelX, dateLabelY}, dateLabelSize};
    _noImageViewDateLabelFrame = (CGRect){{dateLabelX, noImageDateLabelY}, dateLabelSize};
    
    CGSize pageViewsLabelSize = [NSString sizeOfText:article.pageViews maxSize:CGSizeMake(0.45 * cellW, 20) font:CLFArticleOtherFont];
    CGFloat pageViewsLabelX = CGRectGetMaxX(_imageViewFrame) - pageViewsLabelSize.width;
    CGFloat pageViewsLabelY = dateLabelY;
    CGFloat noImagePageViewsLabelY = noImageDateLabelY;
    _pageViewsLabelFrame = (CGRect){{pageViewsLabelX, pageViewsLabelY}, pageViewsLabelSize};
    _noImageViewPageViewsLabelFrame = (CGRect){{pageViewsLabelX, noImagePageViewsLabelY}, pageViewsLabelSize};
    
    _cellHeight = CGRectGetMaxY(_pageViewsLabelFrame) + 2.3 * CLFArticleCellInnerBorder;
    _noImageViewCellHeight = _cellHeight - imageViewH;
}

@end
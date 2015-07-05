//
//  ASDSegmentedControlPagination.h
//  ASDSegmentedControlPagination
//
//  Created by Alex on 05.07.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

@import UIKit;

/** Class that keeps two-way binding between UIScrollView with pagingEnabled == YES and UISegmentedControl. That is, when user change selected part of segmented control, scroll view scrolls to show respective page and vice versa.
@warning This binding works as long as your ASDPagingBinding instance is alive. So you may want to store it in a property of your view contoller, for example. */
@interface ASDPagingBinding : NSObject

/** Create new binding between segmentedControl and scrollView. Notice that even if scrollView had pagingEnabled == NO, it becomes YES after initialization */
- (instancetype)initWithSegmentedControl:(UISegmentedControl *)segmentedControl
    scrollView:(UIScrollView *)scrollView;

/** Property descpibes whether scroll view animates when you choose different segment of segmented control. Default is YES */
@property (nonatomic) BOOL animatedScrolling;


@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, readonly) UISegmentedControl *segmentedControl;

@end

//
//  ASDSegmentedControlPagination.m
//  ASDSegmentedControlPagination
//
//  Created by Alex on 05.07.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "ASDPagingBinding.h"


@interface ASDPagingBinding ()

@property (nonatomic, readwrite) UIScrollView *scrollView;
@property (nonatomic, readwrite) UISegmentedControl *segmentedControl;

@end


@implementation ASDPagingBinding

static void *ASDContext = &ASDContext;

- (instancetype)initWithSegmentedControl:(UISegmentedControl *)control scrollView:(UIScrollView *)scrollView {
    self = [super init];
    if (!self) return nil;
    _segmentedControl = control;
    _scrollView = scrollView;
    _animatedScrolling = YES;
    scrollView.pagingEnabled = YES;
    [control addTarget:self action:@selector(controlPressed) forControlEvents:UIControlEventValueChanged];
    [scrollView addObserver:self
        forKeyPath:NSStringFromSelector(@selector(contentOffset))
        options:NSKeyValueObservingOptionInitial context:ASDContext];
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
    ofObject:(id)object
    change:(NSDictionary *)change
    context:(void *)context {
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(contentOffset))]) {
        NSLog(@"New offset : %@", NSStringFromCGPoint(self.scrollView.contentOffset));
        CGFloat width = self.scrollView.frame.size.width;
        NSInteger page = (self.scrollView.contentOffset.x + (0.5f * width)) / width;
        NSInteger numberOfSegments = self.segmentedControl.numberOfSegments;
        if (page < 0) page = 0;
        if (page > numberOfSegments - 1) page = numberOfSegments;
        self.segmentedControl.selectedSegmentIndex = page;
    }
}

- (void)controlPressed {
    NSInteger index = self.segmentedControl.selectedSegmentIndex;
    CGSize pageSize = self.scrollView.frame.size;
    CGRect pageRect = CGRectMake(index * pageSize.width, 0, pageSize.width, pageSize.height);
    [self.scrollView scrollRectToVisible:pageRect animated:self.animatedScrolling];
}

- (void)dealloc {
    [self.segmentedControl removeTarget:self action:@selector(controlPressed) forControlEvents:UIControlEventValueChanged];
    [self.scrollView removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) context:ASDContext];
}

@end

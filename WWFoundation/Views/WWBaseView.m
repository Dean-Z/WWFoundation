//
//  WWBaseView.m
//  WWFoundationDemo
//
//  Created by William Wu on 7/7/14.
//  Copyright (c) 2014 WW. All rights reserved.
//

#import "WWBaseView.h"

@interface WWBaseView ()

@property (nonatomic, weak) id<WWBaseViewDelegate> delegate;
@property (nonatomic, strong) id<WWItemDataDelegate> itemData;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation WWBaseView

- (void)dealloc
{
    [self removeGestureRecognizer:self.tapGesture];
    
    self.tapGesture = nil;
    self.delegate = nil;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self setFrame:self.contentView.bounds];
    [self addSubview:self.contentView];
    
    self.delegate = self;
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                              action:@selector(handleTapGesture:)];
    
    [self addGestureRecognizer:self.tapGesture];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void)bindData:(id<WWItemDataDelegate>)itemData
{
    [self bindData:itemData atIndex:0];
}

- (void)bindData:(id<WWItemDataDelegate>)itemData atIndex:(NSUInteger)index
{
    self.itemData = itemData;
    
    self.index = index;
    
    [self.delegate prepareForReuse];
    
    [self.delegate applyStyle];
    
    [self.delegate fillData];
}

- (void)prepareForReuse
{}

- (void)applyStyle
{}

- (void)fillData
{}

- (void)viewDidTapped
{}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture
{
    DLog(@"%@", @"Content View Did Tapped");
    
    [self.delegate viewDidTapped];
}

@end

//
//  LCYLabelThaHighlights.m
//  LabelTapToHighlight
//
//  Created by Krishna Kotecha on 14/05/2012.
//  Copyright (c) 2012 Logic Colony Ltd. All rights reserved.
//

#import "LCYLabelThatHighlights.h"

@interface LCYLabelThatHighlights()

- (void) commonInitialization;
- (void) animateHighlightFadingOut;

@property (nonatomic, readonly, retain) UIImageView *highlightView;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) id  target;

@end

@implementation LCYLabelThatHighlights

static NSString *HIGHLIGHT_IMAGE_NAME = @"OUIToolbarButtonFauxHighlight.png";

@synthesize highlightView = _highlightView;
@synthesize target = _target;
@synthesize action = _action;

- (void) dealloc;
{
    _target = nil;
    _action = nil;
    [_highlightView release]; _highlightView = nil;
    [super dealloc];
}

- (id) initWithFrame: (CGRect) frame;
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        [self commonInitialization];
    }
    return self;
}

- (id) initWithCoder: (NSCoder *) decoder;
{
    self = [super initWithCoder:decoder];
    if (self)
    {
        [self commonInitialization];
    }
    return self;
}

#pragma mark - Private API

- (void) commonInitialization;
{
    self.userInteractionEnabled = YES;
    self.clipsToBounds = NO;
}

- (void) animateHighlightFadingOut;
{
    [UIView animateWithDuration:0.25f
                     animations:^{
                         self.highlightView.alpha = 0.0f;
                     }
                     completion:^(BOOL done){
                         self.highlightView.hidden = YES;
                         self.highlightView.alpha = 1.0;
                         [self.target performSelector:self.action withObject:self];
                     }];
}

#pragma mark - Touch Handling

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event;
{
    self.highlightView.hidden = NO;        
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event;
{
    [self animateHighlightFadingOut];
}

- (void) touchesCancelled: (NSSet *) touches withEvent: (UIEvent *) event;
{
    [self animateHighlightFadingOut];
}

#pragma mark - Public API...

- (void) setTarget: (id) target action: (SEL) action;
{
    self.target = target;
    self.action = action;
}


#pragma mark - Properties...

- (UIImageView *) highlightView;
{
    if (!_highlightView)
    {
        _highlightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:HIGHLIGHT_IMAGE_NAME]];

        CGRect imageRect = [self bounds];
        imageRect.origin.x = floor(CGRectGetMidX(imageRect));
        imageRect.origin.y = floor(CGRectGetMidY(imageRect));
        imageRect.size = [_highlightView frame].size;
        imageRect.origin.x -= floor(imageRect.size.width/2);
        imageRect.origin.y -= floor(imageRect.size.height/2);
        [_highlightView setFrame:imageRect];
        
        [self addSubview:_highlightView];
    }
    return _highlightView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

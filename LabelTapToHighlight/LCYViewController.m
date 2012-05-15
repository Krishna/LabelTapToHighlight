//
//  LCYViewController.m
//  LabelTapToHighlight
//
//  Created by Krishna Kotecha on 14/05/2012.
//  Copyright (c) 2012 Logic Colony Ltd. All rights reserved.
//

#import "LCYViewController.h"
#import "LCYLabelThaHighlights.h"

@interface LCYViewController ()

@end

@implementation LCYViewController

@synthesize label = _label;
@synthesize highlightingLabel = _highlightingLabel;

- (void) dealloc;
{
    [_highlightingLabel release]; _highlightingLabel = nil;
    [_label release]; _label = nil;
    [super dealloc];
}

- (void) awakeFromNib;
{
//    [super awakeFromNib];
//    [self.highlightingLabel setTarget:self action:@selector(labelWasTapped:)];
}

- (void) viewDidLoad;
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.    
}

- (void) viewDidAppear: (BOOL) animated;
{
    LCYLabelThaHighlights *highlightingLabel = ((LCYLabelThaHighlights *) _highlightingLabel);
    [highlightingLabel setTarget:self action:@selector(labelWasTapped:)];
}

- (void) viewDidUnload;
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.label = nil;
    self.highlightingLabel = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation;
{
    return YES;
}

#pragma mark - Public API

- (IBAction) labelWasTapped : (id) sender;
{
    NSLog(@"Do something bro!");
}

@end

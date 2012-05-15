//
//  LCYViewController.h
//  LabelTapToHighlight
//
//  Created by Krishna Kotecha on 14/05/2012.
//  Copyright (c) 2012 Logic Colony Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCYLabelThatHighlights;

@interface LCYViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UILabel *highlightingLabel;

- (IBAction) labelWasTapped : (id) sender;

@end

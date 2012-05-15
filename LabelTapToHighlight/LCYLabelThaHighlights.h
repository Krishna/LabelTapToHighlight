//
//  LCYLabelThaHighlights.h
//  LabelTapToHighlight
//
//  Created by Krishna Kotecha on 14/05/2012.
//  Copyright (c) 2012 Logic Colony Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCYLabelThaHighlights : UILabel

- (id) initWithFrame: (CGRect) frame;
- (id) initWithCoder: (NSCoder *) decoder;

- (void) setTarget: (id) target action: (SEL) action;

@end

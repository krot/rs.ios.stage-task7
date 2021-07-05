//
//  RSTextField.m
//  firstapp
//
//  Created by Rust Enikeev on 7/5/21.
//

#import <Foundation/Foundation.h>
#import "RSTextField.h"


@implementation RSTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer setBorderWidth:1.5];
    [self.layer setCornerRadius:5];
    
    [self setState:@"ready"];
}

- (void)setState:(NSString *)state {
    if ([state isEqualToString:@"success"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
    } else if ([state isEqualToString:@"error"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
    } else if ([state isEqualToString:@"ready"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Black Coral"].CGColor];
        [self setEnabled:YES];
        [self setAlpha:1];
    }
}

@end

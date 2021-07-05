//
//  RSLoginButton.m
//  firstapp
//
//  Created by Rust Enikeev on 7/5/21.
//

#import <Foundation/Foundation.h>
#import "RSLoginButton.h"

@implementation RSLoginButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.layer setBorderWidth:2];
    [self.layer setCornerRadius:10];
    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
    
    [self setImage:[UIImage imageNamed:@"Person"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"PersonFill"] forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];

    self.clipsToBounds = YES;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2];
    }
    else{
        self.backgroundColor = [UIColor whiteColor];
    }

}

@end

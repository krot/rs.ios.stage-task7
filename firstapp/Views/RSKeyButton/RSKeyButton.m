//
//  RSKeyButton.m
//  firstapp
//
//  Created by Rust Enikeev on 7/5/21.
//

#import <Foundation/Foundation.h>
#import "RSKeyButton.h"


@implementation RSKeyButton

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];

    [self.layer setCornerRadius:25];
    [self.layer setBorderWidth:1.5];
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

//
//  LoginViewController.m
//  firstapp
//
//  Created by Rust Enikeev on 7/5/21.
//

#import "LoginViewController.h"
#import "RSLoginButton.h"
#import "RSTextField.h"

@interface LoginViewController ()

@property (nonatomic, weak) IBOutlet RSTextField *loginTextField;
@property (nonatomic, weak) IBOutlet RSTextField *passwordTextField;

@property (nonatomic, weak) IBOutlet RSLoginButton *loginButton;

@property (nonatomic, weak) IBOutlet UIView *subView;
@property (nonatomic, weak) IBOutlet UILabel *pinLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.pin = [[NSMutableArray alloc] init];
    
    [self setupFields];
}


- (void) setupFields {
    
    [self.subView.layer setBorderWidth:2.0];
    [self.subView.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.subView.layer setCornerRadius:10];
    
    [self.loginTextField setKeyboardType:UIKeyboardTypeASCIICapable];
    self.loginTextField.delegate    = self;

    [self.passwordTextField setSecureTextEntry:YES];
    self.passwordTextField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
}


- (IBAction)editingDidBegin:(RSTextField *)sender {
    [sender setState:@"ready"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return YES;
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (void) login {
    BOOL loginSucceed  = [self loginIsValid] && [self passwordIsValid];
    
    if ([self loginIsValid]) {
        [self.loginTextField setState:@"success"];
    } else {
        [self.loginTextField setState:@"error"];
    }
    
    if ([self passwordIsValid]) {
        [self.passwordTextField setState:@"success"];
    } else {
        [self.passwordTextField setState:@"error"];
    }
    
    if (loginSucceed) {
        [self prepareEnterPin];
    }
}

- (void)showAlert {
    UIAlertController *alertvc=[UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *refreshAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self resetState];
    }];
    [alertvc addAction:refreshAction];
    [self presentViewController:alertvc animated:YES completion:nil];
}

- (IBAction)loginOnTap:(UIButton *)sender forEvent:(UIEvent *)event {
    CGPoint touchLocation = [[[event allTouches] anyObject] locationInView:sender];
    if (CGRectContainsPoint(sender.bounds, touchLocation)) {
        [self login];
    }
    return;
}

- (BOOL)loginIsValid {
    return [self.loginTextField.text isEqualToString:@"username"];
}

- (BOOL)passwordIsValid{
    return [self.passwordTextField.text isEqualToString:@"password"];
}


//MARK: Secure field
- (IBAction)pinTapped:(UIButton *)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* senderValue = [formatter numberFromString:sender.titleLabel.text];
    
    [self.pin addObject: senderValue];
    
    if (self.pin.count == 1) {
        [self.pinLabel setText:@" "];
    }
    
    [self.pinLabel setText:[self.pinLabel.text stringByAppendingFormat: @"%d ", senderValue.intValue]];
    
    if (self.pin.count == 3) {
        if ([self.pin isEqualToArray:@[@1, @3, @2]]) {
            [self.subView.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
            [self showAlert];
        } else {
            [self.pinLabel setText:@"_"];
            [self.pin removeAllObjects];
            [self.subView.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
        }
    } else {
        [self.subView.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

- (void)resetState {

    [self.passwordTextField setState:@"ready"];
    [self.loginTextField setState:@"ready"];

    [self.passwordTextField setText:@""];
    [self.loginTextField setText:@""];

    [self.loginButton setEnabled:YES];
    [self.loginButton setAlpha:1];

    [self.pin removeAllObjects];
    [self.pinLabel setText:@"_"];

    [self.subView setHidden:YES];
    [self.subView.layer setBorderColor:[UIColor clearColor].CGColor];
}

- (void) prepareEnterPin {

    [self.loginButton setEnabled:NO];
    [self.loginButton setAlpha:0.5];

    [self.loginTextField setEnabled:NO];
    [self.loginTextField setAlpha:0.5];

    [self.passwordTextField setEnabled:NO];
    [self.passwordTextField setAlpha:0.5];
    
    [self.subView setHidden:NO];

}

@end

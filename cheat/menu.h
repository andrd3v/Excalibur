#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MenuView : UIView

//Remade by andrdev
//Remade by https://t.me/andrdevv
//Remade by https://github.com/andrd3v

- (instancetype)initWithFrame:(CGRect)frame;
- (void)hideMenu;
- (void)toggleSwitchChanged:(UISwitch *)sender;
- (void)toggleSwitchChangedbox:(UISwitch *)sender;
- (void)handlePan:(UIPanGestureRecognizer *)gesture;
- (void)layoutSubviews;
- (void)centerMenu;
@end

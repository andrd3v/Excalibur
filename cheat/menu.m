#import "menu.h"

//Remade by andrdev
//Remade by https://t.me/andrdevv
//Remade by https://github.com/andrd3v


@implementation MenuView {
    UIView *_headerView;
    UILabel *_headerLabel;
    CGPoint _initialTouchPoint;
    UILabel *_footerLabel;
    UILabel *_pidLabel;
    UILabel *_portLabel;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat headerHeight = 35.0;
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, headerHeight)];
        _headerView.backgroundColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 0.77];
        [self addSubview:_headerView];
        
        _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, headerHeight)];
        _headerLabel.text = @"andrdev coding";
        _headerLabel.textAlignment = NSTextAlignmentCenter;
        [_headerView addSubview:_headerLabel];

        
        UILabel *espLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 230, 50, 80, headerHeight)];
        espLineLabel.text = @"Line";
        espLineLabel.textAlignment = NSTextAlignmentRight;
        espLineLabel.textColor = [UIColor whiteColor];
        [self addSubview:espLineLabel];

        UISwitch *toggleSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(frame.size.width - 60, 50, 60, headerHeight)];
        [toggleSwitch addTarget:self action:@selector(toggleSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        toggleSwitch.onTintColor = [UIColor whiteColor];
        [self addSubview:toggleSwitch];
        
        
        
        UILabel *espLineLabelbox = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 233, 90, 80, headerHeight)];
        espLineLabelbox.text = @"Box";
        espLineLabelbox.textAlignment = NSTextAlignmentRight;
        espLineLabelbox.textColor = [UIColor whiteColor];
        [self addSubview:espLineLabelbox];

        UISwitch *toggleSwitchbox = [[UISwitch alloc] initWithFrame:CGRectMake(frame.size.width - 60, 90, 60, headerHeight)];
        [toggleSwitchbox addTarget:self action:@selector(toggleSwitchChangedbox:) forControlEvents:UIControlEventValueChanged];
        toggleSwitchbox.onTintColor = [UIColor whiteColor];
        [self addSubview:toggleSwitchbox];


        
        
        CGFloat footerHeight = 30.0;
        _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - footerHeight, frame.size.width, footerHeight)];
        _footerLabel.text = @"Hide menu";
        _footerLabel.textAlignment = NSTextAlignmentCenter;
        _footerLabel.textColor = [UIColor whiteColor];
        _footerLabel.backgroundColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 0.77];
        _footerLabel.userInteractionEnabled = YES;
        [self addSubview:_footerLabel];
        
        UITapGestureRecognizer *footerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideMenu)];
        [_footerLabel addGestureRecognizer:footerTapGesture];

        
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [_headerView addGestureRecognizer:panGesture];
        


        self.backgroundColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 0.77];
        self.layer.cornerRadius = 15.0;
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        [self centerMenu];

    }
    return self;
}

//Remade by andrdev
//Remade by https://t.me/andrdevv
//Remade by https://github.com/andrd3v


- (void)hideMenu
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
    }];
}



- (void)toggleSwitchChanged:(UISwitch *)sender
{
    if (sender.isOn) {
        _pidLabel.text = @"start";
    } else {
        NSLog(@"Переключатель выключен");
    }
}

- (void)toggleSwitchChangedbox:(UISwitch *)sender
{
    if (sender.isOn) {
        NSLog(@"Переключатель включен");
    } else {
        NSLog(@"Переключатель выключен");
    }
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture
{
    CGPoint touchPoint = [gesture locationInView:self.superview];
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        _initialTouchPoint = touchPoint;
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGFloat deltaX = touchPoint.x - _initialTouchPoint.x;
        CGFloat deltaY = touchPoint.y - _initialTouchPoint.y;
        
        CGPoint newCenter = CGPointMake(self.center.x + deltaX, self.center.y + deltaY);
        self.center = newCenter;
        
        _initialTouchPoint = touchPoint;
    }
}


//Remade by andrdev
//Remade by https://t.me/andrdevv
//Remade by https://github.com/andrd3v

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self centerMenu];
}

- (void)centerMenu
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self.center = CGPointMake(screenBounds.size.width / 2, screenBounds.size.height / 2);
}


@end


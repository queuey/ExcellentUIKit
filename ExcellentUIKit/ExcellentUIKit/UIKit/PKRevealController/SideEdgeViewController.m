//
//  SideEdgeViewController.m
//  ExcellentUIKit
//
//  Created by Queuey on 16/6/8.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "SideEdgeViewController.h"

#import <PKRevealController/PKRevealController.h>


@interface SideEdgeViewController ()
<
PKRevealing
>

@property (nonatomic, strong) PKRevealController *revealController;
@end

@implementation SideEdgeViewController


#pragma mark - life cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"侧边栏" style:UIBarButtonItemStyleDone target:self action:@selector(setupSideEdge)];
}

#pragma mark - delegate
#pragma mark - PKRevealing

- (void)revealController:(PKRevealController *)revealController didChangeToState:(PKRevealControllerState)state
{
	NSLog(@"%@ (%d)", NSStringFromSelector(_cmd), (int)state);
}

- (void)revealController:(PKRevealController *)revealController willChangeToState:(PKRevealControllerState)next
{
	PKRevealControllerState current = revealController.state;
	NSLog(@"%@ (%d -> %d)", NSStringFromSelector(_cmd), (int)current, (int)next);
}



#pragma mark - event response
- (void)setupSideEdge {
	[self.navigationController presentViewController:self.revealController animated:YES completion:^{
	}];
}


#pragma mark - private methods



#pragma mark - getters and setters
- (PKRevealController *)revealController {
	if (!_revealController) {
		
		UIViewController *frontViewController = [[UIViewController alloc] init];
		frontViewController.view.backgroundColor = [UIColor orangeColor];
		frontViewController.title = @"哈哈";
		UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
		
		UIViewController *rightViewController = [[UIViewController alloc] init];
		rightViewController.view.backgroundColor = [UIColor redColor];
		
		_revealController = [PKRevealController revealControllerWithFrontViewController:frontNavigationController leftViewController:rightViewController rightViewController:nil];
		_revealController.delegate = self;
		_revealController.animationDuration = 0.25;
		
	}
	return _revealController;
}



@end

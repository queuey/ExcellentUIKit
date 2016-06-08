//
//  EmptyTableViewController.m
//  YTKNetwork
//
//  Created by Queuey on 16/6/3.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "EmptyTableViewController.h"

#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>


static NSString * const kTableViewCellID = @"kTableViewCellID";

@interface EmptyTableViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate
>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataSource;


@end


@implementation EmptyTableViewController

#pragma mark - life cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"空TableView样式";
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self.view addSubview:self.tableView];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellID];
	cell.textLabel.text = self.dataSource[indexPath.row];
	return cell;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
	return [UIImage imageNamed:@"emptyTableView_drawer"];
}


- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
	NSLog(@"麻痹的");
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
	
	animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
	animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
	
	animation.duration = 0.25;
	animation.cumulative = YES;
	animation.repeatCount = MAXFLOAT;
	
	return animation;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
	NSString *text = @"Instagram Direct";
	
	NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0f],
								 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
	
	return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
	NSString *text = @"Send Photos and videos directly to your friends Only the people you send to can see these posts.";
	
	NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
	paragraph.lineBreakMode = NSLineBreakByWordWrapping;
	paragraph.alignment = NSTextAlignmentCenter;
	
	NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
								 NSForegroundColorAttributeName: [UIColor lightGrayColor],
								 NSParagraphStyleAttributeName: paragraph};
	
	return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

#pragma mark - getters and setters

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = ({
			UITableView *tableView = [UITableView new];
			tableView.frame = self.view.frame;
			[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellID];
			tableView.tableFooterView = UIView.new;
			tableView.emptyDataSetDelegate = self;
			tableView.emptyDataSetSource = self;
			tableView.delegate = self;
			tableView.dataSource = self;
			tableView;
		});
	}
	return _tableView;
}

- (NSMutableArray *)dataSource {
	if (!_dataSource) {
		_dataSource = [NSMutableArray new];
	}
	return _dataSource;
}

@end

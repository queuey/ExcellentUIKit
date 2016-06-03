//
//  ViewController.m
//  ExcellentUIKit
//
//  Created by Queuey on 16/6/3.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

//
//  ViewController.m
//  YTKNetwork
//
//  Created by Queuey on 16/5/31.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "ViewController.h"

static NSString * const kTableViewCellID = @"kTableViewCellID";


@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataSource;

@property (nonatomic, strong)NSMutableArray *skipSource;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"第三方UI库";
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self addCellTitle:@"空TableView样式" skipViewController:@"EmptyTableViewController"];
	
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSString *skipName = self.skipSource[indexPath.row];
	id skipViewController = NSClassFromString(skipName);
	UIViewController *skipVC = [[skipViewController alloc] init];
	[self.navigationController pushViewController:skipVC animated:YES];
}

#pragma mark - event response



#pragma mark - private methods

- (void)addCellTitle:(NSString *)title skipViewController:(NSString *)skip {
	if (title.length != 0 && skip.length != 0) {
		[self.dataSource addObject:title];
		[self.skipSource addObject:skip];
	}
}


#pragma mark - getters and setters

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = ({
			UITableView *tableView = [UITableView new];
			tableView.frame = self.view.frame;
			[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellID];
			tableView.tableFooterView = UIView.new;
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

- (NSMutableArray *)skipSource {
	if (!_skipSource) {
		_skipSource = [NSMutableArray new];
	}
	return _skipSource;
}

@end

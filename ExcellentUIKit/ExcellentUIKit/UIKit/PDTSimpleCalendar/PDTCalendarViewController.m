//
//  PDTCalendarViewController.m
//  ExcellentUIKit
//
//  Created by Queuey on 16/6/7.
//  Copyright © 2016年 Mr.Q. All rights reserved.
//

#import "PDTCalendarViewController.h"

@interface PDTCalendarViewController ()
<
PDTSimpleCalendarViewDelegate
>

@property (nonatomic, strong)NSArray *calendarArray;

@end

@implementation PDTCalendarViewController


#pragma mark - life cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"日历" style:UIBarButtonItemStylePlain target:self action:@selector(openCalendar)];
	
}


#pragma mark - delegate
- (BOOL)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller isEnabledDate:(NSDate *)date {
	return YES;
}


- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date {
	NSLog(@"date = %@",date);
}



#pragma mark - event response
- (void)openCalendar {
	PDTSimpleCalendarViewController *calendarViewController;
	calendarViewController = [PDTSimpleCalendarViewController new];
	calendarViewController.delegate = self;
	calendarViewController.weekdayHeaderEnabled = YES;
	calendarViewController.weekdayTextType = PDTSimpleCalendarViewWeekdayTextTypeVeryShort;
	calendarViewController.title = @"日历";
	[self.navigationController pushViewController:calendarViewController animated:YES];
}


#pragma mark - private methods



#pragma mark - getters and setters


- (NSArray *)calendarArray {
	if (!_calendarArray) {
		_calendarArray = ({
			NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[NSDate date]];
			components.day = 15;
			NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:components];
			NSDateComponents *addOneMonthComponents = [[NSDateComponents alloc] init];
			addOneMonthComponents.month =1;
			NSDate *date2 = [[NSCalendar currentCalendar] dateByAddingComponents:addOneMonthComponents toDate:date1 options:0];
			NSDate *date3 = [[NSCalendar currentCalendar] dateByAddingComponents:addOneMonthComponents toDate:date2 options:0];
			@[date1, date2, date3];
		});
	}
	return _calendarArray;
}


@end

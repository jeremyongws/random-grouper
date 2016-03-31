//
//  ViewController.m
//  StudentRandomiser
//
//  Created by Jeremy Ong on 31/03/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *studentLabels;
@property NSArray *students;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.students =  @[@"Jeremy", @"Ming Xiang", @"Abdo", @"Faris", @"Daniel", @"Wilson", @"Michael"];
	for (UILabel *student in self.studentLabels){
		student.text = @"";
	}
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)onGeneratePressed:(id)sender {
	NSMutableArray *randomizedArray = [[NSMutableArray alloc] initWithArray:self.students];

	NSUInteger count = [self.students count];
	if (count < 1) return;
	for (NSUInteger i = 0; i < count - 1; ++i) {
		NSInteger remainingCount = count - i;
		NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
		[randomizedArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
	}
	
	for (UILabel *student in self.studentLabels) {
		if ([randomizedArray count] != 0){
			if ([randomizedArray count] == 1){
					student.text = [[randomizedArray objectAtIndex:0] stringByAppendingFormat:@" joins group %u", arc4random_uniform(3) + 1];
			} else {
					student.text = [[randomizedArray objectAtIndex:0] stringByAppendingString:@" "];
			}
			[randomizedArray removeObjectAtIndex:0];
		}
		else {
			break;
		}
	}

	
}

@end

//
//  ViewController.h
//  iOS-Contacts
//
//  Created by Admin on 05/08/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *myTable;
    NSMutableArray *myArray;
}


@end


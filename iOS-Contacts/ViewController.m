//
//  ViewController.m
//  iOS-Contacts
//
//  Created by Admin on 05/08/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myArray = [[NSMutableArray alloc]initWithObjects:@"Aaron", @"Stan", @"Eric", @"Kyle", @"Jennifer", @"Arya", @"Jon", @"Ed", @"Tyler",
               @"Eden", @"Timmy", @"Jimmy", @"Hailey",nil];
    nameDictionary = [[NSMutableDictionary alloc] init];
    
    for(int i=0; i<[myArray count]; i++){
        NSString *name = [myArray objectAtIndex:i];
        NSString *key =  [[name substringToIndex: 1] uppercaseString];
        
        if ([nameDictionary objectForKey:key] != nil) {
            
            NSMutableArray *tempArray = [nameDictionary objectForKey:key];
            [tempArray addObject: name];
            [nameDictionary setObject:tempArray forKey:key];
        } else {
            NSMutableArray *tempArray = [[NSMutableArray alloc] initWithObjects: name, nil];
            [nameDictionary setObject:tempArray forKey:key];
        }
    }
    NSLog(@"%@", nameDictionary);
    titles = [[nameDictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
}


#pragma mark - Table View Data Source 

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return titles;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [nameDictionary count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *sectionTitle = [titles objectAtIndex:section];
    NSArray *sectionNames = [nameDictionary objectForKey:sectionTitle];
    return [sectionNames count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"SimpleTableId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    NSString *main_cell_name;
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSString *sectionName = [titles objectAtIndex:indexPath.section];
    NSArray *arraySection = [nameDictionary objectForKey:sectionName];
    main_cell_name = [arraySection objectAtIndex:indexPath.row];
    cell.textLabel.text = main_cell_name;
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *header = [titles objectAtIndex:section];
    return header;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", cell.textLabel.text);
}


@end

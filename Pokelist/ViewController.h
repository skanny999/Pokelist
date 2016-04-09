//
//  ViewController.h
//  Pokelist
//
//  Created by Riccardo Scanavacca on 08/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray<Pokemon *> *pokemons;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


//
//  DetailViewController.h
//  Pokelist
//
//  Created by Riccardo Scanavacca on 09/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pokeImg;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLbl;
@property (weak, nonatomic) IBOutlet UILabel *weightLbl;
@property (weak, nonatomic) IBOutlet UILabel *attackLbl;
@property (weak, nonatomic) IBOutlet UILabel *defenceLbl;

@property (strong, nonatomic) Pokemon *pokemon;

- (IBAction)dismiss:(id)sender;

@end

//
//  PokeCell.h
//  Pokelist
//
//  Created by Riccardo Scanavacca on 08/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface PokeCell : UITableViewCell

@property(nonatomic, strong, nonnull) Pokemon *pokemon;

@property (weak, nonatomic, nullable) IBOutlet UIImageView *image;
@property (weak, nonatomic, nullable) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic, nullable) IBOutlet UILabel *typeLabel;

-(void)configurePokemonCell: (nonnull Pokemon *)pokemon;


@end

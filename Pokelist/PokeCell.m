//
//  PokeCell.m
//  Pokelist
//
//  Created by Riccardo Scanavacca on 08/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "PokeCell.h"
#import "ViewController.h"

@implementation PokeCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configurePokemonCell: (Pokemon *)aPokemon {
    
    
    self.pokemon = aPokemon;
    

    NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.pokemon.imageUrl]]];
    self.image.image = [UIImage imageWithData: data];

    self.nameLabel.text = self.pokemon.name;
    self.typeLabel.text = self.pokemon.type;

    
}

@end

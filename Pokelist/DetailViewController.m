//
//  DetailViewController.m
//  Pokelist
//
//  Created by Riccardo Scanavacca on 09/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.pokemon.name;
    self.typeLabel.text = self.pokemon.type;
    self.descriptionLabel.text = self.pokemon.descr;
    self.heightLbl.text = [NSString stringWithFormat:@"%@", self.pokemon.height];
    self.weightLbl.text = [NSString stringWithFormat:@"%@", self.pokemon.weight];
    self.attackLbl.text = [NSString stringWithFormat:@"%@", self.pokemon.attack];
    self.defenceLbl.text = [NSString stringWithFormat:@"%@", self.pokemon.defense];
    
    NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.pokemon.imageUrl]]];
    self.pokeImg.image = [UIImage imageWithData: data];


}



- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end

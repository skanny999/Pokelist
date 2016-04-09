//
//  ViewController.m
//  Pokelist
//
//  Created by Riccardo Scanavacca on 08/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "ViewController.h"
#import "PokeCell.h"
#import "PokemonStore.h"
#import "DetailViewController.h"


@interface ViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *indicator;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.pokemons = [[NSMutableArray alloc]init];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicator.center = CGPointMake(160, 240);
    [self.view addSubview:self.indicator];
    [self.indicator startAnimating];

    self.indicator.center = self.view.center;
    [self.view addSubview:self.indicator];
    [self.indicator startAnimating];
    [self loadPokemons];
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableview) name:@"finishedDownloading" object:nil];

}

- (UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    }
    return _indicator;
}

-(void)reloadTableview {
    
    [self.tableView reloadData];
    [self.indicator stopAnimating];
}


-(void)loadPokemons {
    
    for (int i = 1; i <100; i++) {
        
        Pokemon *pokemon = [[Pokemon alloc]initWithPokemonId:[NSString stringWithFormat:@"%i", i]];
        
        [self.pokemons addObject:pokemon];
    }


    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PokeCell *cell = (PokeCell *) [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[PokeCell alloc]init];
    }
    
    Pokemon *pokemon = [self.pokemons objectAtIndex:indexPath.row];
    
    [cell configurePokemonCell:pokemon];
    

    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.pokemons.count;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Pokemon *selectedPokemon = [self.pokemons objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"PokemonDetails" sender:selectedPokemon];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"PokemonDetails"]) {
        
        Pokemon *selectedPokemon = (Pokemon *) sender;
        DetailViewController *destinationViewController = (DetailViewController *) segue.destinationViewController;
        
        if (selectedPokemon && destinationViewController) {
            destinationViewController.pokemon = selectedPokemon;
        } else {
            NSLog(@"Cannot perform segue");
        }

    }
}





@end

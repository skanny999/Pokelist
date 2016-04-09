//
//  Pokemon.h
//  Pokelist
//
//  Created by Riccardo Scanavacca on 08/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#define URL_BASE "http://pokeapi.co"
#define URL_POKEMON "/api/v1/pokemon/"





@interface Pokemon : NSObject


@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *pokemonId;
@property (strong, nonatomic, readonly) NSString *descr;
@property (strong, nonatomic, readonly) NSString *type;
@property (strong, nonatomic, readonly) NSString *height;
@property (strong, nonatomic, readonly) NSString *weight;
@property (strong, nonatomic, readonly) NSString *attack;
@property (strong, nonatomic, readonly) NSString *defense;
@property (strong, nonatomic, readonly) NSString *imageUrl;
@property (strong, nonatomic) NSString *pokemonUrl;
@property (strong, nonatomic) NSMutableArray<Pokemon*> *pokemons;


- (id)initWithPokemonId:(NSString *)aPokemonId;



@end

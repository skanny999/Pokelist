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


typedef void(^onComplete)();


@interface Pokemon : NSObject


@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *pokemonId;
@property (strong, nonatomic) NSString *descr;
@property (strong, nonatomic) NSString *species;
@property (strong, nonatomic) NSString *height;
@property (strong, nonatomic) NSString *weight;
@property (strong, nonatomic) NSString *attack;
@property (strong, nonatomic) NSString *defense;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *pokemonUrl;

- (id)initWithPokemonId:(NSString *)aPokemonId;
- (void)downloadPokemonDetails:(onComplete)completionHandler moveCompletion:(onComplete)moveCompletionHandler;

@end

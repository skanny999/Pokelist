//
//  Pokemon.m
//  Pokelist
//
//  Created by Riccardo Scanavacca on 08/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "Pokemon.h"


@implementation Pokemon

- (id)initWithPokemonId:(NSString *)aPokemonId {
   
    if (self = [super init]) {

    self.pokemonId = aPokemonId;
    self.pokemonUrl = [NSString stringWithFormat:@"%s%s%@/", URL_BASE, URL_POKEMON, self.pokemonUrl];
    }
    return self;
}

- (void)downloadPokemonDetails:(onComplete)completionHandler moveCompletion:(onComplete)moveCompletionHandler {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    
    NSURL *url = [NSURL URLWithString:self.pokemonUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary<NSString *, id> *results = (NSDictionary<NSString*, id> *) responseObject;
            
            NSString *name = (NSString *) [results valueForKey:@"name"];
            if (name) {
                self.name = name;
            } else {
                self.name = @"";
            }
            
            NSString *species = (NSString *) [results valueForKey:@"species"];
            if (species) {
                self.species = species;
            } else {
                self.species = @"";
            }
            
            NSString *defense = (NSString *) [results valueForKey:@"defense"];
            if (defense) {
                self.defense = defense;
            } else {
                self.defense = @"";
            }
            
            NSString *attack = (NSString *) [results valueForKey:@"attack"];
            if (attack) {
                self.attack = attack;
            } else {
                self.attack = @"";
            }
            
            NSString *height = (NSString *) [results valueForKey:@"height"];
            if (height) {
                self.height = height;
            } else {
                self.height = @"";
            }
            
            NSString *weight = (NSString *) [results valueForKey:@"weight"];
            if (weight) {
                self.weight = weight;
            } else {
                self.weight = @"";
        }
            
            
        NSArray<NSDictionary<NSString *, NSString *> *> *imageArray = (NSArray<NSDictionary<NSString *, NSString *> *> *) [results valueForKey:@"sprites"];
        
            if (imageArray && imageArray.count > 0) {
                
                NSString *url = [NSString stringWithFormat:@"%s%@", URL_BASE, [imageArray valueForKey:@"resource_uri"]];
                NSURL *spritesUrl = [NSURL URLWithString:url];
                NSURLRequest *spritesRequest = [NSURLRequest requestWithURL:spritesUrl];
                NSURLSessionDataTask *spritesDataTask = [manager dataTaskWithRequest:spritesRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                    
                    NSDictionary<NSString *, NSString *> *results = (NSDictionary<NSString *, NSString *> *) responseObject;
                    if (responseObject) {
                        NSString *imageUrlString = [results valueForKey:@"image"];
                        
                        if (imageUrlString) {
                            self.imageUrl = imageUrlString;
                        } else {
                            self.imageUrl = @"";
                        }
                        
                    
                    
                    } else {
                        self.imageUrl = @"";
                    }
                    
                    completionHandler();
                    
                    
                }];
                
                [spritesDataTask resume];
                
                
                
                
                
            }
            
        
        NSArray<NSDictionary<NSString *, NSString *> *> *descriptionArray = (NSArray<NSDictionary<NSString *, NSString *> *> *) [results valueForKey:@"description"];
            
            if (descriptionArray && descriptionArray.count > 0) {
                
                NSString *url = [NSString stringWithFormat:@"%s%@", URL_BASE, [descriptionArray[0] valueForKey:@"resource_uri"]];
                NSURL *descriptionUrl = [NSURL URLWithString:url];
                NSURLRequest *descriptionRequest = [NSURLRequest requestWithURL:descriptionUrl];
                
                NSURLSessionDataTask *descriptionDataTask = [manager dataTaskWithRequest:descriptionRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                    
                    NSDictionary<NSString *, id> *results = (NSDictionary<NSString *, id> *) responseObject;
                    if(responseObject) {
                        NSString *pokemonDescription = [(NSString *) results valueForKey:@"description"];
                        if (pokemonDescription) {
                            self.descr = pokemonDescription;
                        } else {
                            self.descr = @"";
                        }
                        
                        
                    } else {
                        self.descr = @"";
                    }
                    
                    completionHandler();
                    
                    
                }];
                
                [descriptionDataTask resume];
                
            }
            
        }
    }];
    
    [dataTask resume];
    
    
}





@end

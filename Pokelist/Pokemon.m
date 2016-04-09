//
//  Pokemon.m
//  Pokelist
//
//  Created by Riccardo Scanavacca on 08/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "Pokemon.h"
#import "ViewController.h"
#import "PokemonStore.h"



@implementation Pokemon

- (id)initWithPokemonId:(NSString *)aPokemonId {
   
    if (self = [super init]) {
        

        [self getPokemonWithId:aPokemonId onCompletion:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errorMessage) {
            
            if (dataDict) {
                
                            NSString *name = (NSString *) [dataDict valueForKey:@"name"];
                            if (name) {
                                _name = name;
                                NSLog(@"%@", name);
                            } else {
                                _name = @"";
                            }
                
                
                            NSString *defense = (NSString *) [dataDict valueForKey:@"defense"];
                            if (defense) {
                                _defense = defense;
                                NSLog(@"%@",defense);
                            } else {
                                _defense = @"";
                            }
                
                
                            NSString *attack = (NSString *) [dataDict valueForKey:@"attack"];
                            if (attack) {
                                _attack = attack;
                                NSLog(@"%@",attack);
                            } else {
                                _attack = @"";
                            }
                
                            
                            NSString *height = (NSString *) [dataDict valueForKey:@"height"];
                            if (height) {
                                _height = height;
                                NSLog(@"%@",height);
                            } else {
                                _height = @"";
                            }
                            
                            NSString *weight = (NSString *) [dataDict valueForKey:@"weight"];
                            if (weight) {
                                _weight = weight;
                                NSLog(@"%@",weight);
                            } else {
                                _weight = @"";
                            }
                
                [self getPokemonImage:dataDict onCompletion:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errorMessage) {
                    
                    if (dataDict) {
                        
                        NSString *imageUrl = [NSString stringWithFormat:@"%s%@", URL_BASE, [dataDict valueForKey:@"image"]];
                        _imageUrl = imageUrl;
                        NSLog(@"%@",imageUrl);
                        
                    }
                    
                }];
                
                [self getPokemonType:dataDict onCompletion:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errorMessage) {
                    
                    if (dataDict) {
                        
                        NSString *type = [dataDict objectForKey:@"name"];
                        _type = type;
                        NSLog(@"%@", type);
                    
                    }
                
                }];
                
                
                            
                [self getPokemonDescription:dataDict onCompletion:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errorMessage) {
                   
                    if (dataDict) {
                        NSString *description = [dataDict objectForKey:@"description"];
                        _descr = description;
                        NSLog(@"%@", description);

                    }
                    
                }];
                
            }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"finishedDownloading" object:nil];
        }];
        

    }
    return self;
}

-(void)getPokemonWithId: (NSString * __nonnull)pokeId onCompletion:(nullable onComplete)completionHandler{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s%@", URL_BASE, URL_POKEMON, pokeId]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
                
            } else {
                completionHandler(nil, @"Data is currupt");
            }
        } else {
            
            completionHandler(nil, @"problem connecting with the server");
        }
        
    }] resume];
    
}

-(void)getPokemonImage: (NSDictionary * __nonnull)pokeDict onCompletion:(nullable onComplete)completionHandler{
    NSArray *spritesArray = [pokeDict valueForKey:@"sprites"];
    NSString *spritesUrlString = [spritesArray[0] valueForKey:@"resource_uri"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%@", URL_BASE, spritesUrlString]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];

            
            if (err == nil) {
                completionHandler(json, nil);
                
            } else {
                completionHandler(nil, @"Data is currupt");
            }
        } else {
            
            completionHandler(nil, @"problem connecting with the server");
        }
        
    }] resume];
    
}


-(void)getPokemonDescription: (NSDictionary * __nonnull)pokeDict onCompletion:(nullable onComplete)completionHandler{
    NSArray *descriptionsArray = [pokeDict valueForKey:@"descriptions"];
    NSString *descriptionsUrlString = [descriptionsArray[0] valueForKey:@"resource_uri"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%@", URL_BASE, descriptionsUrlString]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            
            if (err == nil) {
                completionHandler(json, nil);
                
            } else {
                completionHandler(nil, @"Data is currupt");
            }
        } else {
            
            completionHandler(nil, @"problem connecting with the server");
        }
        
    }] resume];
    
}


-(void)getPokemonType: (NSDictionary * __nonnull)pokeDict onCompletion:(nullable onComplete)completionHandler{
    NSArray *typesArray = [pokeDict valueForKey:@"types"];
    NSString *typesUrlString = [typesArray[0] valueForKey:@"resource_uri"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%@", URL_BASE, typesUrlString]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            
            if (err == nil) {
                completionHandler(json, nil);
                
            } else {
                completionHandler(nil, @"Data is currupt");
            }
        } else {
            
            completionHandler(nil, @"problem connecting with the server");
        }
        
    }] resume];
    
}



@end

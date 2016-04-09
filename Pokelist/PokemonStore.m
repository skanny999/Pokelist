//
//  PokemonStore.m
//  Pokelist
//
//  Created by Riccardo Scanavacca on 09/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "PokemonStore.h"

@implementation PokemonStore

#define URL_BASE "http://pokeapi.co"
#define URL_POKEMON "/api/v1/pokemon/"

+(id)instance {
    static PokemonStore *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
    
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




@end

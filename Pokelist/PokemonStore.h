//
//  PokemonStore.h
//  Pokelist
//
//  Created by Riccardo Scanavacca on 09/04/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^onComplete)(NSDictionary *__nullable dataDict, NSString *__nullable errorMessage);

@interface PokemonStore : NSObject

+(id)instance;
-(void)getPokemonWithId: (NSString * __nonnull)pokeId onCompletion:(nullable onComplete)completionHandler;



@end

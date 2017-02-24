//
//  FastttFilter.m
//  FastttCamera
//
//  Created by Laura Skelton on 3/2/15.
//
//

#import "FastttFilter.h"
#import <GPUImage/GPUImageFilterGroup.h>
#import "FastttLookupFilter.h"
#import "FastttOverlayFilter.h"
#import "FastttEmptyFilter.h"

@interface FastttFilter ()

@property (readwrite, nonatomic, strong) GPUImageOutput<GPUImageInput> *filter;

@end

@implementation FastttFilter

+ (instancetype)filterWithOverlayImage:(UIImage *)overlayImage
{
    return [self filterWithOverlayImage:overlayImage frame:CGRectNull];
}

+ (instancetype)filterWithOverlayImage:(UIImage *)overlayImage frame:(CGRect)frame
{
    FastttFilter *fastFilter = [[self alloc] init];
    
    if (overlayImage) {
        FastttOverlayFilter *overlayFilter = [[FastttOverlayFilter alloc] initWithOverlayImage:overlayImage frame:frame];
        fastFilter.filter = overlayFilter;
    } else {
        FastttEmptyFilter *emptyFilter = [[FastttEmptyFilter alloc] init];
        fastFilter.filter = emptyFilter;
    }
    
    return fastFilter;
}

+ (instancetype)filterWithLookupImage:(UIImage *)lookupImage
{
    FastttFilter *fastFilter = [[self alloc] init];
    
    if (lookupImage) {
        FastttLookupFilter *lookupFilter = [[FastttLookupFilter alloc] initWithLookupImage:lookupImage];
        fastFilter.filter = lookupFilter;
    } else {
        FastttEmptyFilter *emptyFilter = [[FastttEmptyFilter alloc] init];
        fastFilter.filter = emptyFilter;
    }
    
    return fastFilter;
}

+ (instancetype)plainFilter
{
    FastttFilter *fastFilter = [[self alloc] init];
    
    FastttEmptyFilter *emptyFilter = [[FastttEmptyFilter alloc] init];
    
    fastFilter.filter = emptyFilter;
    
    return fastFilter;
}

@end

//
//  FastttOverlayFilter.m
//  FastttCamera
//
//  Created by Liam Don on 2/24/17.
//
//

#import <GPUImage/GPUImagePicture.h>
#import <GPUImage/GPUImageNormalBlendFilter.h>
#import "FastttOverlayFilter.h"

@interface FastttOverlayFilter ()

@property (nonatomic, strong) GPUImagePicture *overlayImageSource;

@end

@implementation FastttOverlayFilter

- (instancetype)initWithOverlayImage:(UIImage *)overlayImage
{
    return [self initWithOverlayImage:overlayImage frame:CGRectNull];
}

- (instancetype)initWithOverlayImage:(UIImage *)overlayImage frame:(CGRect)frame
{
    if ((self = [super init])) {
        _overlayImageSource = [[GPUImagePicture alloc] initWithImage:overlayImage smoothlyScaleOutput:NO];
        
        GPUImageNormalBlendFilter *overlayFilter = [[GPUImageNormalBlendFilter alloc] init];
        [self addFilter:overlayFilter];
        
        if (!CGRectIsNull(frame)) {
            
            [overlayFilter forceProcessingAtSizeRespectingAspectRatio:frame.size];
        }
        
        [_overlayImageSource addTarget:overlayFilter atTextureLocation:1];
        [_overlayImageSource processImage];
        
        self.initialFilters = @[overlayFilter];
        self.terminalFilter = overlayFilter;
    }
    
    return self;
}

@end

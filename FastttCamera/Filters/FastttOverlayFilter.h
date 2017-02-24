//
//  FastttOverlayFilter.h
//  FastttCamera
//
//  Created by Liam Don on 2/24/17.
//
//

#import <GPUImage/GPUImageFilterGroup.h>

/**
 *  Private class to create a GPUImage overlay filter from a UIImage.
 */
@interface FastttOverlayFilter : GPUImageFilterGroup

- (instancetype)initWithOverlayImage:(UIImage *)overlayImage;

- (instancetype)initWithOverlayImage:(UIImage *)overlayImage frame:(CGRect)frame;

@end

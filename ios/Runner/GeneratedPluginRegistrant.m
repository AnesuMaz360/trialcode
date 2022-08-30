//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_social_content_share/FlutterSocialContentSharePlugin.h>)
#import <flutter_social_content_share/FlutterSocialContentSharePlugin.h>
#else
@import flutter_social_content_share;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterSocialContentSharePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterSocialContentSharePlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
}

@end

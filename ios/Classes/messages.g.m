// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v17.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "messages.g.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface PigeonStats ()
+ (PigeonStats *)fromList:(NSArray *)list;
+ (nullable PigeonStats *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation PigeonStats
+ (instancetype)makeWithWeight:(NSInteger )weight
    name:(NSString *)name {
  PigeonStats* pigeonResult = [[PigeonStats alloc] init];
  pigeonResult.weight = weight;
  pigeonResult.name = name;
  return pigeonResult;
}
+ (PigeonStats *)fromList:(NSArray *)list {
  PigeonStats *pigeonResult = [[PigeonStats alloc] init];
  pigeonResult.weight = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.name = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable PigeonStats *)nullableFromList:(NSArray *)list {
  return (list) ? [PigeonStats fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.weight),
    self.name ?: [NSNull null],
  ];
}
@end

@interface DemoApiCodecReader : FlutterStandardReader
@end
@implementation DemoApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [PigeonStats fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface DemoApiCodecWriter : FlutterStandardWriter
@end
@implementation DemoApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PigeonStats class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface DemoApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation DemoApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[DemoApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[DemoApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *DemoApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    DemoApiCodecReaderWriter *readerWriter = [[DemoApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpDemoApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<DemoApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.pigeon_demo.DemoApi.pokePigeon"
        binaryMessenger:binaryMessenger
        codec:DemoApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(pokePigeonWithError:)], @"DemoApi api (%@) doesn't respond to @selector(pokePigeonWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api pokePigeonWithError:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.pigeon_demo.DemoApi.makePigeonSpeak"
        binaryMessenger:binaryMessenger
        codec:DemoApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(makePigeonSpeakText:error:)], @"DemoApi api (%@) doesn't respond to @selector(makePigeonSpeakText:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_text = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        NSString *output = [api makePigeonSpeakText:arg_text error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.pigeon_demo.DemoApi.getPigeonStats"
        binaryMessenger:binaryMessenger
        codec:DemoApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getPigeonStatsWithCompletion:)], @"DemoApi api (%@) doesn't respond to @selector(getPigeonStatsWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api getPigeonStatsWithCompletion:^(PigeonStats *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}

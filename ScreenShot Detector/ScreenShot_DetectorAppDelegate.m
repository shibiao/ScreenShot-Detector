//
//  ScreenShot_DetectorAppDelegate.m
//  ScreenShot Detector
//
//  Created by Dave DeLong on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScreenShot_DetectorAppDelegate.h"

@implementation ScreenShot_DetectorAppDelegate

@synthesize window;
@synthesize queryResults;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    query = [[NSMetadataQuery alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryUpdated:) name:NSMetadataQueryDidStartGatheringNotification object:query];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryUpdated:) name:NSMetadataQueryDidUpdateNotification object:query];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryUpdated:) name:NSMetadataQueryDidFinishGatheringNotification object:query];
    
    [query setDelegate:self];
    [query setPredicate:[NSPredicate predicateWithFormat:@"kMDItemIsScreenCapture = 1"]];
    [query startQuery];
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    [query stopQuery];
    [query setDelegate:nil];
    [query release], query = nil;
    
    [self setQueryResults:nil];
}
//- (id)metadataQuery:(NSMetadataQuery *)query replacementObjectForResultObject:(NSMetadataItem *)result{
//    
//}
//- (id)metadataQuery:(NSMetadataQuery *)query replacementValueForAttribute:(NSString *)attrName value:(id)attrValue{
//    
//}
- (void)queryUpdated:(NSNotification *)note {
    [self setQueryResults:[query results]];
//    NSMetadataItem
    /**
     kMDItemContentTypeTree,
     kMDItemContentType,
     "_kMDItemOwnerUserID",
     kMDItemPhysicalSize,
     kMDItemKind,
     kMDItemDateAdded,
     kMDItemAlternateNames,
     kMDItemContentCreationDate,
     kMDItemContentModificationDate,
     kMDItemLogicalSize,
     kMDItemDisplayName,
     kMDItemBitsPerSample,
     kMDItemHasAlphaChannel,
     kMDItemPixelHeight,
     kMDItemPixelCount,
     kMDItemColorSpace,
     kMDItemOrientation,
     kMDItemResolutionHeightDPI,
     kMDItemResolutionWidthDPI,
     kMDItemPixelWidth,
     kMDItemProfileName,
     kMDItemScreenCaptureType,
     kMDItemIsScreenCapture,
     kMDItemScreenCaptureGlobalRect,
     kMDItemFSName,
     kMDItemFSSize,
     kMDItemFSCreationDate,
     kMDItemFSContentChangeDate,
     kMDItemFSOwnerUserID,
     kMDItemFSOwnerGroupID,
     kMDItemFSNodeCount,
     kMDItemFSInvisible,
     kMDItemFSTypeCode,
     kMDItemFSCreatorCode,
     kMDItemFSFinderFlags,
     kMDItemFSHasCustomIcon,
     kMDItemFSIsExtensionHidden,
     kMDItemFSIsStationery,
     kMDItemFSLabel
     */

    for (NSMetadataItem *item in queryResults) {
        NSLog(@"%@",[item valueForAttribute:NSMetadataItemPathKey]);
        
    }
    
}

@end

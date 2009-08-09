/*
 * AppController.j
 * ChromaHash Demo
 *
 * Created by Chien-An "Zero" Cho on July 5, 2009.
 * Copyright 2009, itsZero All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "ZRChromaHashTextField.j"

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    [contentView setBackgroundColor: [CPColor colorWithHexString:"ECEAEA"]];
    
    var view = [[CPView alloc] initWithFrame: CGRectMakeZero()];
	var y = 0;
	
	var label = [CPTextField labelWithTitle: "Meet Chroma-Hash in Cappuccino"];
    [label setFont:[CPFont boldSystemFontOfSize:30.0]];
    [label sizeToFit];
    [label setTextShadowColor: [CPColor darkGrayColor]];
    [label setTextShadowOffset: CGSizeMake(0, 1)];
    
    var rect = [label frame];
    rect.origin.x = 0;
    rect.origin.y = y;
    y += rect.size.height + 10;
    [label setFrame: rect];
    [view addSubview:label];

	/* Meet our cool Chroma Hash TextField */
    var chromaField = [ZRChromaHashTextField textFieldWithStringValue:"" placeholder:"ChromaHash-Powered Password TextField" width:600];
    [chromaField setFont:[CPFont boldSystemFontOfSize:24.0]];
    [chromaField sizeToFit];
    var rect = [chromaField frame];
    rect.origin.y = y;
    y += rect.size.height + 10;
    [chromaField setFrame: rect];
    [view addSubview:chromaField];

	/* Traditional Password TextField */
    var textField = [CPTextField textFieldWithStringValue:"" placeholder:"Plain-old Password TextField" width:600];
    [textField setFont:[CPFont boldSystemFontOfSize:24.0]];
    [textField sizeToFit];
    [textField setSecure: YES];
    
    /* Move it down by its height + 10 px for padding. */
    var rect = [textField frame];
    rect.origin.y = y;
    y += rect.size.height + 10;
    [textField setFrame: rect];
    [view addSubview:textField];
    
    var btnProject = [CPButton buttonWithTitle: "See Project on Github"];
	[btnProject setTarget: self];
	[btnProject setAction: @selector(goToProject:)];
    [btnProject sizeToFit];
    var rect = [btnProject frame];
    rect.origin.x = 0;
    rect.origin.y = y;
    rect.size.width = 600;
    y += rect.size.height + 10;
    [btnProject setFrame: rect];
    [view addSubview:btnProject];

	var labelAuthor = [CPTextField labelWithTitle: "ZRChromaHashTextField by itsZero 2009."];
    [labelAuthor setFont:[CPFont systemFontOfSize:12.0]];
    [labelAuthor setTextColor: [CPColor darkGrayColor]];
    [labelAuthor sizeToFit];
    [labelAuthor setAlignment: CPRightTextAlignment];
    
    var rect = [labelAuthor frame];
    rect.origin.x = 0;
    rect.origin.y = y;
    rect.size.width = 600;
    y += rect.size.height + 10;
    [labelAuthor setFrame: rect];
    [view addSubview:labelAuthor];
    
    var rect = [view frame];
    rect.size.height = y - 10;
    rect.size.width = 600;
    [view setFrame: rect];
    [view setCenter: [contentView center]];
	[view setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [contentView addSubview: view];
    
    [theWindow orderFront:self];
    [theWindow makeFirstResponder: chromaField];
}

- (void)goToProject:(id)sender
{
	location.href = "http://github.com/itszero/zrchromahashtextfield";
}

@end

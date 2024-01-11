/*************************************************************************/
/*  healthkit.mm                                                         */
/*************************************************************************/
/*                       This file is part of:                            */
/*                           GODOT ENGINE                                */
/*                      https://godotengine.org                          */
/*************************************************************************/
/* Copyright (c) 2007-2021 Juan Linietsky, Ariel Manzur.                 */
/* Copyright (c) 2014-2021 Godot Engine contributors (cf. AUTHORS.md).   */
/*                                                                       */
/* Permission is hereby granted, free of charge, to any person obtaining */
/* a copy of this software and associated documentation files (the        */
/* "Software"), to deal in the Software without restriction, including   */
/* without limitation the rights to use, copy, modify, merge, publish,   */
/* distribute, sublicense, and/or sell copies of the Software, and to    */
/* permit persons to whom the Software is furnished to do so, subject to */
/* the following conditions:                                             */
/*                                                                       */
/* The above copyright notice and this permission notice shall be        */
/* included in all copies or substantial portions of the Software.       */
/*                                                                       */
/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,       */
/* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF    */
/* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.*/
/* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY  */
/* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  */
/* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE     */
/* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                */
/*************************************************************************/

#include "healthkit.h"

#if VERSION_MAJOR == 4
#import "platform/ios/app_delegate.h"
#else
#import "platform/iphone/app_delegate.h"
#endif

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>
#import <HealthKit/HKHealthStore.h>

HealthKit *HealthKit::instance = NULL;

void HealthKit::_bind_methods() {
	ClassDB::bind_method(D_METHOD("is_available"), &HealthKit::is_available);
}

HealthKit *HealthKit::get_singleton() {
	return instance;
}

HealthKit::HealthKit() {
	ERR_FAIL_COND(instance != NULL);
	instance = this;
	NSLog(@"HealthKit::HealthKit()");
}

HealthKit::~HealthKit() {
	NSLog(@"HealthKit::~HealthKit()");
}

bool HealthKit::is_available() const {
	return HKHealthStore.isHealthDataAvailable;
}

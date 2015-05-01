# GraffiTab-iOS-SDK
iOS SDK for easy access to the system's API.

## About

The GraffiTab-iOS-SDK allows you to quickly integrate the GraffiTab API into your iOS application. It provides easy access to all API calls through a set of interfaces.

## Code Example

Coming soon.

## Installation

Download the SDK zip file and extract at a comfortable location. Follow the steps below to initialize and build the framework:
* open Terminal and navigate to the project's directory;
* the framework uses Cocoapods so run `pod install` first;
* open the generated `.workspace` file;
* click on the Pods project and change its Build Settings to `Build Active Architectures Only=NO` so that it builds the framework for all architectures;
* verify that the framework target builds correctly;
* change the scheme to `GraffiTab_iOS_SDK-Universal;
* build the selected scheme;
* the output `.framework` file is located under `Output` in the project's filder;
 
Once the `.framework` file is generated, you can link it to any project by adding it as a framework.

## License

Copyright 2015 GraffiTab

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

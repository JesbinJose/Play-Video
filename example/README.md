# Play Video

![GitHub issues](https://img.shields.io/github/issues/JesbinJose/Play-Video?link=https%3A%2F%2Fgithub.com%2FJesbinJose%2FPlay-Video%2Fissues)
![Pub Version](https://img.shields.io/pub/v/play_video)


A Flutter plugin for iOS, Android and Web for playing back video on a Widget surface.

|  Platform   | Android | iOS   | macOS  | Windows| Web	  |GNU/Linux |
|-------------|---------|-------|--------|--------|-------|----------|
| **Support** | SDK 16+ | 12.0+ | 10.14+ | 7+ 	  | Any\* |	Any\*    |

![The example app running in Andriod](https://github.com/JesbinJose/Play-Video/blob/main/example.gif?raw=true)

## Getting Started

Add this to `pubspec.yaml` file in the project folder

```yaml
dependencies:
	play_video: ^1.0.0
```

### Android

If you are using network-based videos, ensure that the following permission is present in your
Android Manifest file, located in `<project root>/android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### Features

- ✅ Video playback
- ✅ Cross platform
- ✅ Hardware/GPU acceleration
- ✅ Multi video support with next/previous/jump/shuffle
- ✅ Volume/Rate/Pitch/Brightness change
- ✅ Lock/Unlock .
- ✅ Fully customizable controls
- ✅ Screenshot
- ✅ Full video controls in default UI
- ✅ Many functional reusable Widgets
- ✅ More Settings for Speed / Fit  / Etc 
- ✅ Favorites Like/Unlike video
- [Todo] History with time
- [Todo] Playlist 
- [Todo] Favorites/Playlist/History double Validation


### Web

> The Web platform does **not** support `dart:io`, so avoid using the `Video.file` constructor or use VideoType.file . Using the constructor attempts to create a `Video.file` that will throw an `UnimplementedError`. some features may not work on web like volume , brightness . 

\* Different web browsers may have different video-playback capabilities (supported formats, autoplay...). Check [package:video_player_web](https://pub.dev/packages/video_player_web) for more web-specific information.

## Supported Formats

- On iOS and macOS, the backing player is [AVPlayer](https://developer.apple.com/documentation/avfoundation/avplayer).
  The supported formats vary depending on the version of iOS, [AVURLAsset](https://developer.apple.com/documentation/avfoundation/avurlasset) class
  has [audiovisualTypes](https://developer.apple.com/documentation/avfoundation/avurlasset/1386800-audiovisualtypes?language=objc) that you can query for supported av formats.
- On Android, the backing player is [ExoPlayer](https://google.github.io/ExoPlayer/),
  please refer [here](https://google.github.io/ExoPlayer/supported-formats.html) for list of supported formats.
- On Web, available formats depend on your users' browsers (vendor and version). Check [package:video_player_web](https://pub.dev/packages/video_player_web) for more specific information.

## Example

```dart
import  'package:flutter/material.dart';
import  'package:play_video/play_video.dart';

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // For making player ready
  await PlayVideoRender.init();
  runApp(
    const  MaterialApp(
	  debugShowCheckedModeBanner:  false,
	  home:  PlayVideoScreen(),
	 ),
  );
}
```
### Single Video
```dart
class  PlayVideoScreen  extends  StatefulWidget {
  const  PlayVideoScreen({super.key});
  
  @override
  State<PlayVideoScreen> createState() =>  _PlayVideoScreenState();
}

class  _PlayVideoScreenState  extends  State<PlayVideoScreen> {
  late  PlayVideoController  controller;
  @override
  void  initState() {
	controller  =  PlayVideoController(
	  isAutoPlay:  true,
	  videos:  Videos.single(
		videoPath: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
	    type:  VideoType.network,
	 ),
  );
  super.initState();
}

  @override
  void  dispose() {
	controller.dispose();
	super.dispose();
  }

  @override
  Widget  build(BuildContext  context) {
	return  Scaffold(
	  body: PlayVideo(
		controller:  controller,
		width:  MediaQuery.sizeOf(context).width,
		height:  MediaQuery.sizeOf(context).height,
	  ),
	);
  }
}
```

### Multiple Video
```dart
class  PlayVideoScreen  extends  StatefulWidget {
  const  PlayVideoScreen({super.key});
  
  @override
  State<PlayVideoScreen> createState() =>  _PlayVideoScreenState();
}

class  _PlayVideoScreenState  extends  State<PlayVideoScreen> {
  late  PlayVideoController  controller;
  @override
  void  initState() {
	controller  =  PlayVideoController(
	  isAutoPlay:  true,
	  videos:  Videos.multiVideoWithSingleType(
		videos: [
		  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
		  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
		  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
		],
	    type:  VideoType.network,
	 ),
  );
  super.initState();
}

  @override
  void  dispose() {
	controller.dispose();
	super.dispose();
  }

  @override
  Widget  build(BuildContext  context) {
	return  Scaffold(
	  body: PlayVideo(
		controller:  controller,
		width:  MediaQuery.sizeOf(context).width,
		height:  MediaQuery.sizeOf(context).height,
	  ),
	);
  }
}
```
## Usage

Play video with fully customizable Ui and also default ui .Full control over video ,player in the controller it self.
tack your player data using history make playlists etc .

Controls over users every gestures in default ui . 

### Issuses
For any issues [click here](https://github.com/JesbinJose/Play-Video/issues)
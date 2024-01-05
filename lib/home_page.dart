import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: false,
      mediaPlaybackRequiresUserGesture: true,
      allowsInlineMediaPlayback: true,
      // iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    // return CupertinoPageScaffold(
    //     child: InAppWebView(
    //       initialSettings: settings,
    //   initialUrlRequest: URLRequest(url: WebUri("http://music.frps.leefeng.top/")),
    //   shouldOverrideUrlLoading: (controller, web) async {
    //     print("shouldOverrideUrlLoading:${web.request.url}");
    //     return NavigationActionPolicy.ALLOW;
    //   },
    //
    // ));

    return CupertinoPageScaffold(
        child: Center(
      child: CupertinoButton(child: Text("播放"), onPressed: () {
        player.setAudioSource(ConcatenatingAudioSource(
            children:
                [LockCachingAudioSource(
                  Uri.parse("http://music.frps.leefeng.top/rest/stream.view?u=admin&v=1.11.0&c=Amperfy&p=Woaifeng521&id=f5b6dec66fb232eec307cb56cf9ffbdf"),
                  tag: MediaItem(
                    id: 'f5b6dec66fb232eec307cb56cf9ffbdf',
                    album: "",
                    title: 'demo',
                    artUri: Uri.parse("http://music.frps.leefeng.top/rest/getCoverArt.view?u=admin&v=1.11.0&c=Amperfy&p=Woaifeng521&id=al-6c0c979f29578399132056299dd21478_65979ef1"),
                  ),
                )]));
        player.setLoopMode(LoopMode.all);
        player.play();
      }),
    ));
  }
}

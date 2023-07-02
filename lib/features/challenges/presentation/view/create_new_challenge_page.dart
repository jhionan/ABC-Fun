import 'dart:io';

import 'package:aba/core/images.dart';
import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/core/domain/view/widgets/abc_scaffold.dart';
import 'package:aba/core/domain/view/widgets/abc_title_card.dart';
import 'package:aba/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/challenges/presentation/bloc/challenge_bloc.dart';
import 'package:aba/core/domain/view/widgets/abc_button.dart';
import 'package:aba/core/domain/view/widgets/abc_card.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart' as audio;

@RoutePage()
class CreateNewChallengePage extends StatefulWidget {
  const CreateNewChallengePage({super.key});

  @override
  State<CreateNewChallengePage> createState() => _CreateNewChallengePageState();
}

class _CreateNewChallengePageState extends State<CreateNewChallengePage> {
  late final TextEditingController _titleController;
  late ChallengeBloc bloc;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    bloc.add(const ChallengeInitialEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc = context.read<ChallengeBloc>();

    return AbcScaffold(
      adaptativeBuilder: (context, screenType, _) {
        bool isHandset = screenType.isHandset;

        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AbcButton.backButton(
                context: context,
                onPressed: () => context.router.pop(),
              ),
            ),
            SizedBox(
              height: context.dimensions.vMargin * 2,
            ),
            AbcTitleCard(
              imageUrl: Images.performanceIcon,
              title: context.intl.createNewChallengePageTitle,
              description: context.intl.createNewChallengePageDescription,
              descriptionStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AbcColors.primary,
                  ),
              direction: Axis.vertical,
              child: isHandset
                  ? _CreateNewChallengeBody(
                      isHandset: isHandset,
                      titleController: _titleController,
                      bloc: bloc,
                    )
                  : null,
            ),
            SizedBox(
              height: context.dimensions.vMargin,
            ),
            if (!isHandset)
              _CreateNewChallengeBody(
                isHandset: isHandset,
                titleController: _titleController,
                bloc: bloc,
              ),
          ],
        );
      },
    );
  }
}

class _CreateNewChallengeBody extends StatelessWidget {
  const _CreateNewChallengeBody({
    required this.isHandset,
    required this.titleController,
    required this.bloc,
  });
  final bool isHandset;
  final TextEditingController titleController;
  final ChallengeBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ActionTitle(
          titleController: titleController,
        ),

        SizedBox(
          height: context.dimensions.vMargin,
        ),
        //Record Audio
        const _RecordActionAudio(),

        SizedBox(
          height: context.dimensions.hMargin,
        ),
        const _ActionImages(),
        SizedBox(
          height: context.dimensions.hMargin,
        ),
      ],
    );
  }
}

class _ActionTitle extends StatelessWidget {
  const _ActionTitle({required this.titleController});
  final TextEditingController titleController;
  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.intl.createNewChallengePageActionName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        BlocBuilder<ChallengeBloc, ChallengeState>(
          builder: (context, state) {
            String? error;
            if (state is ChallengeNewActionDataState && state.errorNeedTitle) {
              error = context.intl.createNewChallengePageActionNameError;
            }
            return TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: context.intl.createNewChallengePageActionNameHint,
                errorText: error,
                errorStyle: const TextStyle(color: AbcColors.onError),
              ),
              onChanged: (value) => _setTitle(value, bloc),
            );
          },
        ),
      ],
    );
  }

  void _setTitle(String value, ChallengeBloc bloc) {
    bloc.add(CreateNewChallengeNewActionDataEvent(title: value));
  }
}

class _ActionImages extends StatelessWidget {
  const _ActionImages();

  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();
    return BlocBuilder<ChallengeBloc, ChallengeState>(
      builder: (context, state) {
        Future.microtask(() {
          if (state is ChallengeNewActionSavedState) {
            bloc.add(const ChallengeInitialEvent());
            context.router.pop();
          }
        });
        List<String> images = [];
        bool hasError = false;
        if (state is ChallengeNewActionDataState) {
          images = state.imagePaths;
          hasError = state.errorNeedTitle;
        }

        bool hasImages = images.isNotEmpty;

        return AdaptativeScreenBuilder(
          builder: (context, type, constraints) {
            bool isHandset = type.isHandset;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isHandset)
                  Text(
                    context.intl.createNewChallengePageActionImage,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                const SizedBox(
                  height: 4,
                ),
                if (hasImages)
                  AbcCard(
                    padding: EdgeInsets.all(context.dimensions.hMargin),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 16,
                          runSpacing: 16,
                          children: images
                              .map(
                                (e) => Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: FileImage(File(e)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  )
                else
                  AbcCard(
                      padding: const EdgeInsets.all(16),
                      hideCard: isHandset,
                      child: Text(
                        context.intl.createNewChallengePageActionImageHint,
                        // style: Theme.of(context).textTheme.bodyLarge,
                      )),
                SizedBox(
                  height: context.dimensions.hMargin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (images.length < 4) ...[
                      const SizedBox.shrink(),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AbcButton(
                            text: context.intl.buttonLoadImages,
                            onPressed: () => _selectImages(context, bloc),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(
                      width: 4,
                    ),
                    if (images.isNotEmpty)
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: AbcButton.green(
                            text: context.intl.buttonComplete,
                            onPressed: hasError ? null : () => _saveAction(context, bloc),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _selectImages(BuildContext context, ChallengeBloc bloc) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'webp', 'png'],
    );
    if (result != null && result.files.isNotEmpty) {
      {
        bloc.add(
          CreateNewChallengeNewActionDataEvent(
            imagePaths: result.files.where((e) => e.path != null).take(4).map((e) => e.path!).toList(),
          ),
        );
      }
    }
  }

  void _saveAction(BuildContext context, ChallengeBloc bloc) {
    bloc.add(const CreateNewChallengeSaveEvent());
  }
}

class _RecordActionAudio extends StatefulWidget {
  const _RecordActionAudio();

  @override
  State<_RecordActionAudio> createState() => _RecordActionAudioState();
}

class _RecordActionAudioState extends State<_RecordActionAudio> with TickerProviderStateMixin {
  final audio.Record record = audio.Record();
  bool recording = false;
  AudioPlayer audioPlayer = AudioPlayer();
  String? recordedAudioPath;
  bool isPlaying = false;
  Duration? recordedAudioDuration;

  late AnimationController _animationController;
  late AnimationController _recordingAnimationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _recordingAnimationController = AnimationController(
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  void dispose() {
    record.dispose();
    audioPlayer.dispose();
    _animationController.dispose();
    _recordingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();
    return AdaptativeScreenBuilder(builder: (context, screenType, _) {
      bool isHandset = screenType.isHandset;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isHandset)
            Text(
              context.intl.createNewChallengePageActionAudio,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          const SizedBox(
            height: 4,
          ),
          if (isHandset)
            Text(
              context.intl.createNewChallengePageActionAudioHint,
              // style: Theme.of(context).textTheme.bodyLarge,
            )
          else
            AbcCard(
                padding: const EdgeInsets.all(16),
                child: Text(
                  context.intl.createNewChallengePageActionAudioHint,
                  // style: Theme.of(context).textTheme.bodyLarge,
                )),
          SizedBox(
            height: context.dimensions.hMargin,
          ),
          Row(
            children: [
              Align(
                  alignment: isHandset ? Alignment.center : Alignment.centerLeft,
                  child: FadeTransition(
                    opacity: _recordingAnimationController,
                    child: IconButton.filledTonal(
                        onPressed: () => _recordAudio(context, bloc),
                        icon: Icon(recording ? Icons.circle : Icons.mic_rounded)),
                  )),
              const SizedBox(
                width: 16,
              ),
              if (recordedAudioPath != null) ...[
                IconButton.filled(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: _animationController,
                  ),
                  onPressed: () => _playRecordedAudio(context),
                ),
                const SizedBox(
                  width: 16,
                ),
              ]
            ],
          ),
        ],
      );
    });
  }

  Future<void> _recordAudio(BuildContext context, ChallengeBloc bloc) async {
    if (Platform.isMacOS ||
        await Permission.microphone.request().isGranted && await Permission.storage.request().isGranted) {
      if (!await record.isRecording()) {
        _recordingAnimationController.repeat();
        setState(() {
          recording = true;
          recordedAudioPath = null;
          isPlaying = false;
        });
        await record.start();
      } else {
        recordedAudioPath = await record.stop();
        _recordingAnimationController.reset();
        _recordingAnimationController.animateTo(1);
        setState(() {
          recording = false;
        });
        bloc.add(
          CreateNewChallengeNewActionDataEvent(
            audioPath: recordedAudioPath,
          ),
        );
        if (recordedAudioPath != null) {
          bloc.add(CreateNewChallengeNewActionDataEvent(
            audioPath: recordedAudioPath,
          ));
        }
      }
    }
  }

  void _playRecordedAudio(BuildContext context) {
    if (recordedAudioPath != null) {
      if (!isPlaying) {
        setState(() {
          _animationController.forward();
          isPlaying = true;
        });
        audioPlayer.play(DeviceFileSource(recordedAudioPath!));
        audioPlayer.onSeekComplete.listen((event) {
          setState(() {
            isPlaying = false;
            _animationController.reverse();
          });
        });
      } else {
        _animationController.reverse();
        audioPlayer.stop();
        setState(() {
          isPlaying = false;
        });
      }
    }
  }
}

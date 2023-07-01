import 'package:aba/core/images.dart';
import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/core/utils/helpers/path_provider_helper/path_provider_helper.dart';
import 'package:aba/core/utils/widgets/abc_scaffold.dart';
import 'package:aba/core/utils/widgets/abc_title_card.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/challenges/presentation/bloc/challenge_bloc.dart';
import 'package:aba/features/widgets/abc_button.dart';
import 'package:aba/features/widgets/abc_card.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart' as audio;

@RoutePage()
class CreateNewChallengePage extends StatefulWidget {
  const CreateNewChallengePage({super.key});

  @override
  State<CreateNewChallengePage> createState() => _CreateNewChallengePageState();
}

class _CreateNewChallengePageState extends State<CreateNewChallengePage> {
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();

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
        ..._buildImageAction(context),
        SizedBox(
          height: context.dimensions.hMargin,
        ),
      ],
    );
  }

  void _selectImages(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpge', 'webp'],
    );
    if (result != null && result.files.isNotEmpty) {
      {
        bloc.add(CreateNewChallengeNewActionData(
            imagePaths: result.files.where((e) => e.path != null).map((e) => e.path!).toList(),
            audioPath: '',
            title: titleController.text));
      }
    }
  }

  List<Widget> _buildImageAction(BuildContext context) {
    return [
      if (!isHandset)
        Text(
          context.intl.createNewChallengePageActionImage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      const SizedBox(
        height: 4,
      ),
      if (isHandset)
        Text(
          context.intl.createNewChallengePageActionImageHint,
          // style: Theme.of(context).textTheme.bodyLarge,
        )
      else
        AbcCard(
            padding: const EdgeInsets.all(16),
            child: Text(
              context.intl.createNewChallengePageActionImageHint,
              // style: Theme.of(context).textTheme.bodyLarge,
            )),
      SizedBox(
        height: context.dimensions.hMargin,
      ),
      Align(
        alignment: isHandset ? Alignment.center : Alignment.centerLeft,
        child: AbcButton(
          text: context.intl.buttonLoadImages,
          onPressed: () => _selectImages(context),
        ),
      ),
    ];
  }
}

class _ActionTitle extends StatelessWidget {
  const _ActionTitle({required this.titleController});
  final TextEditingController titleController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.intl.createNewChallengePageActionName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: context.intl.createNewChallengePageActionNameHint,
          ),
        ),
      ],
    );
  }
}

class _RecordActionAudio extends StatefulWidget {
  const _RecordActionAudio();

  @override
  State<_RecordActionAudio> createState() => _RecordActionAudioState();
}

class _RecordActionAudioState extends State<_RecordActionAudio> {
  final audio.Record record = audio.Record();
  @override
  void dispose() {
    record.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();
    return AdaptativeScreenBuilder(builder: (context, screenType, _) {
      bool isHandset = screenType.isHandset;
      return Column(
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
          Align(
            alignment: isHandset ? Alignment.center : Alignment.centerLeft,
            child: IconButton.filledTonal(
                onPressed: () => _recordAudio(context, bloc), icon: const Icon(Icons.mic_rounded)),
          ),
        ],
      );
    });
  }

  Future<void> _recordAudio(BuildContext context, ChallengeBloc bloc) async {
    // if (await Permission.microphone.request().isGranted && await Permission.storage.request().isGranted) {

    if (!await record.isRecording()) {
      await record.start();
    } else {
      String? audioPath = await record.stop();
      bloc.add(
        CreateNewChallengeNewActionData(
          audioPath: audioPath,
        ),
      );
      if (audioPath != null) {
        bloc.add(CreateNewChallengeNewActionData(
          audioPath: audioPath,
        ));
      }
    }
  }
}
